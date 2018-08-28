package com.soa.pgp.custom.valve;

import com.soa.pgp.processor.PGPFileProcessor;

import com.soa.pgp.structure.CommonXMLFileReader;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.io.OutputStream;

import oracle.tip.pc.services.pipeline.AbstractValve;
import oracle.tip.pc.services.pipeline.InputStreamContext;
import oracle.tip.pc.services.pipeline.PipelineException;

/**
 * The class implements methods for encrypting a text file using bouncycastle apis
 */
public class PgpEncryptValve extends AbstractValve{
    
    static CommonXMLFileReader pgpconfig = CommonXMLFileReader.getInstance("config/pgp_configuration.xml");     
    // this is the log handler class
    final static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PgpEncryptValve.class);

    /**
     * the method is invoked at runtime from the jca adapter framework passing in the inputstream
     * @param inputStreamContext
     * @return
     * @throws PipelineException
     */
    public InputStreamContext execute(InputStreamContext inputStreamContext) throws PipelineException {
                
        InputStream encIn = null;
                 
        try{
            logger.debug("Encryption of File Initiated...");
            String szFileName = inputStreamContext.getMessageOriginReference();
            logger.info("Encrypting file "+szFileName+" started...");                 
            
            String E_KEY_FILE = (String) getPipeline().getPipelineContext().getProperty("manufacturer_pub_key");
            
            byte [] buffer = getBytes(inputStreamContext.getInputStream());
            byte [] encBuffer = null;
            
            PGPFileProcessor p = new PGPFileProcessor();
            
            p.setPublicKeyFileName(E_KEY_FILE);
            p.setInputByteStream(buffer);
            encBuffer = p.encrypt();
            
            encIn = new ByteArrayInputStream(encBuffer);
            //close the input stream passed in this invocation
            inputStreamContext.closeStream();
            //set the input stream and return
            inputStreamContext.setInputStream(encIn);
            //return inputStreamContext;
            logger.info("complete, encryption successful!");              
            
        }catch(Exception e){
            logger.error("Error encrypting input stream... \n", e);
            //e.printStackTrace();
            throw new PipelineException("Error encrypting InputStream. Please check the log files for more details.");
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
/*    public static void main(String[] args) throws Exception{
        
        try{
            //File file = new File("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\data\\input\\simcardinfofile.txt");
            InputStream inputStream = new FileInputStream("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\data\\input\\simcardinfofile.txt");
            byte [] buffer = getBytes(inputStream);
            byte [] encBuffer = null;
            PGPFileProcessor p = new PGPFileProcessor();
           // p.setInputFileName("dummy.txt");
           // p.setOutputFileName("simcardinfofile.txt.pgp");
           // p.setPassphrase(PASSPHRASE);
            p.setPublicKeyFileName("C:\\Accenture\\telia\\POC\\SamplePGPCode\\pgp\\PGP_keys\\pubring.gpg");
            p.setInputByteStream(buffer);
            encBuffer = p.encrypt();
            
            // write the bytes to file            
            FileOutputStream fos = new FileOutputStream("C:\\Accenture\\telia\\POC\\Telia-POCs\\PGPFileEncryptDecrypt\\data\\output\\simcardinfofile.txt.pgp");
            fos.write(encBuffer);
            fos.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }*/
}
