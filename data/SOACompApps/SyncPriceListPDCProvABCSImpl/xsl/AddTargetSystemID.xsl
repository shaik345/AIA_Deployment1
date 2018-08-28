<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" exclude-result-prefixes="xsl plnk coresalesorder ns0 ns3 ns5 ns1 client corecustcom ns4 corecom bpws ehdr aia hwf xp20 xref ora ids orcl">
   <xsl:param name="ConfigServiceName">{http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncPriceListPDCProvABCSImpl/V1}SyncPriceListPDCProvABCSImpl</xsl:param>
   <xsl:param name="ConfigPropertyName">Default.SystemID</xsl:param>
   <xsl:template match="/*">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="corecom:EBMHeader">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="corecom:EBMHeader/corecom:Sender">
      <xsl:copy-of select="."/>
      <xsl:if test="not(following-sibling::corecom:Target)">
         <corecom:Target>
            <xsl:variable name="TargetID" select="aia:getServiceProperty($ConfigServiceName,$ConfigPropertyName,true())"/>
            <corecom:ID>
               <xsl:value-of select="$TargetID"/>
            </corecom:ID>
            <corecom:ApplicationTypeCode>
               <xsl:value-of select="aia:getSystemType($TargetID)"/>
            </corecom:ApplicationTypeCode>
         </corecom:Target>
      </xsl:if>
   </xsl:template>
   <xsl:template match="corecom:EBMHeader/corecom:Target">
      <corecom:Target>
         <xsl:copy-of select="@*"/>
         <xsl:variable name="TargetID">
            <xsl:choose>
               <xsl:when test="corecom:ID/text()">
                  <xsl:value-of select="corecom:ID/text()"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="aia:getServiceProperty($ConfigServiceName,$ConfigPropertyName,true())"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <corecom:ID>
            <xsl:copy-of select="corecom:ID/@*"/>
            <xsl:value-of select="$TargetID"/>
         </corecom:ID>
         <xsl:copy-of select="corecom:OverrideRoutingIndicator"/>
         <xsl:copy-of select="corecom:ServiceName"/>
         <corecom:ApplicationTypeCode>
            <xsl:copy-of select="corecom:ApplicationTypeCode/@*"/>
            <xsl:choose>
               <xsl:when test="corecom:ApplicationTypeCode/text()">
                  <xsl:value-of select="corecom:ApplicationTypeCode/text()"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="aia:getSystemType($TargetID)"/>
               </xsl:otherwise>
            </xsl:choose>
         </corecom:ApplicationTypeCode>
         <xsl:copy-of select="corecom:EndPointURI"/>
         <xsl:copy-of select="corecom:Custom"/>
      </corecom:Target>
   </xsl:template>
   <xsl:template match="@*|node()">
      <xsl:copy-of select="."/>
   </xsl:template>
</xsl:stylesheet>
