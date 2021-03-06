<?xml version = '1.0' encoding = 'UTF-8'?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationObjectLibrary/Siebel/V1/wsdls/SWIProductIntegrationIO.wsdl"/>
      <rootElement name="SWIProductImportUpsert_Output" namespace="http://siebel.com/asi/V0"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/EnterpriseObjectLibrary/Core/EBO/Item/V2/ItemEBM.xsd"/>
      <rootElement name="SyncItemListResponseEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.3.0(build 070615.0525) AT [FRI FEB 22 12:35:25 IST 2008]. -->
?>
<xsl:stylesheet version="1.0" xmlns:tns="http://siebel.com/asi/V0" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:coreEBOcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xsdLocal1="http://www.siebel.com/xml/SWIProductIntegrationIO" exclude-result-prefixes="xsl tns xsd soapenc soap xsdLocal1 corecomEBO coreEBOcust corecomcust xacml corecom coreeboitem svcdoc wsa coreitemcust xacml-context ehdr xp20 ora orcl bpws hwf xref ids" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  
  <!--  User Defined Templates for XSL Extension -->
  <xsl:template name="MessageProcessingInstructionType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>
  <xsl:template name="SenderType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>  
  <xsl:template name="BusinessScopeType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template> 
  <xsl:template name="EBMTrackingType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>
  <xsl:template name="EMBHeaderType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>

  <xsl:template name="SyncItemListResponseType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>
	  <xsl:template name="InventoryLocationType_ext">
	    <!-- Customers add tranformations here -->
	  </xsl:template>

</xsl:stylesheet>
