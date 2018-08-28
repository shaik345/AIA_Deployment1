<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" xmlns:ebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:eboebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:str="http://www.oracle.com/XSL/Transform/java/java.lang.String" exclude-result-prefixes="xsl xacml-context xref xp20 bpws ora ehdr orcl ids hwf aia wsa corecom coresalesorder sblorderdata sblasi str">
   <xsl:template match="corecom:EBMHeader">
      <corecom:EBMHeader>
         <xsl:variable name="EBMID" select="orcl:generate-guid()"/>
         <corecom:EBMID>
            <xsl:value-of select="$EBMID"/>
         </corecom:EBMID>
         <corecom:EBMName>
            <xsl:text>{http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2}SyncItemListResponseEBM</xsl:text>
         </corecom:EBMName>
         <corecom:EBOName>
            <xsl:text>{http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2}SyncItemEBO</xsl:text>
         </corecom:EBOName>
         <corecom:CreationDateTime>
            <xsl:value-of select="xp20:current-dateTime()"/>
         </corecom:CreationDateTime>
         <corecom:RequestEBMID>
            <xsl:value-of select="corecom:EBMID"/>
         </corecom:RequestEBMID>
         <corecom:VerbCode>
            <xsl:text>Sync</xsl:text>
         </corecom:VerbCode>
         <corecom:MessageProcessingInstruction>
            <xsl:variable name="ConfigServiceName" select="'{http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncItemListPDCProvABCSImpl/V1}SyncItemListPDCProvABCSImpl'"/>
            <xsl:variable name="RouteToCAVS" select="aia:getServiceProperty($ConfigServiceName,'Routing.ItemEBSResponseV2.SyncItemListResponse.RouteToCAVS',false())='true'"/>
            <corecom:EnvironmentCode>
               <xsl:choose>
                  <xsl:when test="$RouteToCAVS">
                     <xsl:text>CAVS</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:variable name="EnvCode" select="aia:getServiceProperty($ConfigServiceName,'Routing.ItemEBSResponseV2.SyncItemListResponse.MessageProcessingInstruction.EnvironmentCode',false())"/>
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
                  <xsl:value-of select="aia:getServiceProperty($ConfigServiceName,'Routing.ItemEBSResponseV2.SyncItemListResponse.CAVS.EndpointURI',false())"/>
               </xsl:if>
            </corecom:DefinitionID>
            <xsl:call-template name="MessageProcessingInstructionType_ext">
               <xsl:with-param name="RequestCustomElement" select="corecom:MessageProcessingInstruction/corecom:Custom"/>
            </xsl:call-template>
         </corecom:MessageProcessingInstruction>
         <corecom:Sender>
            <corecom:ID>
               <xsl:value-of select="corecom:Target/corecom:ID"/>
            </corecom:ID>
            <xsl:copy-of select="corecom:Sender/corecom:WSAddress"/>
            <xsl:call-template name="SenderType_ext">
               <xsl:with-param name="RequestCustomElement" select="corecom:Target/corecom:Custom"/>
            </xsl:call-template>
         </corecom:Sender>
         <corecom:Target>
            <corecom:ID>
               <xsl:value-of select="corecom:Sender/corecom:ID"/>
            </corecom:ID>
            <corecom:ApplicationTypeCode>
               <xsl:value-of select="aia:getSystemType(corecom:Sender/corecom:ID)"/>
            </corecom:ApplicationTypeCode>
            <corecom:ServiceName>
               <xsl:value-of select="corecom:Sender/corecom:WSAddress/wsa:ReplyTo"/>
            </corecom:ServiceName>
            <xsl:call-template name="TargetType_ext">
               <xsl:with-param name="RequestCustomElement" select="corecom:Sender/corecom:Custom"/>
            </xsl:call-template>
         </corecom:Target>
         <corecom:BusinessScope>
            <corecom:ID>
               <xsl:value-of select="corecom:BusinessScope[corecom:BusinessScopeTypeCode='BusinessProcess'][1]/corecom:ID"/>
            </corecom:ID>
            <corecom:InstanceID>
               <xsl:value-of select="corecom:BusinessScope[corecom:BusinessScopeTypeCode='BusinessProcess'][1]/corecom:InstanceID"/>
            </corecom:InstanceID>
            <corecom:BusinessScopeTypeCode>BusinessProcess</corecom:BusinessScopeTypeCode>
            <corecom:EnterpriseServiceName>{http://xmlns.oracle.com/EnterpriseServices/Core/Item/V2}ItemEBSResponseV2</corecom:EnterpriseServiceName>
            <corecom:EnterpriseServiceOperationName>SyncItemListResponse</corecom:EnterpriseServiceOperationName>
            <xsl:call-template name="BusinessScopeType_ext"/>
         </corecom:BusinessScope>
         <corecom:BusinessScope>
            <corecom:ID>SyncItemListRespMsg</corecom:ID>
            <corecom:InstanceID>
               <xsl:value-of select="concat('SyncItemListRespMsg/',$EBMID)"/>
            </corecom:InstanceID>
            <corecom:BusinessScopeTypeCode>Message</corecom:BusinessScopeTypeCode>
            <corecom:EnterpriseServiceName>{http://xmlns.oracle.com/EnterpriseServices/Core/Item/V2}ItemEBSResponseV2</corecom:EnterpriseServiceName>
            <corecom:EnterpriseServiceOperationName>SyncItemListResponse</corecom:EnterpriseServiceOperationName>
            <xsl:call-template name="BusinessScopeType_ext"/>
         </corecom:BusinessScope>
         <corecom:EBMTracking>
            <corecom:SequenceNumber>1</corecom:SequenceNumber>
            <corecom:ExecutionUnitID/>
            <corecom:ExecutionUnitName>{http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncItemListPDCProvABCSImpl/V1}SyncItemListPDCProvABCSImpl</corecom:ExecutionUnitName>
            <corecom:ImplementationCode>BPEL</corecom:ImplementationCode>
            <corecom:ActivityDateTime>
               <xsl:value-of select="xp20:current-dateTime()"/>
            </corecom:ActivityDateTime>
            <xsl:call-template name="EBMTrackingType_ext"/>
         </corecom:EBMTracking>
         <corecom:MessageBatch>
            <corecom:StatusCode>Success</corecom:StatusCode>
            <xsl:copy-of select="corecom:MessageBatch/corecom:ID"/>
            <xsl:copy-of select="corecom:MessageBatch/corecom:Name"/>
            <xsl:copy-of select="corecom:MessageBatch/corecom:BatchParameter"/>
         </corecom:MessageBatch>
         <xsl:call-template name="EBMHeaderType_ext">
            <xsl:with-param name="RequestCustomElement" select="corecom:Custom"/>
         </xsl:call-template>
      </corecom:EBMHeader>
   </xsl:template>
</xsl:stylesheet>
