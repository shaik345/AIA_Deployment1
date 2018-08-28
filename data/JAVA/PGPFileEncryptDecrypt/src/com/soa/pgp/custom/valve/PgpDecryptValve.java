package com.soa.pgp.custom.valve;

import com.soa.pgp.processor.PGPFileProcessor;

import com.soa.pgp.security.CredentialDetails;

import com.soa.pgp.structure.CommonXMLFileReader;

import com.soa.pgp.structure.FileType;
import com.soa.pgp.structure.Manufacturer;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


import oracle.tip.pc.services.pipeline.AbstractValve;
import oracle.tip.pc.services.pipeline.InputStreamContext;
import oracle.tip.pc.services.pipeline.PipelineException;

/**
 * The class implements methods for decrypting a pgp encrypted file using bouncycastle apis
 */
public class PgpDecryptValve extends AbstractValve{
    
   static CommonXMLFileReader pgpconfig = CommonXMLFileReader.getInstance("config/pgp_configuration.xml");     
   // this is the log handler class
   final static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PgpDecryptValve.class);


    /**
     * the method is invoked at runtime from the jca adapter framework passing in the inputstream
     * @param inputStreamContext
     * @return InputStreamContext
     * @throws PipelineException
     */
    public InputStreamContext execute(InputStreamContext inputStreamContext) throws PipelineException {
        
        InputStream decIn = null;    
                
        try{
            logger.debug("Decryption of File Initiated...");
            String szFilePath = inputStreamContext.getMessageOriginReference();
            String szFileName = szFilePath.substring(szFilePath.lastIndexOf("/")+1);
            logger.info("Decrypting file "+szFileName+" started...");      

            Manufacturer mfr = pgpconfig.getMfrType(szFileName.substring(0,1));
            
            if(mfr != null){                
                int index = szFileName.indexOf(".")+1;                
                logger.debug("Manufacturer identified as :"+mfr.getName());
                
                FileType filetype = null;
                
                //explicit logic for OTA & OTA_Key files
                if(szFileName.contains("key") || szFileName.contains("KEY") || szFileName.contains("Key")){
                    filetype = mfr.getFileType("OTA_KEY");
                }else{
                    filetype = mfr.getFileType(szFileName.substring(index, index+3));
                }
                
                if(filetype != null){                
                    
                    logger.debug("CSF KEY NAME : "+filetype.getCsf_key_name()+" \n Private Key Path : "+filetype.getPrivate_key());
                    
                    String D_KEY_FILE = filetype.getPrivate_key();
                    String csfKeyName = filetype.getCsf_key_name();
                    String csfKeyMap = filetype.getCsf_map_name();
                    
                    logger.debug("Retrieving credentials from CSF store...");
                    
                    String PASSPHRASE = getPassphrase(csfKeyMap, csfKeyName);
                    
                    logger.debug("credentials from CSF store retrieved successfully!!");
                    
                    byte [] buffer = getBytes(inputStreamContext.getInputStream());
                    byte [] decBuffer = null;
                    
                    PGPFileProcessor p = new PGPFileProcessor();
                    //  p.setInputFileName(D_INPUT);
                    // p.setOutputFileName(D_OUTPUT);
                    p.setPassphrase(PASSPHRASE);
                    p.setSecretKeyFileName(D_KEY_FILE); 
                    p.setInputByteStream(buffer);
                    
                    decBuffer = p.decrypt();
                    
                    decIn = new ByteArrayInputStream(decBuffer);
                    //close the input stream passed in this invocation
                    inputStreamContext.closeStream();
                    //set the input stream and return
                    inputStreamContext.setInputStream(decIn);
                    //return inputStreamContext;
                    logger.info("complete, decryption successful!");              
                    
                }else{
                    logger.fatal("No matching file type found. Please check if the file name is valid! If required verify the configuration file.");      
                    throw new Exception("Unable to decrypt file. No matching file type found!");
                }
            } else {
                logger.fatal("No matching manufacturer found. Please check if the file name is valid! If required verify the configuration file.");      
                throw new Exception("Unable to decrypt file. No matching manufacturer found!");
            }            
            
        }catch(Exception e){
            logger.error("Error decrypting input stream... \n", e);
			logger.fatal("Possible corruption or invalid pgp file content. Please verify the file once.");
            inputStreamContext.setInputStream(decIn);
            //e.printStackTrace();
           // throw new PipelineException("Error decrypting InputStream. Please check the log files for more details.");
        }
        
        return inputStreamContext;
    }

    /**
     * @param inputStreamContext
     */
    public void finalize(InputStreamContext inputStreamContext) {
    }

    /**
     */
    public void cleanup() {
    }

    /**
     * converts stream to bytes
     * @param is
     * @return
     * @throws IOException
     */
    public static byte[] getBytes(InputStream is) throws IOException {

        int len;
        int size = 1024;
        byte[] buf;

        if (is instanceof ByteArrayInputStream) {
          size = is.available();
          buf = new byte[size];
          len = is.read(buf, 0, size);
        } else {
          ByteArrayOutputStream bos = new ByteArrayOutputStream();
          buf = new byte[size];
          while ((len = is.read(buf, 0, size)) != -1)
            bos.write(buf, 0, len);
          buf = bos.toByteArray();
        }
        return buf;
      }
    
    //main method for testing purpose only
 /*   public static void main(String[] args) throws Exception{
        
        try{
            String filepath = "chu/4PDH161025001.OTA001.xml.pgp";
            String filename = filepath.substring(filepath.lastIndexOf("/")+1);
            System.out.println("Filename is : "+filename);
            int index = filename.indexOf(".")+1;
            Manufacturer mfr = pgpconfig.getMfrType(filename.substring(0,1));
            
            if(mfr != null){
            logger.debug("manufacturer is :"+mfr.getName());
            logger.debug("File type is :"+filename.substring(index, index+3));
            FileType filetype = mfr.getFileType(filename.substring(index, index+3));
            
                if(filetype != null){
                
                    logger.debug("CSF KEY NAME : "+filetype.getCsf_key_name()+" , CSF KEY MAP :"+filetype.getCsf_map_name()+" , FILE TYPE : "+filetype.getFile_type()+"\n Private Key Path : "+filetype.getPrivate_key());
                }else{
                    logger.debug("No matching Manufacturer File Type found");
                }
            } else {
                logger.debug("No matching Manufacturer found");
            }
            //File file = new File("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\data\\input\\simcardinfofile.txt");
            InputStream inputStream = new FileInputStream("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\data\\output\\simcardinfofile.txt.pgp");
            byte [] buffer = getBytes(inputStream);
            byte [] decBuffer = null;
            PGPFileProcessor p = new PGPFileProcessor();
           // p.setInputFileName("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\encrypt_simcardinfofile.txt.pgp");
           // p.setOutputFileName("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\decrypt_simcardinfofile.txt");
            p.setPassphrase("teliasonera");
            p.setSecretKeyFileName("C:\\Accenture\\telia\\POC\\SamplePGPCode\\pgp\\PGP_keys\\secring.gpg");
            p.setInputByteStream(buffer);
            decBuffer = p.decrypt();
            
            // write the bytes to file            
            FileOutputStream fos = new FileOutputStream("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\data\\input\\decrypted_simcardinfofile.txt");
            fos.write(decBuffer);
            fos.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
*/

    /**
     * the method fetchs the password from CSF store based on supplied MAP & KEY name
     * @param csfKeyMap
     * @param csfKeyName
     * @return String
     * @throws Exception
     */
    private String getPassphrase(String csfKeyMap, String csfKeyName) throws Exception {
        return new CredentialDetails().getPassphraseFromCSFKey(csfKeyMap, csfKeyName);
    }
}
