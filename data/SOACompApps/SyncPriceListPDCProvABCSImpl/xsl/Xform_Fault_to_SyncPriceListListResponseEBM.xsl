<?xml version='1.0' encoding='UTF-8'?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
   <source type="XSD">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/EnterpriseObjectLibrary/Core/Common/V2/Meta.xsd"/>
      <rootElement name="Fault" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="PriceListEBSResponseRef.wsdl"/>
      <rootElement name="SyncPriceListListResponseEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.3.0(build 070615.0525) AT [FRI JUN 06 11:33:00 CDT 2008]. -->
?>
<xsl:stylesheet version="1.0" xmlns:corepricelistresp="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:corepricelistebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:str="http://www.oracle.com/XSL/Transform/java/java.lang.String" exclude-result-prefixes="xsl xacml-context xref xp20 bpws ora ehdr orcl ids hwf aia wsa corecom coresalesorder sblorderdata sblasi str" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
   <xsl:include href="Xform_Fault_to_SyncPriceListListResponseEBM_Custom.xsl"/>
   <xsl:param name="EscapedRequestEBM"/>
   <xsl:param name="ReqEBMID"/>
   <xsl:variable name="AmpersandReplacement">&amp;amp;amp;</xsl:variable>
   <xsl:variable name="EscapedRequestEBM_fixed" select="str:replaceAll(string($EscapedRequestEBM),'\u0026(amp;)*+',$AmpersandReplacement)"/>
   <xsl:variable name="SyncPriceListListEBM" select="orcl:parseEscapedXML($EscapedRequestEBM_fixed)"/>
   <xsl:variable name="ConfigServiceName" select="'{http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncPriceListPDCProvABCSImpl/V1}SyncPriceListPDCProvABCSImpl'"/>
   <xsl:variable name="SenderSystem">
      <xsl:choose>
         <xsl:when test="count($SyncPriceListListEBM/corecom:EBMHeader/corecom:Target/corecom:ID) != 0">
            <xsl:value-of select="$SyncPriceListListEBM/corecom:EBMHeader/corecom:Target/corecom:ID"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="aia:getServiceProperty($ConfigServiceName,'Default.SystemID', false())"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:variable>
   <xsl:variable name="TargetID" select="$SyncPriceListListEBM/corecom:EBMHeader/corecom:Sender/corecom:ID"/>
   <xsl:variable name="senderNodeVariable" select="aia:getEBMHeaderSenderSystemNode($SenderSystem,'')"/>
   <xsl:template match="/">
      <xsl:variable name="Status">
         <xsl:value-of select="'Failed'"/>
      </xsl:variable>
      <corepricelistresp:SyncPriceListListResponseEBM>
         <corecom:EBMHeader>
            <xsl:variable name="messageIDVariable" select="orcl:generate-guid()"/>
            <corecom:EBMID>
               <xsl:value-of select="$messageIDVariable"/>
            </corecom:EBMID>
            <corecom:EBMName>
               <xsl:text disable-output-escaping="no">{http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2}SyncPriceListListEBM</xsl:text>
            </corecom:EBMName>
            <corecom:EBOName>
               <xsl:text disable-output-escaping="no">{http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2}SyncPriceListListEBO</xsl:text>
            </corecom:EBOName>
            <corecom:CreationDateTime>
               <xsl:value-of select="xp20:current-dateTime()"/>
            </corecom:CreationDateTime>
            <corecom:RequestEBMID>
               <xsl:value-of select="$ReqEBMID"/>
            </corecom:RequestEBMID>
            <corecom:VerbCode>
               <xsl:text disable-output-escaping="no">Sync</xsl:text>
            </corecom:VerbCode>
            <corecom:MessageProcessingInstruction>
               <xsl:variable name="RouteToCAVS" select="aia:getServiceProperty ($ConfigServiceName,'Routing.PriceListEBSResponseV2.SyncPriceListListResponse.RouteToCAVS', false())='true'"/>
               <corecom:EnvironmentCode>
                  <xsl:choose>
                     <xsl:when test="$RouteToCAVS">
                        <xsl:text>CAVS</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:variable name="EnvCode" select="aia:getServiceProperty($ConfigServiceName, 'Routing.PriceListEBSResponseV2.SyncPriceListListResponse.MessageProcessingInstruction.EnvironmentCode', false())"/>
                        <xsl:choose>
                           <xsl:when test="$EnvCode!=''">
                              <xsl:value-of select="$EnvCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text>PRODUCTION</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:otherwise>
                  </xsl:choose>
               </corecom:EnvironmentCode>
               <corecom:DefinitionID>
                  <xsl:if test="$RouteToCAVS">
                     <xsl:value-of select="aia:getServiceProperty($ConfigServiceName,'Routing.PriceListEBSResponseV2.SyncPriceListListResponse.Address', false())"/>
                  </xsl:if>
               </corecom:DefinitionID>
               <corecom:InstanceID/>
               <xsl:call-template name="MessageProcessingInstructionType_ext"/>
            </corecom:MessageProcessingInstruction>
            <corecom:Sender>
               <corecom:ID>
                  <xsl:value-of select="$senderNodeVariable/ID"/>
               </corecom:ID>
               <corecom:Description>
                  <xsl:value-of select="$senderNodeVariable/Description"/>
               </corecom:Description>
               <corecom:IPAddress>
                  <xsl:value-of select="$senderNodeVariable/IPAddress"/>
               </corecom:IPAddress>
               <corecom:CallingServiceName>
                  <xsl:text disable-output-escaping="no">PriceListEBSResponseV2</xsl:text>
               </corecom:CallingServiceName>
               <corecom:Application>
                  <corecom:ID>
                     <xsl:value-of select="$senderNodeVariable/Application/ID"/>
                  </corecom:ID>
                  <corecom:Version>
                     <xsl:value-of select="$senderNodeVariable/Application/Version"/>
                  </corecom:Version>
               </corecom:Application>
               <corecom:ContactName>
                  <xsl:value-of select="$senderNodeVariable/ContactName"/>
               </corecom:ContactName>
               <corecom:ContactEmail>
                  <xsl:value-of select="$senderNodeVariable/ContactEmail"/>
               </corecom:ContactEmail>
               <corecom:ContactPhoneNumber>
                  <xsl:value-of select="$senderNodeVariable/ContactPhone"/>
               </corecom:ContactPhoneNumber>
               <xsl:call-template name="SenderType_ext"/>
            </corecom:Sender>
            <corecom:Target>
               <corecom:ID>
                  <xsl:value-of select="$TargetID"/>
               </corecom:ID>
               <corecom:ServiceName>
                  <xsl:value-of select="$SyncPriceListListEBM/corecom:EBMHeader/corecom:Sender/corecom:WSAddress/wsa:ReplyTo"/>
               </corecom:ServiceName>
               <xsl:call-template name="TargetType_ext"/>
            </corecom:Target>
            <corecom:BusinessScope>
               <xsl:variable name="processIDVariable" select="orcl:generate-guid()"/>
               <corecom:ID>
                  <xsl:value-of select="concat(&quot;SYNCPRICELISTLIST&quot;,&quot;/&quot;,$processIDVariable)"/>
               </corecom:ID>
               <corecom:InstanceID>
                  <xsl:text disable-output-escaping="no">PIM-to-PDC-Product-Synchronization-Process-Response</xsl:text>
               </corecom:InstanceID>
               <corecom:BusinessScopeTypeCode>
                  <xsl:text disable-output-escaping="no">BusinessProcess</xsl:text>
               </corecom:BusinessScopeTypeCode>
               <corecom:EnterpriseServiceName>
                  <xsl:text disable-output-escaping="no">PriceListEBSResponseV2</xsl:text>
               </corecom:EnterpriseServiceName>
               <corecom:EnterpriseServiceOperationName>
                  <xsl:text disable-output-escaping="no">SyncPriceListListResponse</xsl:text>
               </corecom:EnterpriseServiceOperationName>
               <xsl:call-template name="BusinessScopeType_ext"/>
            </corecom:BusinessScope>
            <corecom:BusinessScope>
               <corecom:ID>
                  <xsl:value-of select="concat(&quot;SYNCPRICELISTLISTRESPMSG&quot;,&quot;/&quot;,$messageIDVariable)"/>
               </corecom:ID>
               <corecom:InstanceID>
                  <xsl:text disable-output-escaping="no">PIM-to-PDC-Product-Synchronization-Process-Response</xsl:text>
               </corecom:InstanceID>
               <corecom:BusinessScopeTypeCode>
                  <xsl:text disable-output-escaping="no">BusinessProcessMessage</xsl:text>
               </corecom:BusinessScopeTypeCode>
               <corecom:EnterpriseServiceName>
                  <xsl:text disable-output-escaping="no">PriceListEBSResponseV2</xsl:text>
               </corecom:EnterpriseServiceName>
               <corecom:EnterpriseServiceOperationName>
                  <xsl:text disable-output-escaping="no">SyncPriceListListResponse</xsl:text>
               </corecom:EnterpriseServiceOperationName>
               <xsl:call-template name="BusinessScopeType_ext"/>
            </corecom:BusinessScope>
            <corecom:EBMTracking>
               <corecom:SequenceNumber>
                  <xsl:value-of select="1.0"/>
               </corecom:SequenceNumber>
               <corecom:ExecutionUnitName>
                  <xsl:text disable-output-escaping="no">SyncPriceListPDCProvABCSImpl.bpel</xsl:text>
               </corecom:ExecutionUnitName>
               <corecom:ImplementationCode>
                  <xsl:text disable-output-escaping="no">BPEL</xsl:text>
               </corecom:ImplementationCode>
               <corecom:ActivityDateTime>
                  <xsl:value-of select="xp20:current-dateTime()"/>
               </corecom:ActivityDateTime>
               <xsl:call-template name="EBMTrackingType_ext"/>
            </corecom:EBMTracking>
            <corecom:MessageBatch>
               <corecom:StatusCode>
                  <xsl:value-of select="$Status"/>
               </corecom:StatusCode>
               <xsl:copy-of select="$SyncPriceListListEBM/corecom:EBMHeader/corecom:MessageBatch/corecom:ID"/>
               <xsl:copy-of select="$SyncPriceListListEBM/corecom:EBMHeader/corecom:MessageBatch/corecom:Name"/>
               <xsl:copy-of select="$SyncPriceListListEBM/corecom:EBMHeader/corecom:MessageBatch/corecom:BatchParameter"/>
            </corecom:MessageBatch>
            <xsl:copy-of select="/corecom:Fault/corecom:FaultNotification"/>
            <xsl:call-template name="EBMHeaderType_ext"/>
         </corecom:EBMHeader>
         <xsl:for-each select="$SyncPriceListListEBM/corepricelistresp:DataArea">
            <corepricelistresp:DataArea>
               <corecom:Sync/>
               <corepricelistresp:SyncPriceListListResponse>
                  <corepricelistresp:PriceListLine>
                     <corecom:ItemReference>
                        <xsl:copy-of select="corepricelistresp:SyncPriceListList/corepricelistresp:PriceListLine/corecom:ItemReference/corecom:ItemIdentification"/>
                     </corecom:ItemReference>
                  </corepricelistresp:PriceListLine>
               </corepricelistresp:SyncPriceListListResponse>
            </corepricelistresp:DataArea>
         </xsl:for-each>
      </corepricelistresp:SyncPriceListListResponseEBM>
   </xsl:template>
</xsl:stylesheet>
