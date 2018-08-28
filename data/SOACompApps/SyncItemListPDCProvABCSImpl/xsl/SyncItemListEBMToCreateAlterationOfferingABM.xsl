<?xml version='1.0' encoding='UTF-8'?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationConnectorServiceLibrary/PDC/V1/ProviderABCS/SyncItemListPDCProvABCSImpl.wsdl"/>
      <rootElement name="SyncItemListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationObjectLibrary/PDC/schemas/Pricing/PricingObjects.xsd"/>
      <rootElement name="PricingObjectsJXB" namespace="http://xmlns.oracle.com/communications/platform/model/pricing"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.0(build 130301.0647.0008) AT [FRI JUN 28 11:14:11 IST 2013]. -->
?>
<xsl:stylesheet version="2.0" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://xmlns.oracle.com/communications/platform/model/pricing" xmlns:ns2="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns7="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:aiacommsdate="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.industry.comms.util.AIAGetDateOffset" xmlns:eboabcs="http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncItemListPDCProvABCSImpl/V1" xmlns:ns0="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:ns10="http://schemas.oracle.com/service/bpel/common" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:eboebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns3="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:ns5="http://xmlns.oracle.com/communications/platform/model/Common" xmlns:ns4="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns6="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:ns8="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:ns9="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl svcdoc ns1 ns2 plnk soap ns7 eboabcs ns0 ns10 eboebo ns3 ns5 ns4 xsd ns6 ns8 ns9 aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:variable name="SourceCol" select="'COMMON'"/>
   <xsl:variable name="PriceChargeTypePDCCol" select='"PRICECHARGETYPE_PDC"'/>
	   <xsl:variable name="targetID">
		  <xsl:choose>
			 <xsl:when test="boolean(/eboebo:SyncItemListEBM/ns2:EBMHeader/ns2:Target/ns2:ID/text())">
				<xsl:value-of select="/eboebo:SyncItemListEBM/ns2:EBMHeader/ns2:Target/ns2:ID"/>
			 </xsl:when>
			 <xsl:otherwise>
				<xsl:value-of select="aia:getServiceProperty('{http://xmlns.oracle.com/ABCSImpl/PDC/Core/SyncItemListPDCProvABCSImpl/V1}SyncItemListPDCProvABCSImpl','Default.SystemID',true())"/>
			 </xsl:otherwise>
		  </xsl:choose>
   </xsl:variable>
   <xsl:variable name="TargetCol" select="$targetID"/>
   <xsl:template match="/">
     <ns1:PricingObjectsJXB>
         <xsl:for-each select="fn:distinct-values(/eboebo:SyncItemListEBM/eboebo:DataArea[eboebo:SyncItemList/ns2:ItemServiceCharacteristics/ns2:BillingEntityTypeCode = &quot;DISCOUNT&quot; and ns6:Sync/@syncActionCode = &quot;add&quot;]/eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Event_Map&quot;][ns6:Specification[ns6:Name = &quot;Discount_Structure_Type&quot;]/ns6:ValueText = &quot;DISCOUNT_MODEL&quot;]/ns6:Specification[ns6:Name = 'Model_Selector']/ns6:ValueText)">
        <!--xsl:if test="boolean(ns6:Specification[ns6:Name = &quot;Discount_Structure_Type&quot;]/ns6:ValueText/text())">
               <xsl:if test="ns6:Specification[ns6:Name = &quot;Discount_Structure_Type&quot;]/ns6:ValueText = &quot;DISCOUNT_MODEL&quot;"-->
        <xsl:variable name="IfPDCDiscountModelIdExists"
                      select="xref:lookupXRef('oramds:/apps/AIAMetaData/xref/DISCOUNTOBJECT_ID.xref',$SourceCol,.,$TargetCol,false())"/>
        <xsl:if test="$IfPDCDiscountModelIdExists = ''">
          <alterationRatePlan>
            <name>
              <xsl:value-of select="."/>
            </name>
			<!-- Bug Fix 25723730 starts -->
			<xsl:for-each select='/eboebo:SyncItemListEBM/eboebo:DataArea/eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = "Billing_Discount_Event_Map"]'>
				<xsl:if test='boolean(ns6:Specification[ns6:Name = "Event"]/ns6:ValueText/text())'>
					<xsl:choose>
						<xsl:when test='dvm:lookupValue("oramds:/apps/AIAMetaData/dvm/PRICETYPE_EVENT.dvm",$SourceCol,ns6:Specification[ns6:Name = "Event"]/ns6:ValueText,$PriceChargeTypePDCCol,"") = "USAGE"'>
							<pricingProfileName>
								<xsl:text disable-output-escaping="no">Standard Discount</xsl:text>
							</pricingProfileName>
						</xsl:when>
						<xsl:otherwise>
							<pricingProfileName>
								<xsl:text disable-output-escaping="no">Subscription Discount</xsl:text>
							</pricingProfileName>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			 <!-- Bug Fix 25723730 ends -->
            <priceListName>
              <xsl:text disable-output-escaping="no">Default</xsl:text>
            </priceListName>
            <arpDateRange>
              <startDate>
                <xsl:text disable-output-escaping="no">0</xsl:text>
              </startDate>
              <endDate>
                <xsl:text disable-output-escaping="no">inf</xsl:text>
              </endDate>
              <alterationConfiguration>
                <applicableChargeAndQuantity>
                  <xsl:text disable-output-escaping="no">REMAINING_CHARGE</xsl:text>
                </applicableChargeAndQuantity>
                <arpCompositePopModel>
                  <name>
                    <xsl:text disable-output-escaping="no">Pricing</xsl:text>
                  </name>
                  <alterationPopModel>
                    <priceTier>
                      <distributionMethod>
                        <xsl:text disable-output-escaping="no">FROM_BAL_IMPACT</xsl:text>
                      </distributionMethod>
                      <tierBasis>
                        <chargeTierExpression>
                          <useTierComponent>
                            <xsl:text disable-output-escaping="no">false</xsl:text>
                          </useTierComponent>
                        </chargeTierExpression>
                      </tierBasis>
                      <lowerBound>
                        <numberTBExpression>
                          <value>
                            <xsl:text disable-output-escaping="no">0.0</xsl:text>
                          </value>
                        </numberTBExpression>
                      </lowerBound>
                      <tierRange>
                        <upperBound>
                          <numberTBExpression>
                            <value>
                              <xsl:text disable-output-escaping="no">NO_MAX</xsl:text>
                            </value>
                          </numberTBExpression>
                        </upperBound>
                        <percentAlteration>
                          <price>
                            <xsl:text disable-output-escaping="no">0.0</xsl:text>
                          </price>
                          <unitOfMeasure>
                            <xsl:text disable-output-escaping="no">NONE</xsl:text>
                          </unitOfMeasure>
                          <balanceElementNumCode>
                            <xsl:text disable-output-escaping="no">840</xsl:text>
                          </balanceElementNumCode>
                          <alterationAppliesTo>
                            <xsl:text disable-output-escaping="no">USER</xsl:text>
                          </alterationAppliesTo>
                          <alterationBasedOn>
                            <chargeBasisExpression>
                              <useTierComponent>
                                <xsl:text disable-output-escaping="no">false</xsl:text>
                              </useTierComponent>
                            </chargeBasisExpression>
                          </alterationBasedOn>
                          <priceType>
                            <xsl:text disable-output-escaping="no">GRANT</xsl:text>
                          </priceType>
                          <priceValidity>
                            <startValidityMode>
                              <xsl:text disable-output-escaping="no">IMMEDIATE</xsl:text>
                            </startValidityMode>
                            <endValidityMode>
                              <xsl:text disable-output-escaping="no">RELATIVE_TO_START</xsl:text>
                            </endValidityMode>
                            <relativeStartOffset>
                              <xsl:text disable-output-escaping="no">-1</xsl:text>
                            </relativeStartOffset>
                            <relativeEndOffset>
                              <xsl:text disable-output-escaping="no">1</xsl:text>
                            </relativeEndOffset>
                            <relativeStartOffsetUnit>
                              <xsl:text disable-output-escaping="no">BILLING_CYCLE</xsl:text>
                            </relativeStartOffsetUnit>
                            <relativeEndOffsetUnit>
                              <xsl:text disable-output-escaping="no">BILLING_CYCLE</xsl:text>
                            </relativeEndOffsetUnit>
                          </priceValidity>
                        </percentAlteration>
                      </tierRange>
                    </priceTier>
                  </alterationPopModel>
                </arpCompositePopModel>
              </alterationConfiguration>
            </arpDateRange>
          </alterationRatePlan>
        </xsl:if>
      </xsl:for-each>
         <xsl:for-each select="/eboebo:SyncItemListEBM/eboebo:DataArea[eboebo:SyncItemList/ns2:ItemServiceCharacteristics/ns2:BillingEntityTypeCode = 'DISCOUNT' and ns6:Sync/@syncActionCode = 'add']">
            <alterationOffering>
               <xsl:attribute name="externalID">
                  <xsl:value-of select="eboebo:SyncItemList/ns6:ItemIdentification/ns6:AlternateObjectKey/ns6:ID"/>
               </xsl:attribute>
               <name>
                  <xsl:value-of select="eboebo:SyncItemList/ns2:Name"/>
               </name>
               <description>
                  <xsl:value-of select="eboebo:SyncItemList/ns2:Description"/>
               </description>
               	
                <pricingProfileName>
                 <xsl:text disable-output-escaping="no">Product Offering</xsl:text>
                </pricingProfileName>
              
               <xsl:choose>
                  <xsl:when test="boolean(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:StartDateTime/text()) and boolean(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:EndDateTime/text())">
                     <xsl:variable name="startdatetime">
                        <xsl:call-template name="getUTCDateTime">
                           <xsl:with-param name="datetime" select="substring-before(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:StartDateTime,'+')"/>
                        </xsl:call-template>
                     </xsl:variable>
                     <xsl:variable name="enddatetime">
                        <xsl:call-template name="getUTCDateTime">
                           <xsl:with-param name="datetime" select="substring-before(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:EndDateTime,'+')"/>
                        </xsl:call-template>
                     </xsl:variable>
                     <timeRange>
                        <xsl:value-of select="concat($startdatetime,'/',$enddatetime)"/>
                     </timeRange>
                  </xsl:when>
                  <xsl:when test="boolean(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:StartDateTime/text()) and not(boolean(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:EndDateTime/text()))">
                     <xsl:variable name="startdatetime">
                        <xsl:call-template name="getUTCDateTime">
                           <xsl:with-param name="datetime" select="substring-before(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:StartDateTime,'+')"/>
                        </xsl:call-template>
                     </xsl:variable>
                     <timeRange>
                        <xsl:value-of select="concat($startdatetime,'/','inf')"/>
                     </timeRange>
                  </xsl:when>
                  <xsl:when test="not(boolean(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:StartDateTime/text())) and boolean(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:EndDateTime/text())">
                     <xsl:variable name="enddatetime">
                        <xsl:call-template name="getUTCDateTime">
                           <xsl:with-param name="datetime" select="substring-before(eboebo:SyncItemList/ns6:EffectiveTimePeriod/ns6:EndDateTime,'+')"/>
                        </xsl:call-template>
                     </xsl:variable>
                     <timeRange>
                        <xsl:value-of select="concat('0','/',$enddatetime)"/>
                     </timeRange>
                  </xsl:when>
                  <xsl:otherwise>
                     <timeRange>
                        <xsl:value-of select="concat('0','/','inf')"/>
                     </timeRange>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="contains(eboebo:SyncItemList/ns2:ItemClassification/ns2:ClassificationCode[@listID='Billing_Service_Type'],'/service/')">
                     <productSpecName>
                        <xsl:call-template name="CamelCase">
                           <xsl:with-param name="text" select="substring-after(eboebo:SyncItemList/ns2:ItemClassification/ns2:ClassificationCode[@listID='Billing_Service_Type'],'/service')"/>
                        </xsl:call-template>
                     </productSpecName>
                  </xsl:when>
                  <xsl:when test="contains(eboebo:SyncItemList/ns2:ItemClassification/ns2:ClassificationCode[@listID='Billing_Service_Type'],'/account')">
                     <customerSpecName>
                        <xsl:call-template name="CamelCase">
                           <xsl:with-param name="text" select="eboebo:SyncItemList/ns2:ItemClassification/ns2:ClassificationCode[@listID='Billing_Service_Type']"/>
                        </xsl:call-template>
                     </customerSpecName>
                  </xsl:when>
                  <xsl:otherwise>
                     <productSpecName>
                        <xsl:call-template name="CamelCase">
                           <xsl:with-param name="text" select="eboebo:SyncItemList/ns2:ItemClassification/ns2:ClassificationCode[@listID='Billing_Service_Type']"/>
                        </xsl:call-template>
                     </productSpecName>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:if test="boolean(eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name='Billing_Discount_Attributes']/ns6:Specification[ns6:Name='Discount_Type']/ns6:ValueText/text())">
                  <offerType>
                     <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name='Billing_Discount_Attributes']/ns6:Specification[ns6:Name='Discount_Type']/ns6:ValueText"/>
                  </offerType>
               </xsl:if>
			   <xsl:if test="boolean(eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name='Billing_Discount_Attributes']/ns6:Specification[ns6:Name='Priority']/ns6:ValueNumeric/text())">
                  <priority>
                     <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name='Billing_Discount_Attributes']/ns6:Specification[ns6:Name='Priority']/ns6:ValueNumeric"/>
                  </priority>
               </xsl:if>
               <xsl:if test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = 'Billing_Discount_Attributes']/ns6:Specification[ns6:Name = 'Provisioning_Tag']/ns6:ValueText/text()">
                  <provisioningTag>
                     <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Provisioning_Tag&quot;]/ns6:ValueText"/>
                  </provisioningTag>
               </xsl:if>
               <xsl:choose>
                  <xsl:when test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Purchase_Qty_Minimum&quot;]/ns6:ValueNumeric/text()">
                     <purchaseMin>
                        <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Purchase_Qty_Minimum&quot;]/ns6:ValueNumeric"/>
                     </purchaseMin>
                  </xsl:when>
                  <xsl:otherwise>
                     <purchaseMin>
                        <xsl:text disable-output-escaping="no">-1</xsl:text>
                     </purchaseMin>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Purchase_Qty_Maximum&quot;]/ns6:ValueNumeric/text()">
                     <purchaseMax>
                        <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Purchase_Qty_Maximum&quot;]/ns6:ValueNumeric"/>
                     </purchaseMax>
                  </xsl:when>
                  <xsl:otherwise>
                     <purchaseMax>
                        <xsl:text disable-output-escaping="no">-1</xsl:text>
                     </purchaseMax>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Ownership_Qty_Minimum&quot;]/ns6:ValueNumeric/text()">
                     <ownMin>
                        <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Ownership_Qty_Minimum&quot;]/ns6:ValueNumeric"/>
                     </ownMin>
                  </xsl:when>
                  <xsl:otherwise>
                     <ownMin>
                        <xsl:text disable-output-escaping="no">-1</xsl:text>
                     </ownMin>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Ownership_Qty_Maximum&quot;]/ns6:ValueNumeric/text()">
                     <ownMax>
                        <xsl:value-of select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Ownership_Qty_Maximum&quot;]/ns6:ValueNumeric"/>
                     </ownMax>
                  </xsl:when>
                  <xsl:otherwise>
                     <ownMax>
                        <xsl:text disable-output-escaping="no">-1</xsl:text>
                     </ownMax>
                  </xsl:otherwise>
               </xsl:choose>
               <applicableChargeAndQuantity>
                  <xsl:choose>
					<xsl:when test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Multi_Discounts_Per_Event&quot;]/ns6:ValueText = 'PARALLEL'">
						<xsl:text disable-output-escaping="no">ORIGINAL_CHARGE</xsl:text>
					</xsl:when>
					<xsl:when test="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Multi_Discounts_Per_Event&quot;]/ns6:ValueText = 'CASCADE'">
						<xsl:text disable-output-escaping="no">UNUSED_CHARGE_QUANTITY</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="no">REMAINING_CHARGE</xsl:text>
					</xsl:otherwise>
				  </xsl:choose>
               </applicableChargeAndQuantity>
               <xsl:for-each select="eboebo:SyncItemList/ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Event_Map&quot;]">
                  <alterationEventMap>
                     <xsl:if test="boolean(ns6:Specification[ns6:Name='Event']/ns6:ValueText/text())">
                        <eventName>
                           <xsl:value-of select="dvm:lookupValue('oramds:/apps/AIAMetaData/dvm/PRICETYPE_EVENT.dvm',$SourceCol,ns6:Specification[ns6:Name='Event']/ns6:ValueText,$TargetCol,'')"/>
                        </eventName>
                     </xsl:if>
                     <!-- Fix for bug 19293358-->
					 <xsl:choose>
						<xsl:when test="ns6:Specification[ns6:Name='Stop_Discounting']/ns6:ValueText = 'WHEN_INACTIVATE'">
							<validIfCancelled>
								<xsl:text disable-output-escaping="no">true</xsl:text>
							</validIfCancelled>
							<validIfInactive>
								<xsl:text disable-output-escaping="no">false</xsl:text>
							</validIfInactive>
						</xsl:when>
						<xsl:when test="ns6:Specification[ns6:Name='Stop_Discounting']/ns6:ValueText = 'WHEN_CANCELED'">
							<validIfCancelled>
								<xsl:text disable-output-escaping="no">false</xsl:text>
							</validIfCancelled>
							<validIfInactive>
								<xsl:text disable-output-escaping="no">true</xsl:text>
							</validIfInactive>
						</xsl:when>
						<xsl:when test="ns6:Specification[ns6:Name='Stop_Discounting']/ns6:ValueText = 'WHEN_INACTIVATE_OR_CANCELED'">
							<validIfCancelled>
								<xsl:text disable-output-escaping="no">false</xsl:text>
							</validIfCancelled>
							<validIfInactive>
								<xsl:text disable-output-escaping="no">false</xsl:text>
							</validIfInactive>
						</xsl:when>
						<xsl:when test="ns6:Specification[ns6:Name='Stop_Discounting']/ns6:ValueText = 'NEVER'">
							<validIfCancelled>
								<xsl:text disable-output-escaping="no">true</xsl:text>
							</validIfCancelled>
							<validIfInactive>
								<xsl:text disable-output-escaping="no">true</xsl:text>
							</validIfInactive>
						</xsl:when>
						<xsl:otherwise>
							<validIfCancelled>
								<xsl:text disable-output-escaping="no">false</xsl:text>
							</validIfCancelled>
							<validIfInactive>
								<xsl:text disable-output-escaping="no">false</xsl:text>
							</validIfInactive>
						</xsl:otherwise>
					 </xsl:choose>
					 <!-- End of the fix for the bug 19293358-->
                     <xsl:if test="boolean(ns6:Specification[ns6:Name='Snowball']/ns6:ValueText/text())">
                        <xsl:choose>
                           <xsl:when test="ns6:Specification[ns6:Name='Snowball']/ns6:ValueText = 'Y'">
                              <snowball>
                                 <xsl:text disable-output-escaping="no">true</xsl:text>
                              </snowball>
                           </xsl:when>
                           <xsl:otherwise>
                              <snowball>
                                 <xsl:text disable-output-escaping="no">false</xsl:text>
                              </snowball>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                     <xsl:variable name="event_type" select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/PRICETYPE_EVENT.dvm&quot;,$SourceCol,ns6:Specification[ns6:Name='Event']/ns6:ValueText,'PRICECHARGETYPE_PDC',&quot;&quot;)"/>
					 <xsl:choose> 
						<xsl:when test="$event_type='RECURRING' or $event_type = &quot;ONETIME&quot;">
							<xsl:choose>
								<xsl:when test="boolean(../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name='Billing_Discount_Attributes']/ns6:Specification[ns6:Name='Cycle_Discount_Valid_To']/ns6:ValueText/text())">
									<validAtStartNotValidAtEnd>
										<xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/DISCOUNT_VALIDITY.dvm&quot;,$SourceCol,../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name='Billing_Discount_Attributes']/ns6:Specification[ns6:Name='Cycle_Discount_Valid_To']/ns6:ValueText,$TargetCol,&quot;&quot;)"/>
									</validAtStartNotValidAtEnd>
								</xsl:when>
								<xsl:otherwise>
									<validAtStartNotValidAtEnd>
										<xsl:text disable-output-escaping="no">PRORATE_DISCOUNT</xsl:text>
									</validAtStartNotValidAtEnd>
								</xsl:otherwise>
							 </xsl:choose>
							 <xsl:choose>
								<xsl:when test="boolean(../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Cycle_Discount_Valid_From&quot;]/ns6:ValueText/text())">
									 <notValidAtStartValidAtEnd>
										<xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/DISCOUNT_VALIDITY.dvm&quot;,$SourceCol,../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Cycle_Discount_Valid_From&quot;]/ns6:ValueText,$TargetCol,&quot;&quot;)"/>
									 </notValidAtStartValidAtEnd>
								 </xsl:when>
								 <xsl:otherwise>
									<notValidAtStartValidAtEnd>
										<xsl:text disable-output-escaping="no">PRORATE_DISCOUNT</xsl:text>
									 </notValidAtStartValidAtEnd>
								 </xsl:otherwise>
							 </xsl:choose>
							 <xsl:choose>
								<xsl:when test="boolean(../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Cycle_Discount_Valid_Only&quot;]/ns6:ValueText/text())">
									 <notValidAtStartNotValidAtEnd>
										 <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/DISCOUNT_VALIDITY.dvm&quot;,$SourceCol,../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Cycle_Discount_Valid_Only&quot;]/ns6:ValueText,$TargetCol,&quot;&quot;)"/>
									 </notValidAtStartNotValidAtEnd>
								 </xsl:when>
								 <xsl:otherwise>
									<notValidAtStartNotValidAtEnd>
										<xsl:text disable-output-escaping="no">PRORATE_DISCOUNT</xsl:text>
									 </notValidAtStartNotValidAtEnd>
								</xsl:otherwise>
							 </xsl:choose>
						</xsl:when>
						<xsl:otherwise>
								<xsl:choose>
								<xsl:when test="../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Usage_Discount_Valid_To&quot;]/ns6:ValueText/text()">
									<validAtStartNotValidAtEnd>
										<xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/DISCOUNT_VALIDITY.dvm&quot;,$SourceCol,../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Usage_Discount_Valid_To&quot;]/ns6:ValueText,$TargetCol,&quot;&quot;)"/>
									</validAtStartNotValidAtEnd>
								</xsl:when>
								<xsl:otherwise>
									<validAtStartNotValidAtEnd>
										<xsl:text disable-output-escaping="no">PRORATE_DISCOUNT</xsl:text>
									</validAtStartNotValidAtEnd>
								</xsl:otherwise>
							 </xsl:choose>
							 <xsl:choose>
								<xsl:when test="../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Usage_Discount_Valid_From&quot;]/ns6:ValueText/text()">
									 <notValidAtStartValidAtEnd>
										<xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/DISCOUNT_VALIDITY.dvm&quot;,$SourceCol,../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Usage_Discount_Valid_From&quot;]/ns6:ValueText,$TargetCol,&quot;&quot;)"/>
									 </notValidAtStartValidAtEnd>
								 </xsl:when>
								 <xsl:otherwise>
									<notValidAtStartValidAtEnd>
										<xsl:text disable-output-escaping="no">PRORATE_DISCOUNT</xsl:text>
									 </notValidAtStartValidAtEnd>
								 </xsl:otherwise>
							 </xsl:choose>
							 <xsl:choose>
								<xsl:when test="../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Usage_Discount_Valid_Only&quot;]/ns6:ValueText/text()">
									 <notValidAtStartNotValidAtEnd>
										<xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/DISCOUNT_VALIDITY.dvm&quot;,$SourceCol,../../ns2:ItemSpecificationGroup/ns6:SpecificationGroup[ns6:Name = &quot;Billing_Discount_Attributes&quot;]/ns6:Specification[ns6:Name = &quot;Usage_Discount_Valid_Only&quot;]/ns6:ValueText,$TargetCol,&quot;&quot;)"/>
									 </notValidAtStartNotValidAtEnd>
								 </xsl:when>
								 <xsl:otherwise>
									<notValidAtStartNotValidAtEnd>
										<xsl:text disable-output-escaping="no">PRORATE_DISCOUNT</xsl:text>
									 </notValidAtStartNotValidAtEnd>
								</xsl:otherwise>
							 </xsl:choose>
						</xsl:otherwise>                    
					 </xsl:choose>
                     <xsl:if test="boolean(ns6:Specification[ns6:Name = &quot;Discount_Structure_Type&quot;]/ns6:ValueText/text())">
                        <xsl:if test="ns6:Specification[ns6:Name = &quot;Discount_Structure_Type&quot;]/ns6:ValueText = &quot;DISCOUNT_MODEL&quot;">
                           <alterationRatePlanName>
                              <xsl:value-of select="ns6:Specification[ns6:Name = &quot;Model_Selector&quot;]/ns6:ValueText"/>
                           </alterationRatePlanName>
                        </xsl:if>
                     </xsl:if>
                  </alterationEventMap>
               </xsl:for-each>
            </alterationOffering>
         </xsl:for-each>
      </ns1:PricingObjectsJXB>
   </xsl:template>
   <xsl:template name="getUTCDateTime">
      <xsl:param name="datetime"/>
      <xsl:value-of select="translate($datetime,':-+','')"/>
   </xsl:template>
   <xsl:template name="CamelCase">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="contains($text,'/')">
            <xsl:call-template name="CamelCaseWord">
               <xsl:with-param name="text" select="substring-before($text,'/')"/>
            </xsl:call-template>
            <xsl:call-template name="CamelCase">
               <xsl:with-param name="text" select="substring-after($text,'/')"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="CamelCaseWord">
               <xsl:with-param name="text" select="$text"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="CamelCaseWord">
      <xsl:param name="text"/>
      <xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
      <xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
   </xsl:template>
</xsl:stylesheet>