package com.soa.excel;

import java.io.File;
import java.io.IOException;
import jxl.Workbook;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import oracle.xml.parser.v2.XMLElement;

import org.apache.log4j.PropertyConfigurator;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;
import java.io.FileInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import oracle.xml.parser.v2.DOMParser;
import oracle.xml.parser.v2.XMLDocument;
import oracle.xml.parser.v2.XMLParseException;
import org.w3c.dom.Document;

/**
 * The class implements methods for generating Excel file from an xml document element using JXL library implementation
 */
public class GenerateExcel {
    
    // this is the log handler class
    final static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(GenerateExcel.class);
	
    private WritableCellFormat cellFormatter;
    private WritableSheet excelSheet = null;
    private WritableWorkbook wbook = null;
    protected int COLUMN_INDEX = 0;
    protected int ROW_INDEX = 0;

    /**
     * Class default constructor - no params
     */
    public GenerateExcel() {
        super();
        PropertyConfigurator.configure("config/log4j.properties");
    }

    /**
     * Creates a new Excel sheet
     * @param excelFileName
     * @throws IOException
     * @throws WriteException
     */
    private void CreateNewExcel(String excelFileName) throws IOException,
                                                                      WriteException {
        
        // create a file object
        File excelfile = new File(excelFileName);
        //Create an Excel file
        wbook = Workbook.createWorkbook(excelfile);
        
        // create an Excel sheet
        excelSheet = wbook.createSheet("Import SIM Info", 0);
        
    }

    /**
     * Writes Header information for Excel sheet
     * @param data
     * @throws WriteException
     */
    private void WriteExcelHeader(String data) throws WriteException {        
        
        // Write the Header data
        addLabel(excelSheet, COLUMN_INDEX, ROW_INDEX, data);
        COLUMN_INDEX++;
        
    }

    /**
     * Invokes related method to write content information to Excel sheet (column type is text)
     * @param data
     * @throws WriteException
     * @throws RowsExceededException
     */
    private void WriteExcelContent(String data) throws WriteException,
                                                       RowsExceededException {
        // Write the ROW data
        addLabel(excelSheet, COLUMN_INDEX, ROW_INDEX, data.trim());
        COLUMN_INDEX++;        
        
    }

    /**
     * Invokes related method to write content information to Excel sheet (column type is integer)
     * @param data
     * @throws WriteException
     * @throws RowsExceededException
     */
    private void WriteExcelContent(Integer data) throws WriteException,
                                                       RowsExceededException {
        // Write the ROW data
        addNumber(excelSheet, COLUMN_INDEX, ROW_INDEX, data);
        COLUMN_INDEX++;        
        
    }

    /**
     * Writes content information to Excel sheet (column type is text)
     * @param sheet
     * @param column
     * @param row
     * @param data
     * @throws WriteException
     * @throws RowsExceededException
     */
    private void addLabel(WritableSheet sheet, int column, int row, String data)
                            throws WriteException, RowsExceededException {
    
        Label label;
        label = new Label(column, row, data, cellFormatter);
        sheet.setColumnView(column, 20);
        sheet.addCell(label);
    }

    /**
     * Writes content information to Excel sheet (column type is integer)
     * @param sheet
     * @param column
     * @param row
     * @param data
     * @throws WriteException
     * @throws RowsExceededException
     */
    private void addNumber(WritableSheet sheet, int column, int row, Integer data)
                            throws WriteException, RowsExceededException {
    
        jxl.write.Number number;
        number = new jxl.write.Number(column, row, data, cellFormatter);        
        sheet.addCell(number);
    }

    /**
     * Excel Header related formatting
     * @throws WriteException
     */
    private void ApplyHeaderCellFormat() throws WriteException {
        
        // create an ARIAL Font
        WritableFont arial10pt = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);        
                       
        cellFormatter = new WritableCellFormat(arial10pt);
        
