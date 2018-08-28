<?xml version = '1.0' encoding = 'windows-1252'?>
<xsl:stylesheet version="1.0" xmlns:xsdLocal="http://www.siebel.com/xml/SWIPromotionIntegrationIO" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" exclude-result-prefixes="xsl ns0 xsd svcdoc corecomEBO wsa ns1 coreitemcust xacml-context corecomcust xacml corecom xsdLocal bpws ehdr hwf xp20 xref ora ids orcl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  <xsl:include href="XformUDACommsSiebelPromotionEBMToABM.xsl"/>
  <xsl:include href="XformUDACommsSiebelPromotionEBMToABM_Custom.xsl"/>
  <xsl:template name="ProcessAttributeGroupUDA">
    <xsl:param name="Name"/>
    <xsl:param name="DataArea"/>
    <xsl:choose>
     
      <xsl:when test="$Name='Promotion_More_Information'">
         <xsl:call-template name="Promotion_More_Information">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when>
      <xsl:when test="$Name='Commitment_Terms'">
         <xsl:call-template name="Commitment_Terms">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when>
      <xsl:when test="$Name='Commit_Charge_Credit'">
         <xsl:call-template name="Commit_Charge_Credits">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when>
       <xsl:when test="$Name='Promotion_Upgrade'">
         <xsl:call-template name="Promotion_Upgrade">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when> 
     </xsl:choose>
  
    <xsl:if test="starts-with($Name,'XX')">
      <xsl:call-template name="ProcessCustomAttributeGroupUDA">
        <xsl:with-param name="Name" select="$Name"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
        <!--xsl:when test="$Name='Charge_Plan_Non_Recurring_Charge_Details'">
         <xsl:call-template name="Charge_Plan_Non_Recurring_Charge_Details">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when>
            <xsl:when test="$Name='Charge_Plan_Recurring_Charge_Details'">
         <xsl:call-template name="Charge_Plan_Recurring_Charge_Details">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when>
      <xsl:when test="$Name='Product_Promotions_ChargePlan_Charges_Adjustment_UsagePlanDetails'">
         <xsl:call-template name="Product_Promotions_ChargePlan_Charges_Adjustment_UsagePlanDetails">
          <xsl:with-param name="DataAreaVar" select="$DataArea"/>
      </xsl:call-template>
      </xsl:when-->
</xsl:stylesheet>
