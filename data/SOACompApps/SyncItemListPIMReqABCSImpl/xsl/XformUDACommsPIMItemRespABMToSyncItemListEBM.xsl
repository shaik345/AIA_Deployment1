<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" 
  xmlns:ebi="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
  xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:ns4="http://xmlns.oracle.com/apps/bom/structure/service/in" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns7="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns1="http://xmlns.oracle.com/apps/ego/item/service" xmlns:ns3="http://xmlns.oracle.com/apps/bom/structure/service/out" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:ns5="http://xmlns.oracle.com/apps/ego/item/service/out" xmlns:ns6="http://xmlns.oracle.com/apps/ego/item/service/in" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:ns2="http://xmlns.oracle.com/QueryItemListPIMAdapter" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" version="1.0" exclude-result-prefixes="xsl ns4 xsd ns1 ns3 ns5 ns6 ns2 corecomEBO ns7 corecomcust xacml corecom ns0 svcdoc wsa coreitemcust xacml-context ehdr xp20 ora orcl bpws hwf xref ids" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
<xsl:param name="SystemID"/>
<xsl:variable name="DVMSourceCol" select="$SystemID"/>
<xsl:variable name="DVMTargetCol" select="&quot;COMMON&quot;"/>
<xsl:variable name="XREFSourceCol" select="$SystemID"/>
<xsl:variable name="XREFTargetCol" select="&quot;COMMON&quot;"/>
      <xsl:template name="ProdDetailsDefinitions">       
            <corecomEBO:PerUOMQuantity>
                  <xsl:value-of select="ItemUDA[Name='Quantity']/NumberValue"/>
            </corecomEBO:PerUOMQuantity> 
            <corecomEBO:Level>
                  <xsl:value-of select="ItemUDA[Name='Product_Level']/NumberValue"/>
            </corecomEBO:Level>
<!--
            <corecomEBO:EntityTypeCode>
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_ENTITY_TYPE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Entity_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Entity_Type']/CharValue)"/>
            </corecomEBO:EntityTypeCode> -->	
		<!--Defect Fix 11724422  -->
		
		<corecomEBO:ItemSpecificationGroup>
                  <corecom:SpecificationGroup>
                        <corecom:Name>
                              <xsl:value-of select="ItemUDA[Name='Inclusive_Eligibility']/Name"/>
                        </corecom:Name>                        
                              <corecom:Specification>
                                    <corecom:Name>
                                          <xsl:value-of select="ItemUDA[Name='Inclusive_Eligibility']/Name"/>
                                    </corecom:Name>
                                    <corecom:ValueText>
                                         <xsl:value-of select="ItemUDA[Name='Inclusive_Eligibility']/CharValue"/>
                                    </corecom:ValueText>                                    
                              </corecom:Specification>                        
                  </corecom:SpecificationGroup>
            </corecomEBO:ItemSpecificationGroup>		   
		   
		   
		<corecomEBO:ItemOrderManagementCharacteristics>
              <corecomEBO:EligibilityCheckRequiredIndicator>			  
                      <xsl:value-of select="ItemUDA[Name='Check_Eligiblity']/CharValue"/>				  						  
				</corecomEBO:EligibilityCheckRequiredIndicator>
           </corecomEBO:ItemOrderManagementCharacteristics>
		   
		   <!--Defect Fix 11724422 END -->
		   
            <corecomEBO:StructureTypeCode>
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_UDA_STRUCTURE_TYPE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Structure_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Structure_Type']/CharValue)"/>
            </corecomEBO:StructureTypeCode>
            <corecomEBO:ItemOrderManagementCharacteristics>
                  <corecomEBO:PriceTypeCode>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/PRICE_TYPE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Price_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Price_Type']/CharValue)"/>
                  </corecomEBO:PriceTypeCode>
            </corecomEBO:ItemOrderManagementCharacteristics>
            <corecomEBO:ItemPhysicalCharacteristics>
                  <corecomEBO:TrainingFormatCode>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_FORMAT.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Format']/CharValue,$DVMTargetCol,ItemUDA[Name='Format']/CharValue)"/>
                  </corecomEBO:TrainingFormatCode>
            </corecomEBO:ItemPhysicalCharacteristics>
            <corecomEBO:RelatedItem>
                  <corecom:Identification>
                        <corecom:ID>
                              <xsl:value-of select="ItemUDA[Name='Parent_Product']/CharValue"/>
                        </corecom:ID>
                  </corecom:Identification>
            </corecomEBO:RelatedItem>
			
			<!-- Start R1.3 Drop3 un commenting Product_Line mapping on Aug 14th by Santosh -->
            <corecomEBO:ItemClassification>
                  <corecomEBO:ClassificationCode listID="Product_Line">                        
                        <xsl:value-of select="ItemUDA[Name='Product_Line']/CharValue"/>
                  </corecomEBO:ClassificationCode>
            </corecomEBO:ItemClassification>           
