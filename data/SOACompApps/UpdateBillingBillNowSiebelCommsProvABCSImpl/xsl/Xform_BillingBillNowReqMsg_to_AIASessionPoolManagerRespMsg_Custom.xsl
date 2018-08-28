<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
                xmlns:client="http://xmlns.oracle.com/AIASessionPoolManager"
		xmlns:ns1ebo="http://xmlns.oracle.com/BRM/schemas/BusinessOpcodes"
		
		
		xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
                xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04"
                
		
		
		xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions"
                xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing"
                xmlns:str="http://www.oracle.com/XSL/Transform/java/java.lang.String"
                exclude-result-prefixes="xsl xacml-context xref xp20 bpws ora ehdr orcl ids hwf aia wsa corecom coresalesorder sblorderdata sblasi">

  <xsl:template name="EBMHeaderType_ext">
    <xsl:param name="RequestCustomElement"/>
    <!-- Customers add tranformations here -->
    <xsl:copy-of select="$RequestCustomElement"/>
  </xsl:template>

  <xsl:template name="SenderType_ext">
    <xsl:param name="RequestCustomElement"/>
    <!-- Customers add tranformations here -->
    <xsl:copy-of select="$RequestCustomElement"/>
  </xsl:template>

  <xsl:template name="TargetType_ext">
    <xsl:param name="RequestCustomElement"/>
    <!-- Customers add tranformations here -->
    <xsl:copy-of select="$RequestCustomElement"/>
  </xsl:template>

  <xsl:template name="MessageProcessingInstructionType_ext">
    <xsl:param name="RequestCustomElement"/>
    <!-- Customers add tranformations here -->
    <xsl:copy-of select="$RequestCustomElement"/>
  </xsl:template>

  <xsl:template name="EBMTrackingType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>

  <xsl:template name="BusinessScopeType_ext">
    <!-- Customers add tranformations here -->
  </xsl:template>
  
 <!--
 Add all you scenario specific custom elements here

 -->

</xsl:stylesheet>
