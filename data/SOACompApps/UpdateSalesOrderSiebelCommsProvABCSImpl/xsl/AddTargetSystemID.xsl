<xsl:stylesheet version="2.0" xmlns:coresalesorderebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" exclude-result-prefixes="xsl xsd sbldata wsa corecomcust xacml corecom bpws aia ehdr hwf xp20 xref ora ids orcl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  <xsl:template match="/">
    <xsl:variable name="EnterpriseServerName" select="/*/@EnterpriseServerName"/>
    <xsl:variable name="SenderSystemInfoFromEnterpriseServerName">
        <xsl:if test="$EnterpriseServerName!=''">
            <xsl:copy-of select="aia:getEBMHeaderSenderSystemNode('',$EnterpriseServerName)"/>
        </xsl:if>
    </xsl:variable>
    <xsl:variable name="SenderIDFromEnterpriseServerName" select="$SenderSystemInfoFromEnterpriseServerName/ID/text()"/>
    <xsl:variable name="SenderID">
        <xsl:choose>
            <xsl:when test="$SenderIDFromEnterpriseServerName!=''">
                <xsl:value-of select="$SenderIDFromEnterpriseServerName"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="aia:getServiceProperty('{http://xmlns.oracle.com/ABCSImpl/Siebel/Industry/Comms/UpdateSalesOrderSiebelCommsProvABCSImpl/V1}UpdateSalesOrderSiebelCommsProvABCSImpl','Default.SystemID',true())"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <corecom:Sender>
        <corecom:ID>
            <xsl:value-of select="$SenderID"/>
        </corecom:ID>
    </corecom:Sender>
  </xsl:template>


</xsl:stylesheet>