<!-- End R1.3 Drop3 un commenting Product_Line mapping on Aug 14th by Santosh -->
           
      </xsl:template>
      
      <xsl:template name="RelatedProdLines">
              <corecomEBO:ItemClassification>
                  <corecomEBO:ProductLine>                        
                        <xsl:value-of select="ItemUDA[Name='Product_Line']/CharValue"/>
                  </corecomEBO:ProductLine>
                  <corecomEBO:PrimaryProductLineIndicator>                        
                        <xsl:value-of select="ItemUDA[Name='Primary_Flag']/CharValue"/>
                  </corecomEBO:PrimaryProductLineIndicator>
            </corecomEBO:ItemClassification>
      </xsl:template>
      
      <xsl:template name="PoductDetailsMarketing">
            <corecomEBO:ItemMarketingCharacteristics>
                  <corecomEBO:TargetIndustryCode>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_TARGET_INDUSTRY.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Targeted_Industry']/CharValue,$DVMTargetCol,ItemUDA[Name='Targeted_Industry']/CharValue)"/>
                  </corecomEBO:TargetIndustryCode>
                  <corecomEBO:TargetMinimumAge>
                        <xsl:value-of select="ItemUDA[Name='Targeted_Min_Age']/NumberValue"/>
                  </corecomEBO:TargetMinimumAge>
                  <corecomEBO:TargetPostalCode>
                        <xsl:value-of select="ItemUDA[Name='Targeted_Postal_Code']/CharValue"/>
                  </corecomEBO:TargetPostalCode>
                  <corecomEBO:TargetCountryCode>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ADDRESS_COUNTRYID.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Targeted_Country']/CharValue,$DVMTargetCol,ItemUDA[Name='Targeted_Country']/CharValue)"/>
                  </corecomEBO:TargetCountryCode>
                  <corecomEBO:TargetMaximumAge>
                        <xsl:value-of select="ItemUDA[Name='Targeted_Max_Age']/NumberValue"/>
                  </corecomEBO:TargetMaximumAge>
            </corecomEBO:ItemMarketingCharacteristics>
      </xsl:template>
      <xsl:template name="ProductDetailsService">
            <corecomEBO:ItemServiceCharacteristics>
                  <corecomEBO:MeanTimeBetweenFailureDuration>
                        <xsl:value-of select="concat('P',ItemUDA[Name='MTBF']/NumberValue)"/>
                  </corecomEBO:MeanTimeBetweenFailureDuration>
                  <corecomEBO:MeanTimeToRepairDuration>
                        <xsl:value-of select="concat('P',ItemUDA[Name='MTTR']/NumberValue)"/>
                  </corecomEBO:MeanTimeToRepairDuration>
                  <corecomEBO:FieldReplacableIndicator>
                         <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Field_Replaceable']/CharValue"/>
                    </xsl:call-template>     
                  </corecomEBO:FieldReplacableIndicator>
                  <corecomEBO:DefectiveReturnRequiredIndicator>
                         <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Return_if_Defective']/CharValue"/>
                    </xsl:call-template>   
                  </corecomEBO:DefectiveReturnRequiredIndicator>
            </corecomEBO:ItemServiceCharacteristics>
            <corecomEBO:ToolIndicator>
                   <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Tool']/CharValue"/>
                    </xsl:call-template>   
            </corecomEBO:ToolIndicator>
      </xsl:template>
      <xsl:template name="ProductDetailsLogistics">
            <corecom:ItemIdentification>
                  <corecom:SupplierItemID>
                        <xsl:value-of select="ItemUDA[Name='Vendor_Part_Number']/CharValue"/>
                  </corecom:SupplierItemID>
            </corecom:ItemIdentification>        
            <corecomEBO:ItemLogisticCharacteristics>
                  <corecomEBO:ModeOfTransportCodeCode>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_LOGISTICS_SHIP_METHOD.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Ship_Method']/CharValue,$DVMTargetCol,ItemUDA[Name='Ship_Method']/CharValue)"/>
                  </corecomEBO:ModeOfTransportCodeCode>
                  <corecomEBO:BelowReorderQuantityAllocationAllowedIndicator>
                        <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Allocate_Below_Safety']/CharValue"/>
                    </xsl:call-template>   
                  </corecomEBO:BelowReorderQuantityAllocationAllowedIndicator>
                  <corecomEBO:AutomaticSubstitutionAllowedIndicator>
                        <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Auto_Substitute']/CharValue"/>
                    </xsl:call-template>   
                  </corecomEBO:AutomaticSubstitutionAllowedIndicator>
                  <corecomEBO:AutomaticAllocationAllowedIndicator>
                        <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Auto_Allocate']/CharValue"/>
                    </xsl:call-template>   
                  </corecomEBO:AutomaticAllocationAllowedIndicator>
                  <corecomEBO:AutomaticExplodeIndicator>
                        <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Auto_Explode']/CharValue"/>
                    </xsl:call-template>   
                  </corecomEBO:AutomaticExplodeIndicator>
                  <corecomEBO:ShippingRequiredIndicator>
                         <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Shipping_Required']/CharValue"/>
                    </xsl:call-template>
                  </corecomEBO:ShippingRequiredIndicator>
                  <corecom:CarrierPartyReference>
                        <corecom:PartyIdentification>
                              <corecom:ID>
                                    <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_LOGISTICS_SHIP_CARRIER.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Ship_Carrier']/CharValue,$DVMTargetCol,ItemUDA[Name='Ship_Carrier']/CharValue)"/>
                              </corecom:ID>
                        </corecom:PartyIdentification>
                  </corecom:CarrierPartyReference>
            </corecomEBO:ItemLogisticCharacteristics>
      </xsl:template>
      <xsl:template name="ProdDetailMoreInfo">
            <corecomEBO:AccessPassKey>
                  <xsl:value-of select="ItemUDA[Name='Division_Code_SAP']/CharValue"/>
            </corecomEBO:AccessPassKey>
            <corecom:ItemIdentification>
                  <corecom:GTIN>
                        <xsl:value-of select="ItemUDA[Name='Global_Product_Identifier']/CharValue"/>
                  </corecom:GTIN>
            </corecom:ItemIdentification>
            <corecomEBO:SerialControlIndicator>
                  <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Serialized']/CharValue"/>
                    </xsl:call-template>
            </corecomEBO:SerialControlIndicator>          
            <corecomEBO:ItemManufacturingCharacteristics>
                  <corecomEBO:SumComponentTaxIndicator>
                         <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Tax_Subcomponent_Flag']/CharValue"/>
                    </xsl:call-template>
                  </corecomEBO:SumComponentTaxIndicator>
            </corecomEBO:ItemManufacturingCharacteristics>
            <corecomEBO:ProjectResourceIndicator>
                   <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Project_Resource']/CharValue"/>
                    </xsl:call-template>
            </corecomEBO:ProjectResourceIndicator>
            <corecomEBO:IncentiveCompensationAvailableIndicator>
                  <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Compensable']/CharValue"/>
                    </xsl:call-template>
            </corecomEBO:IncentiveCompensationAvailableIndicator>
