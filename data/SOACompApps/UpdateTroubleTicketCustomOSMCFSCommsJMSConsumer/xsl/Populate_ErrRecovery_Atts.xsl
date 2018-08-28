<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:ttebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/TroubleTicket/V1" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" exclude-result-prefixes="xsl xref xp20 bpws ora ehdr orcl ids hwf ttebo corecom mhdr">
   <xsl:template match="/">
      <ttebo:UpdateTroubleTicketEBM>
         <xsl:apply-templates select="ttebo:UpdateTroubleTicketEBM/corecom:EBMHeader"/>
         <xsl:apply-templates select="ttebo:UpdateTroubleTicketEBM/ttebo:DataArea"/>
      </ttebo:UpdateTroubleTicketEBM>
   </xsl:template>
   <xsl:template match="ttebo:UpdateTroubleTicketEBM/ttebo:DataArea">
      <ttebo:DataArea>
         <xsl:apply-templates/>
      </ttebo:DataArea>
   </xsl:template>
   <xsl:template match="ttebo:UpdateTroubleTicketEBM/corecom:EBMHeader">
      <corecom:EBMHeader>
         <xsl:apply-templates/>
      </corecom:EBMHeader>
   </xsl:template>
   <xsl:template match="ttebo:UpdateTroubleTicketEBM/corecom:EBMHeader/corecom:EBMTracking">
      <corecom:EBMTracking>
         <xsl:apply-templates/>
         <xsl:call-template name="ttebo:UpdateTroubleTicketEBM/corecom:EBMHeader/corecom:EBMTracking/corecom:IntermediateMessageHop"/>
      </corecom:EBMTracking>
   </xsl:template>
   <xsl:template match="ttebo:UpdateTroubleTicketEBM/corecom:EBMHeader/corecom:EBMTracking/corecom:IntermediateMessageHop"/>
   <xsl:template name="ttebo:UpdateTroubleTicketEBM/corecom:EBMHeader/corecom:EBMTracking/corecom:IntermediateMessageHop">
      <xsl:variable name="MsgId">
         <xsl:value-of select="mhdr:getProperty(&quot;in.property.jca.jms.JMSMessageID&quot;)"/>
      </xsl:variable>
      <corecom:IntermediateMessageHop>
         <corecom:SenderResourceTypeCode>
            <xsl:value-of select="'QUEUE'"/>
         </corecom:SenderResourceTypeCode>
         <corecom:SenderResourceID>
            <xsl:value-of select="'AIA_UPDTTREQ_JMSQ'"/>
         </corecom:SenderResourceID>
         <corecom:SenderMessageID>
            <xsl:value-of select="$MsgId"/>
         </corecom:SenderMessageID>
      </corecom:IntermediateMessageHop>
   </xsl:template>
   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
