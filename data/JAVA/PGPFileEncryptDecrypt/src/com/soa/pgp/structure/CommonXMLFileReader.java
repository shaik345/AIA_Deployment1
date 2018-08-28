package com.soa.pgp.structure;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.log4j.PropertyConfigurator;

import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * The class reads the configuration file for pgp encryption / decryption like filepath,etc.
 */
public class CommonXMLFileReader extends DefaultHandler {
    
    // this is the log handler class
    final static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CommonXMLFileReader.class);
    
    private Manufacturer mfr;
    private FileType filetype;    
    private static Map mfrMap;       
    private String nodetext = "";
    private String key = null;
    private String fileTypekey = null;
    static CommonXMLFileReader instance;

    /**
     * private constructor - singleton implementation 
     * @param szConfigFile
     */
    private CommonXMLFileReader(String szConfigFile) {
      
      super();
      
      mfrMap = new HashMap();
      parseDocument(szConfigFile);
      
      if(logger.isDebugEnabled())
        printData();
    }
    
    // singleton implementation

    /**
     * get an instance of the class - singleton implementation 
     * @param szConfigFile
     * @return
     */
    public static CommonXMLFileReader getInstance(String szConfigFile) {
          
        if(instance == null){
            
          PropertyConfigurator.configure("config/log4j.properties");  
          instance = new CommonXMLFileReader(szConfigFile);
        }
        return instance;
    }


    /**
     * Reads the xonfig file using SAX parser
     * @param szXMLFileName
     */
    private void parseDocument(String szXMLFileName) {    
    
    logger.info("Reading PGP configuration details..."); 
    //get a factory
    SAXParserFactory spf = SAXParserFactory.newInstance();
    try {    
      //get a new instance of parser
      SAXParser sp = spf.newSAXParser();      
      //parse the file and also register this class for call backs
     // sp.parse(szXMLFileName, this);
        File file = new File(szXMLFileName);
        InputStream inputStream= new FileInputStream(file);
        Reader reader = new InputStreamReader(inputStream,"UTF-8");
        
        InputSource is = new InputSource(reader);
        is.setEncoding("UTF-8");
        
        sp.parse(is, this);  
        
      logger.info("Reading PGP configuration details...done!!"); 
    }catch(SAXException se) {
      se.printStackTrace();
    }catch(ParserConfigurationException pce) {
      pce.printStackTrace();
    }catch (IOException ie) {
      ie.printStackTrace();
    }
  }

    /**
     * prints configuration data only when debug flag is enabled
     */
    private void printData(){
      
    logger.debug("No of Manufacturers '" + mfrMap.size() + "'.");    
    
    Iterator it = mfrMap.entrySet().iterator();
    while (it.hasNext()){
      
      Map.Entry me = (Map.Entry)it.next();  
      logger.debug("Manufacturer Id is : "+me.getKey());
      
      
      Manufacturer tmp = (Manufacturer)me.getValue();      
    
      Iterator itfileType = tmp.getFileTypeMap().entrySet().iterator();
      
      while (itfileType.hasNext()){
            Map.Entry mefileType = (Map.Entry)itfileType.next();
            
            FileType ftype = (FileType)mefileType.getValue();
            
            logger.debug("CSF KEY NAME : "+ftype.getCsf_key_name()+" FILE TYPE :"+ftype.getFile_type()+"\n PRIVATE KEY PATH : "+ftype.getPrivate_key());
        }     

    }
    
  }
  
  //Event Handlers
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
      //reset
      nodetext = "";      
      //System.out.println("Start Tag name : "+qName);
      if(qName.equalsIgnoreCase("manufacturer")) {
        //create a new instance of Composite
        key = null;  
        
        mfr = new Manufacturer();               
        
        mfr.setId(attributes.getValue("id"));
        mfr.setName(attributes.getValue("name"));                
                
        key = attributes.getValue("id");
      }
      if(qName.equalsIgnoreCase("file")){
        filetype = new FileType();
        
        filetype.setCsf_key_name(attributes.getValue("csf-key"));
        filetype.setCsf_map_name("SOA");  // hardcoded value
        fileTypekey = attributes.getValue("type");
        filetype.setFile_type(fileTypekey);
        
      }
    }


//Event Handlers
	public void endElement(String uri, String localName, String qName) throws SAXException {
    
	  //System.out.println("close Tag name : "+qName);

	  if(qName.equalsIgnoreCase("file")){
	      filetype.setPrivate_key(nodetext);	    
              mfr.addFileType(filetype, fileTypekey);              
	  }
          
	    if(qName.equalsIgnoreCase("manufacturer")) {
	            //add it to the list
	            mfrMap.put(key, mfr);                       
	    }    
		
	}
  
  public void characters(char[] ch, int start, int length) throws SAXException {
   nodetext =  new String(ch,start,length);
  }

    /**
     * Manufacturer details
     * @param szkey
     * @return Map
     */
    public static Manufacturer getMfrType(String szkey) {
        return (Manufacturer)mfrMap.get(szkey);
    }
}