<!--
           <corecomEBO:ItemOrderManagementCharacteristics>
              <corecomEBO:EligibilityCheckRequiredIndicator>
                      <xsl:with-param name="value" select="ItemUDA[Name='Eligibility_Flag']/CharValue"/>
              </corecomEBO:EligibilityCheckRequiredIndicator>
           </corecomEBO:ItemOrderManagementCharacteristics>
-->
       </xsl:template>
      <xsl:template name="BillingProdAttrGeneral">
      <corecomEBO:PriorityCode>
        <xsl:value-of select="ItemUDA[Name='Priority']/NumberValue"/>
      </corecomEBO:PriorityCode>
           <corecomEBO:ItemServiceCharacteristics>            
                  <corecomEBO:MultiRatingUsageMetricsSupportIndicator>
                        <xsl:value-of select="ItemUDA[Name='Multi_RUM_Support']/CharValue"/>                        
                  </corecomEBO:MultiRatingUsageMetricsSupportIndicator>
                  <corecomEBO:ProvisioningTagCode>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/PROVISIONING_TAG.dvm&quot;,$DVMSourceCol,ItemUDA[Name=&quot;Provisioning_Tag&quot;]/CharValue,$DVMTargetCol,ItemUDA[Name=&quot;Provisioning_Tag&quot;]/CharValue)"/>
                  </corecomEBO:ProvisioningTagCode>
                  <corecomEBO:PartialPurchaseAllowedIndicator>
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/PARTIAL_PURCHASE.dvm&quot;,$DVMSourceCol,ItemUDA[Name=&quot;Allow_Partial_Purchase&quot;]/CharValue,$DVMTargetCol,ItemUDA[Name=&quot;Allow_Partial_Purchase&quot;]/CharValue)"/>
                  </corecomEBO:PartialPurchaseAllowedIndicator>
                  <corecomEBO:MaximumOwnershipQuantity>
                        <xsl:value-of select="ItemUDA[Name='Own_Max']/NumberValue"/>
                  </corecomEBO:MaximumOwnershipQuantity>
                  <corecomEBO:MinimumOwnershipQuantity>
                        <xsl:value-of select="ItemUDA[Name='Own_Min']/NumberValue"/>
                  </corecomEBO:MinimumOwnershipQuantity>
            </corecomEBO:ItemServiceCharacteristics>
            <corecomEBO:ItemSupplier>
                  <corecom:Identification>
                        <corecom:ID>
                              <xsl:value-of select="ItemUDA[Name='Tax_Supplier']/CharValue"/>
                        </corecom:ID>
                  </corecom:Identification>
            </corecomEBO:ItemSupplier>            
           <corecomEBO:ItemOrderManagementCharacteristics>
              <corecomEBO:MaximumOrderQuantity>
                    <xsl:value-of select="ItemUDA[Name='Purchase_Max']/NumberValue"/>
              </corecomEBO:MaximumOrderQuantity>
              <corecomEBO:MinimumOrderQuantity>
                 <xsl:value-of select="ItemUDA[Name='Purchase_Min']/NumberValue"/>
              </corecomEBO:MinimumOrderQuantity>
           </corecomEBO:ItemOrderManagementCharacteristics>   
      </xsl:template>
      <xsl:template name="SubCompatibleRule">
            <corecomEBO:RelatedItem>
                  <corecomEBO:RelationshipCode listID="Object_Product">
                        <xsl:value-of select="ItemUDA[Name='Object_Product']/CharValue"/>
                  </corecomEBO:RelationshipCode>
                  <corecomEBO:RelationshipCode listID="Subject_Product">
                        <xsl:value-of select="ItemUDA[Name='Subject_Product']/CharValue"/>
                  </corecomEBO:RelationshipCode>                                    
                  <corecomEBO:ItemCompatibility>
                         <corecom:Identification>
                            <corecom:ContextID>
                                    <xsl:value-of select="ItemUDA[Name='Serial_Number']/CharValue"/>
                            </corecom:ContextID>
                        </corecom:Identification>
                        <corecomEBO:TypeCode>
                              <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/RULE_TYPE.dvm&quot;,$DVMSourceCol,ItemUDA[Name=&quot;Rule_Type&quot;]/CharValue,$DVMTargetCol,ItemUDA[Name=&quot;Rule_Type&quot;]/CharValue)"/>
                        </corecomEBO:TypeCode>
                        <corecom:EffectiveTimePeriod>
                              <corecom:StartDateTime>
                                    <xsl:call-template name="formatUDADate">
                                    <xsl:with-param name="formatDateParam" select="ItemUDA[Name='Start_Date']/DatetimeValue"/>
                              </xsl:call-template>  
                              </corecom:StartDateTime>
                              <corecom:EndDateTime>
                                    <xsl:call-template name="formatUDADate">
                                    <xsl:with-param name="formatDateParam" select="ItemUDA[Name='End_Date']/DatetimeValue"/>
                                    </xsl:call-template>                
                              </corecom:EndDateTime>
                        </corecom:EffectiveTimePeriod>
                        <corecomEBO:GroupName>                               
                               <xsl:value-of select="ItemUDA[Name=&quot;Matrix_Name&quot;]/CharValue"/> 
                        </corecomEBO:GroupName>                        
                        <corecom:ClassificationReference>
                              <corecom:ClassificationCodeIdentification>
                                    <corecom:ContextID schemeID="Object_Product_Line">
                                        <xsl:value-of select="ItemUDA[Name='Object_Product_Line']/CharValue"/>
                                    </corecom:ContextID>
                              </corecom:ClassificationCodeIdentification>
                              <corecom:Name>
                                    <xsl:value-of select="ItemUDA[Name='Object_Product_Class']/CharValue"/>
                              </corecom:Name>
                        </corecom:ClassificationReference>
                  </corecomEBO:ItemCompatibility>
            </corecomEBO:RelatedItem>
      </xsl:template>
      <xsl:template name="CommsProductInfo">
      <corecomEBO:ItemServiceCharacteristics>
                  <corecomEBO:ServiceInstanceIndicator>                      
                        <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Service_Instance_Enabled']/CharValue"/>
                    </xsl:call-template>                        
                  </corecomEBO:ServiceInstanceIndicator>
                  <corecomEBO:SpecialRatingMaximumQuantity>
                        <xsl:value-of select="ItemUDA[Name='Special_Rating_Max_Items']/NumberValue"/>
                  </corecomEBO:SpecialRatingMaximumQuantity>
                  <corecomEBO:SpecialRatingTypeCode>                        
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_BILLING_SPECIAL_RATING_TYPE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Special_Rating_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Special_Rating_Type']/CharValue)"/>
                  </corecomEBO:SpecialRatingTypeCode>                  
                  <corecomEBO:BillableIndicator>                        
                        <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Billable']/CharValue"/>
                    </xsl:call-template>
                  </corecomEBO:BillableIndicator>
