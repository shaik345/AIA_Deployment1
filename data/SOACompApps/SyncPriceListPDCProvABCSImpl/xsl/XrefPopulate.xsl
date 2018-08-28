<?xml version='1.0' encoding='UTF-8'?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationConnectorServiceLibrary/PDC/V1/ProviderABCS/SyncPriceListPDCProvABCSImpl.wsdl"/>
      <rootElement name="SyncPriceListListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="ItemEBSResponseRef.wsdl"/>
      <rootElement name="SyncItemListResponseEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.3.0(build 070615.0525) AT [FRI JUN 06 11:33:00 CDT 2008]. -->
?>
<xsl:stylesheet version="2.0" xmlns:ebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:eboebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:str="http://www.oracle.com/XSL/Transform/java/java.lang.String" xmlns:ns1="http://www.oracle.com/communications/pricing" exclude-result-prefixes="xsl xacml-context xref xp20 bpws ora ehdr orcl ids hwf aia wsa corecom coresalesorder sblorderdata sblasi str">
   <xsl:param name="EscapedCommitProductRespMessage"/>
   <xsl:variable name="CommitProductRespMessage" select="orcl:parseEscapedXML($EscapedCommitProductRespMessage)"/>
   <xsl:variable name="TargetSystemID" select="/eboebo:SyncPriceListListEBM/corecom:EBMHeader/corecom:Target/corecom:ID"/>
   <xsl:variable name="XREFTargetCol" select="$TargetSystemID"/>
   <xsl:variable name="XREFSourceCol" select="'COMMON'"/>
   <xsl:template match="/">
      <xsl:apply-templates select="eboebo:SyncPriceListListEBM"/>
   </xsl:template>
   <xsl:template match="eboebo:SyncPriceListListEBM">
      <ebo:SyncPriceListListResponseEBM>
         <xsl:for-each select="$CommitProductRespMessage/ns1:pricingResult[ns1:type = 'CHARGE_OFFERING']">
            <xsl:variable name="PDCExternalID" select="ns1:externalId"/>
            <xsl:variable name="PDCID" select="ns1:pdcID"/>
            <xsl:variable name="EBMExternalCommonId" select="/eboebo:SyncPriceListListEBM/eboebo:DataArea[eboebo:SyncPriceListList/eboebo:PriceListLine/corecom:ItemReference/corecom:SpecificationGroup/corecom:Specification[(corecom:Name = 'InternalItemCode') and (corecom:ValueText = $PDCExternalID)]]/eboebo:SyncPriceListList/eboebo:PriceListLine/corecom:ItemReference/corecom:ItemIdentification/corecom:BusinessComponentID"/>
            <xsl:variable name="EBMInternalRefName" select="/eboebo:SyncPriceListListEBM/eboebo:DataArea[eboebo:SyncPriceListList/eboebo:PriceListLine/corecom:ItemReference/corecom:SpecificationGroup/corecom:Specification[(corecom:Name = 'InternalItemCode') and (corecom:ValueText = $PDCExternalID)]]/eboebo:SyncPriceListList/eboebo:PriceListLine/corecom:ItemReference/corecom:SpecificationGroup/corecom:Specification[corecom:Name = 'InternalItemCode']/corecom:ValueText"/>
            <xsl:variable name="IfExternalIdExists" select="xref:lookupXRef('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,'ITEM_EXTERNALID_01',false())"/>
            <xsl:variable name="IfPDCIdExists" select="xref:lookupXRef('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,$TargetSystemID,false())"/>
            <xsl:variable name="prodID">
               <xsl:if test="boolean($IfExternalIdExists = '' and $IfPDCIdExists = '')">
                  <xsl:choose>
                     <xsl:when test="count(xref:lookupPopulatedColumns('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,false())/column)=0">
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,$TargetSystemID,ns1:pdcID,'ADD')"/>
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,'ITEM_EXTERNALID_01',$PDCExternalID,'ADD')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,$TargetSystemID,ns1:pdcID,'LINK')"/>
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMExternalCommonId,'ITEM_EXTERNALID_01',$PDCExternalID,'LINK')"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:if>
            </xsl:variable>
         </xsl:for-each>
         <xsl:for-each select="$CommitProductRespMessage/ns1:pricingResult[ns1:type = 'CHARGE_RATE_PLAN']">
            <xsl:variable name="PDCID" select="ns1:pdcID"/>
            <xsl:variable name="PDCChargeRatePlanName" select="ns1:name"/>
            <xsl:variable name="IfChargeRatePlanIdExists" select="xref:lookupXRef('oramds:/apps/AIAMetaData/xref/CHARGERATEPLAN_ID.xref',$XREFSourceCol,$PDCChargeRatePlanName,$TargetSystemID,false())"/>
            <xsl:variable name="prodID">
               <xsl:if test="boolean($IfChargeRatePlanIdExists = '')">
                  <xsl:choose>
                     <xsl:when test="count(xref:lookupPopulatedColumns('oramds:/apps/AIAMetaData/xref/CHARGERATEPLAN_ID.xref',$XREFSourceCol,$PDCChargeRatePlanName,false())/column)=0">
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/CHARGERATEPLAN_ID.xref',$XREFSourceCol,$PDCChargeRatePlanName,$TargetSystemID,ns1:pdcID,'ADD')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/CHARGERATEPLAN_ID.xref',$XREFSourceCol,$PDCChargeRatePlanName,$TargetSystemID,ns1:pdcID,'LINK')"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:if>
            </xsl:variable>
         </xsl:for-each>
         <xsl:for-each select="$CommitProductRespMessage/ns1:pricingResult[ns1:type = 'CHARGE_RATE_PLAN_SELECTOR']">
            <xsl:variable name="PDCID" select="ns1:pdcID"/>
            <xsl:variable name="PDCChargeRatePlanSelName" select="ns1:name"/>
            <xsl:variable name="IfChargeRatePlanIdSelExists" select="xref:lookupXRef('oramds:/apps/AIAMetaData/xref/CHARGERATEPLANSELECTOR_ID.xref',$XREFSourceCol,$PDCChargeRatePlanSelName,$TargetSystemID,false())"/>
            <xsl:variable name="prodID">
               <xsl:if test="boolean($IfChargeRatePlanIdSelExists = '')">
                  <xsl:choose>
                     <xsl:when test="count(xref:lookupPopulatedColumns('oramds:/apps/AIAMetaData/xref/CHARGERATEPLANSELECTOR_ID.xref',$XREFSourceCol,$PDCChargeRatePlanSelName,false())/column)=0">
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/CHARGERATEPLANSELECTOR_ID.xref',$XREFSourceCol,$PDCChargeRatePlanSelName,$TargetSystemID,ns1:pdcID,'ADD')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="xref:populateXRefRow('oramds:/apps/AIAMetaData/xref/CHARGERATEPLANSELECTOR_ID.xref',$XREFSourceCol,$PDCChargeRatePlanSelName,$TargetSystemID,ns1:pdcID,'LINK')"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:if>
            </xsl:variable>
         </xsl:for-each>
         <xsl:apply-templates select="@*|node()"/>
      </ebo:SyncPriceListListResponseEBM>
   </xsl:template>
</xsl:stylesheet>
