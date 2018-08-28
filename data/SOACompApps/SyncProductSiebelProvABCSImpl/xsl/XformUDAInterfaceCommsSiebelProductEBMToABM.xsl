<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="2.0" xmlns:tns="http://siebel.com/asi/V0" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:ns1="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:coreEBOcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsdLocal="http://www.siebel.com/xml/SWIProductIntegrationIO" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" exclude-result-prefixes="xsl coreeboitem xsd corecomEBO svcdoc ns1 coreEBOcust coreitemcust xacml-context corecomcust xacml corecom xsdLocal bpws ehdr hwf xp20 xref ora ids orcl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  <xsl:include href="XformUDACommsSiebelProductEBMToABM.xsl"/>
  <xsl:include href="XformUDACommsSiebelProductEBMToABM_Custom.xsl"/>
  
  <xsl:template name="ProcessAttributeGroupUDA">
    <xsl:param name="Name"/>
    <xsl:param name="DataArea"/>
    <xsl:choose>
     
    <xsl:when test="starts-with($Name,'XX')">
      <xsl:call-template name="ProcessXAttributeGroupUDA">
        <xsl:with-param name="Name" select="$Name"/>
         <xsl:with-param name="DataArea" select="$DataArea"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:otherwise>
        <xsl:call-template name="ProcessCustomAttributeGroupUDA">
        <xsl:with-param name="Name" select="$Name"/>
         <xsl:with-param name="DataArea" select="$DataArea"/>
      </xsl:call-template>
     </xsl:otherwise>
  
       </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