<!--MSISDNRequired field change -->
				  <ns7:Custom>
					<corecomEBO:MSISDNIndicator>                  
					<xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='MSISDN_Required']/CharValue"/>
                    </xsl:call-template>
            </corecomEBO:MSISDNIndicator>
				  </ns7:Custom>
				  <!-- MSISDNRequired field change-->
          </corecomEBO:ItemServiceCharacteristics>              
            <corecomEBO:CompoundItemIndicator>                  
                  <xsl:call-template name="IndicatorFlag">
                      <xsl:with-param name="value" select="ItemUDA[Name='Compound_Product']/CharValue"/>
                    </xsl:call-template>
            </corecomEBO:CompoundItemIndicator>
	    <corecomEBO:ItemOrderManagementCharacteristics>
                  <corecomEBO:FulfillmentCompositionTypeCode>
                      <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_FULFILLMENT_COMPOSITION_TYPE_CODE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Composition_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Composition_Type']/CharValue)"/>
                  </corecomEBO:FulfillmentCompositionTypeCode>
                  <corecomEBO:FulfillmentSuccessCode>                        
                        <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_SUCCESS_DEPENDENCY.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Success_dependency']/CharValue,$DVMTargetCol,ItemUDA[Name='Success_dependency']/CharValue)"/>                                        
                  </corecomEBO:FulfillmentSuccessCode>
            </corecomEBO:ItemOrderManagementCharacteristics>
            <corecomEBO:ItemClassification>  
              <corecomEBO:ClassificationCode listID="Fulfillment_Item_Code">
                <xsl:value-of select="ItemUDA[Name='Fulfillment_Item_Code']/CharValue"/>
              </corecomEBO:ClassificationCode>
            </corecomEBO:ItemClassification>
      </xsl:template>
       <xsl:template name="AdditionalEntityDetails">                
                <corecom:EffectiveTimePeriod>
                        <corecom:StartDateTime>
                        <xsl:call-template name="formatUDADate">
                                    <xsl:with-param name="formatDateParam" select="ItemUDA[Name='Effective_Start_Date']/DatetimeValue"/>
                              </xsl:call-template>                                
                        </corecom:StartDateTime>
                        <corecom:EndDateTime>
                           <xsl:call-template name="formatUDADate">
                                    <xsl:with-param name="formatDateParam" select="ItemUDA[Name='Effective_End_Date']/DatetimeValue"/>
                              </xsl:call-template>                                   
                        </corecom:EndDateTime>
                </corecom:EffectiveTimePeriod>                                
                <corecomEBO:EntityTypeCode>
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_ENTITY_TYPE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Entity_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Entity_Type']/CharValue)"/>
                </corecomEBO:EntityTypeCode>
                 <corecom:ItemIdentification>
                    <corecom:AlternateObjectKey>
                        <corecom:ID>
                            <xsl:value-of select="ItemUDA[Name='Internal_Reference_Code']/CharValue"/>
                        </corecom:ID>
                    </corecom:AlternateObjectKey>
                  </corecom:ItemIdentification>
      </xsl:template> 
      <xsl:template name="AdditionalBillingInformation">
        <corecomEBO:ItemServiceCharacteristics>
                <corecomEBO:BillingEntityTypeCode>
                    <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_BILLING_TYPE_CODE.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Billing_Entity_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Billing_Entity_Type']/CharValue)"/>
                </corecomEBO:BillingEntityTypeCode>
        </corecomEBO:ItemServiceCharacteristics>
        <corecomEBO:ItemClassification>
            <corecomEBO:ClassificationCode listID="Billing_Service_Type">                
                <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/APPLIES_TO.dvm&quot;,$DVMSourceCol,ItemUDA[Name='Billing_Service_Type']/CharValue,$DVMTargetCol,ItemUDA[Name='Billing_Service_Type']/CharValue)"/>                
            </corecomEBO:ClassificationCode>            
        </corecomEBO:ItemClassification>                
      </xsl:template>
      <xsl:template name="IndicatorFlag">
    <xsl:param name="value"/>
    <xsl:choose>
      <xsl:when test="$value='Y'">
        <xsl:value-of select="&quot;true&quot;"/>
      </xsl:when>
      <xsl:when test="$value='N'">
        <xsl:value-of select="&quot;false&quot;"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>  
   <xsl:template name="formatUDADate">
            <xsl:param name="formatDateParam"/>
            <xsl:variable name="TimeOffset" select="aia:getSystemModuleProperty('PIM',concat($SystemID,'.SERVER_TIMEZONE'),true())"/>
            <xsl:variable name="offset" select="$TimeOffset"/>
            <xsl:if test="$formatDateParam != ''">
                  <xsl:choose>
                        <xsl:when test="string-length($formatDateParam) = number(10)">
                              <xsl:variable name="formattedDate" select="concat(substring($formatDateParam,7,4),'-',substring($formatDateParam,1,2),'-',substring($formatDateParam,4,2),'T00:00:00',$offset)"/>
                              <xsl:value-of select="ebi:getConvertedDateWithTZ($formattedDate,$offset,true())"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:variable name="formattedDate" select="concat(substring($formatDateParam,7,4),'-',substring($formatDateParam,1,2),'-',substring($formatDateParam,4,2),'T',substring($formatDateParam,12,8),$offset)"/>
                              <xsl:value-of select="ebi:getConvertedDateWithTZ($formattedDate,$offset,true())"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
