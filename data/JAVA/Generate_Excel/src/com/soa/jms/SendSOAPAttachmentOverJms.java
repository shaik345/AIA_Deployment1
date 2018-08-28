package com.soa.jms;


import com.sun.messaging.xml.MessageTransformer;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

import java.io.InputStream;
import java.io.StringWriter;

import java.nio.charset.Charset;

import java.util.Hashtable;

import javax.activation.DataHandler;

import javax.activation.FileDataSource;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Queue;
import javax.jms.QueueConnection;

import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;

import javax.jms.Session;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.naming.NamingException;

import javax.xml.namespace.QName;
import javax.xml.soap.AttachmentPart;
import javax.xml.soap.MessageFactory;

import javax.xml.soap.SOAPException;

import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import oracle.xml.parser.v2.DOMParser;
import oracle.xml.parser.v2.XMLDocument;
import oracle.xml.parser.v2.XMLElement;
import oracle.xml.parser.v2.XMLParseException;

import org.apache.log4j.PropertyConfigurator;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;


public class SendSOAPAttachmentOverJms {
    
    private static final String CONTEXT_FACTORY_CLASSNAME = "weblogic.jndi.WLInitialContextFactory";
    private static final String CONNECTION_FACTORY_JNDI_NAME = "jms/fmw/SCM_IMPORT_ENTITY";
    private static final String QUEUE_JNDI_NAME = "uim/inventoryWSQueue";
    private static final String REPLYTO_QUEUE_JNDI_NAME = "jms/fmw/UIMNRMAsyncResponseQueue";
    private static final String MIME_HDR_CONTENT_TYPE = "multipart/related;boundary=\"----=_Part_0_640070680.1498829763491\";";
    private static final String _WLS_MIMEHDR_CONTENT_TYPE = "_wls_mimehdrContent_Type";
    private static final String INVENTORY_WS_INVENTORY_WSJMS = "/InventoryWS/InventoryWSJMS";    
    private static final String URI = "URI";
    private static final String BINARY = "binary";
    private static final String ENCODING_TYPE = "Content-Transfer-Encoding";
    
    // this is the log handler class
    final static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(SendSOAPAttachmentOverJms.class);
    
    private String hosturl;
    private String attachmentFile;
    private String messageId;
    private String ATTACHMENT_CONTENT_TYPE = null;
    private String CONTENT_ID =null;

    public SendSOAPAttachmentOverJms() {
        super();
    }
    
    public SendSOAPAttachmentOverJms(String hosturl, String attachmentFile, String messageId) {
        super();
        PropertyConfigurator.configure("config/log4j.properties");  
        this.hosturl = hosturl;
        this.attachmentFile = attachmentFile;
        this.messageId = messageId;
    }