        cellFormatter.setBackground(Colour.YELLOW);

        
    }

    /**
     * Excel content related formatting
     * @throws WriteException
     */
    private void ApplyCellFormat() throws WriteException {
        
        // create an ARIAL Font
        WritableFont arial10pt = new WritableFont(WritableFont.ARIAL, 9);        
                       
        cellFormatter = new WritableCellFormat(arial10pt);   
        
    }


    /**
     * Increments Excel ROW & COLUMN indexes
     */
    private void ResetIndexes() {
        
        ROW_INDEX++;
        COLUMN_INDEX = 0;
        
    }

    /**
     * This method can be used to create excelsheet from an input xml document
     * @param input
     * @param targetfile
     * @return
     * @throws IOException
     * @throws WriteException
     */
    public String GenerateExcelFromXML(XMLElement input, String targetfile) throws IOException,
                                                                WriteException {
        
        String response = "success";
        
        // print the root node of the document - not required for our implementation -- <ImportEntities>
        logger.info("Received request : Generating Excel File : start");
        logger.debug("XML Root element is :" + input.getNodeName());
        
        //System.out.println("Root element :" + input.getNodeName());
        
        // Create a NEW EXCEL file -- latter the header & records from xml file will be added to this EXCEL
        CreateNewExcel(targetfile);
        logger.info("Creating a new excel file under :" + targetfile);
        // read the header element & its child nodes - <Header>            
        NodeList nHeaderList = input.getElementsByTagName("Header");
        Node nHeaderNode = nHeaderList.item(0);
        
        // print the header node
        //System.out.println("\n Header Element :" + nHeaderNode.getNodeName());
        logger.debug("Writing Excel Header....: start");
        NodeList nHeaderChildList  = nHeaderNode.getChildNodes();
        
        // loop in the Header child nodes & print in as excel header
        
        // define Excel Header cell formatting
        ApplyHeaderCellFormat();        
        
        for (int temp = 0; temp < nHeaderChildList.getLength(); temp++) {
            
            Node nHeaderChildNode = nHeaderChildList.item(temp);         
            
            if (nHeaderChildNode.getNodeType() == Node.ELEMENT_NODE) {
                
                //System.out.println("\n Current Header-Child-Element is :" + nHeaderChildNode.getNodeName());
                
                WriteExcelHeader(nHeaderChildNode.getLocalName());
            }         
            
        } // loop for header child nodes end here
        
        logger.debug("Writing Excel Header....: complete!");
        /*
        * Start of Entity Element
        */
        
        // read the Related-Entity list & its child nodes - <Related-Entity / *>            
        logger.debug("Writing Excel ROWS for each Entity....: start");
        
        NodeList nRelatedEntityList = input.getElementsByTagName("Related-Entity");
        
        for (int temp = 0, index = 1; temp < nRelatedEntityList.getLength(); temp++, index++) {
            
            Node nRelatedEntityNode = nRelatedEntityList.item(temp);
            
            // print the Related-Entity node
           // System.out.println("\n Related-Entity Element :" + nRelatedEntityNode.getNodeName()); 
            
            NodeList nRelatedEntityChildList  = nRelatedEntityNode.getChildNodes();
            
            // loop in the Related-Entity child nodes & print in as excel items
            
            // define Excel body cell formatting
            ApplyCellFormat();     
            
            // align (increment or reset) the row & coumn index variables in the excel
            ResetIndexes();
            
            for (int count = 0; count < nRelatedEntityChildList.getLength(); count++) {
                
                Node nRelatedEntityChildNode = nRelatedEntityChildList.item(count);         
                
                if (nRelatedEntityChildNode.getNodeType() == Node.ELEMENT_NODE) {
                    
                    //System.out.println("\n Current Related-Entity Child Element is :" + nRelatedEntityChildNode.getNodeName());
                    
                    if((nRelatedEntityChildNode.getLocalName()).equalsIgnoreCase("rowNumber") || (nRelatedEntityChildNode.getLocalName()).equalsIgnoreCase("relatedRow")){
                        /*
                         * if index value is odd : relatedRow is index+1
                         * if index value is even : relatedRow is index-1
                         */ 
                        
                        if((nRelatedEntityChildNode.getLocalName()).equalsIgnoreCase("rowNumber")){
                            
                            WriteExcelContent(index);                            
                        }
                        
                        if((nRelatedEntityChildNode.getLocalName()).equalsIgnoreCase("relatedRow")){
                            
                            if(index % 2 == 0)
                                WriteExcelContent(index - 1);
                            else
                                WriteExcelContent(index+1);
                        }                 
                        
                    }
                    else{
                        WriteExcelContent(nRelatedEntityChildNode.getTextContent());    
                    }
                    
                    
                }         
                
            } // loop for related-entity child nodes end here                         
            
        }// loop for related-entity node ends here
        logger.debug("Writing Excel ROWS for each Entity....: complete!");

        wbook.write();
        wbook.close();
        //System.out.println("Successfully written the Content Information to Excel File!!");
        logger.info("Excel file created successfully.");
        
        return response;
    }


    private void ResetAllIndexes() {
        
        ROW_INDEX = 0;
        COLUMN_INDEX = 0;
    }

    
   
    public static void main(String[] args) {
        
        GenerateExcel generateExcel = new GenerateExcel();
        
        try{
            // create a file object
            File xmlfile = new File("./data/input/sample_request.xml");
            
            // create the document element for reading the xml file
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlfile);
            // optional, but recommended for nomalization of text nodes
            doc.getDocumentElement().normalize();
            
            // print the root node of the document - not required for our implementation -- <ImportEntities>
            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
            
            // Create a NEW EXCEL file -- latter the header & records from xml file will be added to this EXCEL
            generateExcel.CreateNewExcel("./data/output/sample_request.xls");
            
            // read the header element & its child nodes - <Header>            
            NodeList nHeaderList = doc.getElementsByTagName("Header");
            Node nHeaderNode = nHeaderList.item(0);
            
            // print the header node
            System.out.println("\n Header Element :" + nHeaderNode.getNodeName());
            
            NodeList nHeaderChildList  = nHeaderNode.getChildNodes();
            
            // loop in the Header child nodes & print in as excel header
            
            // define Excel Header cell formatting
            generateExcel.ApplyHeaderCellFormat();        
            
            for (int temp = 0; temp < nHeaderChildList.getLength(); temp++) {
                
                Node nHeaderChildNode = nHeaderChildList.item(temp);         
                
                if (nHeaderChildNode.getNodeType() == Node.ELEMENT_NODE) {
                    
                    System.out.println("\n Current Header-Child-Element is :" + nHeaderChildNode.getNodeName());
                    
                    generateExcel.WriteExcelHeader(nHeaderChildNode.getNodeName());
                }         
                
            } // loop for header child nodes end here
            

            
            // read the Related-Entity list & its child nodes - <Related-Entity / *>            
            NodeList nRelatedEntityList = doc.getElementsByTagName("Related-Entity");
            
            for (int temp = 0; temp < nRelatedEntityList.getLength(); temp++) {
                
                Node nRelatedEntityNode = nRelatedEntityList.item(temp);
                
                // print the Related-Entity node
                System.out.println("\n Related-Entity Element :" + nRelatedEntityNode.getNodeName()); 
                
                NodeList nRelatedEntityChildList  = nRelatedEntityNode.getChildNodes();
                
                // loop in the Related-Entity child nodes & print in as excel items
                
                // define Excel body cell formatting
                generateExcel.ApplyCellFormat();     
                
                // align (increment or reset) the row & coumn index variables in the excel
                generateExcel.ResetIndexes();
                
                for (int count = 0; count < nRelatedEntityChildList.getLength(); count++) {
                    
                    Node nRelatedEntityChildNode = nRelatedEntityChildList.item(count);         
                    
                    if (nRelatedEntityChildNode.getNodeType() == Node.ELEMENT_NODE) {
                        
                        System.out.println("\n Current Related-Entity Child Element is :" + nRelatedEntityChildNode.getNodeName());
                        
                        if((nRelatedEntityChildNode.getNodeName()).equalsIgnoreCase("rowNumber") || (nRelatedEntityChildNode.getNodeName()).equalsIgnoreCase("relatedRow")){
                            
                            String data = nRelatedEntityChildNode.getTextContent();
                            
                            generateExcel.WriteExcelContent(Integer.parseInt(data));
                        }
                        else{
                            generateExcel.WriteExcelContent(nRelatedEntityChildNode.getTextContent());    
                        }
                        
                        
                    }         
                    
                } // loop for related-entity child nodes end here             
                
            }
            
            generateExcel.wbook.write();
            generateExcel.wbook.close();
            System.out.println("Successfully written the Content Information to Excel File!!");
            
            
        }catch(Exception e){
            e.printStackTrace();
        }

        // Prepare xml instance document using dom parser            
        
        try {
            
            // align (reset) the row & coumn index variables in the excel
            generateExcel.ResetAllIndexes();
            
            DOMParser parser = new DOMParser();
            parser.retainCDATASection(false);
            parser.setPreserveWhitespace(true);
            
            parser.parse(new FileInputStream("./data/input/sample_request.xml"));
            
            XMLDocument xmlInputDoc = parser.getDocument();
            
            oracle.xml.parser.v2.XMLElement input = xmlInputDoc;
            
            generateExcel.GenerateExcelFromXML(input, "./data/output/sample_request_gen.xls");
            
        } catch (XMLParseException e) {
            e.printStackTrace();
        } catch (SAXException es) {
            es.printStackTrace();
        } catch (IOException eio) {
            eio.printStackTrace();
        } catch (WriteException ew) {
            ew.printStackTrace();
        }

    }


    
}
