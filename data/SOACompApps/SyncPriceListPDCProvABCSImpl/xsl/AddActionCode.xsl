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
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationConnectorServiceLibrary/PDC/V1/ProviderABCS/SyncPriceListPDCProvABCSImpl.wsdl"/>
      <rootElement name="SyncPriceListListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.0(build 130301.0647.0008) AT [WED NOV 13 16:11:58 IST 2013]. -->
?>
<xsl:stylesheet version="2.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:eboebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" exclude-result-prefixes="xsi xsl xp20 bpws aia mhdr bpel oraext dvm hwf med ids bpm xdk xref ora socket ldap corecom eboebo">
   <xsl:variable name="XREFSourceCol" select="'COMMON'"/>
   <xsl:template match="/">
      <xsl:apply-templates select="eboebo:SyncPriceListListEBM"/>
   </xsl:template>
   <xsl:template match="eboebo:SyncPriceListListEBM">
      <eboebo:SyncPriceListListEBM>
         <xsl:apply-templates select="corecom:EBMHeader"/>
         <xsl:apply-templates select="eboebo:DataArea"/>
      </eboebo:SyncPriceListListEBM>
   </xsl:template>
   <xsl:template match="eboebo:DataArea/eboebo:SyncPriceListList">
      <eboebo:SyncPriceListList>
         <xsl:variable name="EBMCommonId" select="eboebo:PriceListLine/corecom:ItemReference/corecom:ItemIdentification/corecom:BusinessComponentID"/>
		 <xsl:variable name="targetID">
		  		<xsl:value-of select="aia:getServiceProperty('{http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncPriceListPDCProvABCSImpl/V1}SyncPriceListPDCProvABCSImpl','Default.BRMID',true())"/>
		  </xsl:variable>
         <xsl:variable name="IfBRMIdExists" select="xref:lookupXRef('oramds:/apps/AIAMetaData/xref/ITEM_ITEMID.xref',$XREFSourceCol,$EBMCommonId,$targetID,false())"/>
         <xsl:attribute name="actionCode">
            <xsl:choose>
               <xsl:when test="$IfBRMIdExists != ''">
                  <xsl:text disable-output-escaping="no">update</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="no">add</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>
         <xsl:apply-templates/>
      </eboebo:SyncPriceListList>
   </xsl:template>
   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="eboebo:PlanTier">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <xsl:apply-templates select="*">
            <xsl:sort select="eboebo:RateMinimumQuantity" data-type="text"/>
         </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