    public static void main(String[] args) {    
        
        SendSOAPAttachmentOverJms sendSOAPAttachmentOverJms = new SendSOAPAttachmentOverJms("t3://tr005staia.ddc.teliasonera.net:8001","C:\\Accenture\\telia\\POC\\Telia-POCs\\Generate_Excel\\data\\input\\2d393135393636353232393735313133_1.xls", "3135393636353232393735313133003");
        
        try {
            
            // creating and XMLElement object from the input file
            DOMParser parser = new DOMParser();
            parser.retainCDATASection(false);
            parser.setPreserveWhitespace(true);
            parser.parse(new FileInputStream("C:\\Accenture\\telia\\POC\\Telia-POCs\\Generate_Excel\\data\\input\\soaprequest.xml"));
            
            XMLDocument xmlInputDoc = parser.getDocument();            
            oracle.xml.parser.v2.XMLElement input = xmlInputDoc;
            
            // Next, read the input xml element
            
            NodeList nElementList = input.getChildNodes();
            
            for (int temp = 0; temp < nElementList.getLength(); temp++) {
                
                Node nElementChildNode = nElementList.item(temp);         
                
                if (nElementChildNode.getNodeType() == Node.ELEMENT_NODE) {
                    
                    System.out.println("\n Current Header-Child-Element is :" + nElementChildNode.getNodeName());
                    
                   
                }         
                
            } // loop for header child nodes end here
            
            sendSOAPAttachmentOverJms.sendMessage(input);
                 
            System.out.println("Invocation successful. Request complete!!");
            
        } catch (XMLParseException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String sendMessage(XMLElement input) throws Exception {       
        

    QueueConnection connection = null;
    QueueSession session = null;
    QueueSender queueSender = null;
    
        try{
            
            logger.info("Creating SOAP message with attachment...");            
            
            String attachmentFileName = attachmentFile.substring(attachmentFile.lastIndexOf("/")+1);
            
            ATTACHMENT_CONTENT_TYPE="application/octet-stream; name="+attachmentFileName;
            CONTENT_ID="<"+attachmentFileName+">";
            
        
            Hashtable<String,String> properties = new Hashtable();
            
            // set the initial context factory & URL for weblogic JMS connectivity
            properties.put(Context.INITIAL_CONTEXT_FACTORY, CONTEXT_FACTORY_CLASSNAME);
            properties.put(Context.PROVIDER_URL, hosturl);
        
            
            /*                 * 
             * SOAP Message creation with attachment
             */
            MessageFactory messageFactory = MessageFactory.newInstance();              
            SOAPMessage soapMessage = messageFactory.createMessage();                
            SOAPPart soapPart = soapMessage.getSOAPPart();
            
            soapPart.setContent(new StreamSource(getSOAPContent(input)));                      
      
            AttachmentPart attachment = buildSoapAttachment(soapMessage);
            
            attachment.setContentType(ATTACHMENT_CONTENT_TYPE);
            attachment.setMimeHeader(ENCODING_TYPE, BINARY);
            attachment.setContentId(CONTENT_ID);
            
            soapMessage.addAttachmentPart(attachment);
            
            soapMessage.saveChanges();            
            
            if(logger.isDebugEnabled()){
                
                String soapMessageLogFile = attachmentFile.substring(0, attachmentFile.lastIndexOf("."))+"_soap.log";
                FileOutputStream fout = new FileOutputStream(new File(soapMessageLogFile));
                soapMessage.writeTo(fout);
                // soapMessage.writeTo(System.out);
            }      
            
            logger.info("Sending message over JMS...");            
            
            InitialContext context = new InitialContext(properties);
            
            logger.debug("Established initial context, looking up connection factory details");            
                        
            QueueConnectionFactory connectionFactory = (QueueConnectionFactory) context.lookup(CONNECTION_FACTORY_JNDI_NAME);
            
            logger.debug("Creating Queue connection ...");            
            
            connection = connectionFactory.createQueueConnection();
            
            logger.debug("Creating Queue session...");            
            
            session = connection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);       
            
            Queue queue = (Queue) context.lookup(QUEUE_JNDI_NAME);
            
            logger.debug("Setting up JMS header properties, JMSReplyTo details.");            
            
            queueSender = session.createSender(queue);      
            
            Message message = MessageTransformer.SOAPMessageIntoJMSMessage(soapMessage, session);
            
           // Add JMS headers
           Queue destQue = (Queue) context.lookup(REPLYTO_QUEUE_JNDI_NAME);
           message.setJMSReplyTo(destQue);
           message.setJMSCorrelationID(messageId);
           message.setStringProperty(URI, INVENTORY_WS_INVENTORY_WSJMS);
           message.setStringProperty(_WLS_MIMEHDR_CONTENT_TYPE,
                                                    MIME_HDR_CONTENT_TYPE);
           logger.debug("Sending message over JMS...started ");             
           
           queueSender.send(message);
           
           logger.info("Sending message over JMS...successful!");             
        
        
    }
    catch(TransformerConfigurationException e){            
        logger.error("Error in creating SOAP Request Message. Check the logs for more details \n", e);
        throw new Exception("Error in creating SOAP Request Message.",e);
    }
    catch(TransformerException e){            
        logger.error("Error in creating SOAP Request Message. Check the logs for more details \n", e);
        throw new Exception("Error in creating SOAP Request Message.",e);
    }
    catch (SOAPException e) {
        logger.error("Error in creating SOAP Request Message. Check the logs for more details \n", e);
        throw new Exception("Error in creating SOAP Request Message.",e);
    } catch (FileNotFoundException e) {
        logger.error("Error in writing SOAP Request Message to log file. Check the logs for more details \n", e);
        throw new Exception("Error in writing SOAP Request Message to log file.",e);
    }
    catch (IOException e) {
        logger.error("Error in writing SOAP Request Message to log file. Check the logs for more details \n", e);
        throw new Exception("Error in writing SOAP Request Message to log file.",e);
    } catch (NamingException e) {
        logger.error("Error in getting initial JMS connection context. Check the logs for more details \n", e);
        throw new Exception("Error in getting initial JMS connection context.",e);
    } catch (JMSException e) {
        logger.error("Error in establishing JMS connection. Check the logs for more details \n", e);
        throw new Exception("Error in establishing JMS connection.",e);
    } catch(Exception e){
        logger.error("Generic error while sending SOAP message over JMS...Please view logs for more details \n", e);
        throw new Exception("Error in sending SOAP message over JMS",e);    
    }
    finally {
        try{    
        queueSender.close();
        session.close();
        connection.close();
        }catch (JMSException e) {
            logger.warn("Error in closing JMS connection. Check the logs for more details \n", e);
        }
    }
        
    return "success";
        
    }
    

    private AttachmentPart buildSoapAttachment(SOAPMessage soapMessage) {
        DataHandler dh = new DataHandler(new FileDataSource(attachmentFile));
        return soapMessage.createAttachmentPart(dh);
    }

    private InputStream getSOAPContent(XMLElement input) throws TransformerConfigurationException,
                                                                               TransformerException {
        
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        DOMSource domsource = new DOMSource(input);
        StreamResult result = new StreamResult(new StringWriter());
        
        transformer.transform(domsource, result);
        
        String strObject = result.getWriter().toString();
        
        String mime_prefix = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\r\n------=_Part_0_640070680.1498829763491\r\nContent-Type: text/xml; charset=us-ascii\r\n\r\n";
        
        String mime_suffix = "\r\n\r\n------=_Part_0_640070680.1498829763491";
        
        String finalSOAPObject = mime_prefix+strObject+mime_suffix;
        
        InputStream is = new ByteArrayInputStream(finalSOAPObject.getBytes());

        return is;
    }
}
