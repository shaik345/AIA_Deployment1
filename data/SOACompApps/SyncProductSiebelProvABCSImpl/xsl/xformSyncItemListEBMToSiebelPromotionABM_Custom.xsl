<?xml version = '1.0' encoding = 'UTF-8'?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="XSD">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/EnterpriseObjectLibrary/Core/EBO/Item/V2/ItemEBM.xsd"/>
      <rootElement name="SyncItemListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationObjectLibrary/Siebel/V1/wsdls/SWIPromotionIntegrationIO.wsdl"/>
      <rootElement name="SWIPromotionUpsert_Input" namespace="http://siebel.com/asi/SWIPromotionIntegration/"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.4.0(build 080718.0645) AT [SUN JUL 26 08:49:17 IST 2009]. -->
?>
<xsl:stylesheet version="1.0" xmlns:xsdLocal1="http://www.siebel.com/xml/SWIPromotionIntegrationIO" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:tns="http://siebel.com/asi/SWIPromotionIntegration/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" exclude-result-prefixes="xsl ns0 xsd svcdoc corecomEBO wsa ns1 coreitemcust xacml-context corecomcust xacml corecom xsdLocal1 soap soapenc tns bpws ehdr hwf xp20 xref ora ids orcl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">


    <!--  User Defined Templates for XSL Extension -->
  <xsl:template name="ListOfSwiPromotionVbcExt">
    <xsl:comment>In ListOfSwiPromotionVbc</xsl:comment>
  </xsl:template>
  <xsl:template name="SwiPromotionVbcExt">
    <xsl:comment>In SwiPromotionVbc</xsl:comment>
  </xsl:template>

  </xsl:stylesheet>
