<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" 
  xmlns:ebi="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
   xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:ns4="http://xmlns.oracle.com/apps/bom/structure/service/in" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns7="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns1="http://xmlns.oracle.com/apps/ego/item/service" xmlns:ns3="http://xmlns.oracle.com/apps/bom/structure/service/out" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:ns5="http://xmlns.oracle.com/apps/ego/item/service/out" xmlns:ns6="http://xmlns.oracle.com/apps/ego/item/service/in" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:ns2="http://xmlns.oracle.com/QueryItemListPIMAdapter" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" version="1.0" exclude-result-prefixes="xsl ns4 xsd ns1 ns3 ns5 ns6 ns2 corecomEBO ns7 corecomcust xacml corecom ns0 svcdoc wsa coreitemcust xacml-context ehdr xp20 ora orcl bpws hwf xref ids" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
      <xsl:template match="/">
            <ns0:SyncItemListEBM>
                  <xsl:apply-templates select="ns0:SyncItemListEBM/corecom:EBMHeader"/>
                  <xsl:for-each select="/ns0:SyncItemListEBM/ns0:DataArea">
                        <ns0:DataArea>
                              <xsl:apply-templates select="corecom:Sync"/>
                              <ns0:SyncItemList>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:Name"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:Description"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:SerialControlIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:LotControlIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ServiceIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:TypeCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:DualUOMTrackingIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:BaseUOMCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:StorageUOMCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ShippingUOMCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:UOMConversionUsageCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:SecondaryUOMCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:PrimaryClassificationCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:PerUOMQuantity"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:CompoundItemIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ToolIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ProjectResourceIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:IncentiveCompensationAvailableIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:PriorityCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:StructureTypeCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:AccessPassKey"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:DefaultSubstitutionAvailabilityIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:PositiveSecondaryUOMDeviationPercent"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:NegativeSeconaryUOMDeviationPercent"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:QuantityTrackingIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:PricingUOMTypeCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:UOMConversionTypeCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ShortDescription"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:RevisionNotificationMethodCode"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ContainerItemIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:VehicleItemIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:EquipmentIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:CollateralIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:Level"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryItemIndicator"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:EntityTypeCode"/>
                                    <corecom:ItemIdentification>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:BusinessComponentID"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:ID"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:ContextID"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:ApplicationObjectKey"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:AlternateObjectKey"/>
                                          <corecom:Revision>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecom:Number"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecom:Code"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecom:Description"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecom:EffectiveDate"/>
                                          </corecom:Revision>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecom:ItemIdentification/corecom:GTIN"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:ManufacturerItemID"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecom:ItemIdentification/corecom:SupplierItemID"/>
                                    </corecom:ItemIdentification>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:Note"/>
                                    <corecom:Status>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:Status/corecom:Code"/>
                                    </corecom:Status>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:EffectiveTimePeriod"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:PaymentTerm"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:TemplateItemReference"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemAttachment"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemCatalog"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemSpecificationGroup"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemSpecificationGroup"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemLifecycleCharacteristics"/>
                                    <corecomEBO:ItemPhysicalCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:HeightMeasure"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:LengthMeasure"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:WidthMeasure"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:VolumeMeasure"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:WeightMeasure"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:TrainingFormatCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:ElectronicFormatIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:DownloadableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPhysicalCharacteristics/corecomEBO:IndivisibleIndicator"/>
                                    </corecomEBO:ItemPhysicalCharacteristics>
                                    <corecomEBO:InventoryCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:CycleCountEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotExpirationOnReceiptIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotMergeEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotSplitEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ReservationAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:SerializationEventCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:SerialStatusEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ShelfLifeDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:InitialLotNumberSuffix"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:InitialLotNumberPrefix"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:InitialSerialNumberSuffix"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:InitialSerialNumberPrefix"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:StockingAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:UnitCost"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:MaterialTransactionEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ShortageCheckIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ShelfLifeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:NegativeCycleCountDeviationPercent"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:PositiveCycleCountDeviationPercent"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:NextSerialNumber"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LocationControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:RestrictionTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LocationRestrictionTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotTranslationEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotSubstitutionEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:BulkPickIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:RevisionQuantityControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:RetestFrequency"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ExpirationActionDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ExpirationActionCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:NextLotNumber"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:MaturityDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:HoldDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:GradeControlIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:DefaultGradeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:DefaultMaterialStatusCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotStatusEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:DefaultLotStatusCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:DefaultSerialStatusCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ChildLotAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ChildLotNumberGenerationMethodAvailabilityIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ChildLotNumberPrefix"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:NextChildLotNumber"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ChildLotNumberValidationIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotAttributeInheritanceIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:LotDivisibleIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:ReservableTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecom:CarryingCost"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryCharacteristics/corecomEBO:Custom"/>
                                    </corecomEBO:InventoryCharacteristics>
                                    <corecomEBO:ItemPurchasingCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:AssetClassificationCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:HazardClassificationCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:ReceiptInspectionRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:UnitListPrice"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:PurchasingAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:ReceiptRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:RFQRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:TaxableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:TaxCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:IssueUOMCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:UseApprovedSupplierIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:ReceiptSubstitutionAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:UnorderedReceiptAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:OverReceiptQuantityPercent"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:ReceiptRoutingCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:PurchasingDescriptionUpdateAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:OutsourcingAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:OutsourcingUOMCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:RoundingFactor"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:ReceiptWindowControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:ExpressDeliveryAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:QuantityReceiptExceptionControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:LocationReceiptExceptionControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:PurchasingItemIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:OutsourcedAssemblyItemIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:UNNumberID"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:WarehouseUpdateDate"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecom:ReceivingDurationTolerance"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecom:PurchasingClosePercentTolerance"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecom:InvoicingClosePercentTolerance"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecomEBO:MarketUnitPrice"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPurchasingCharacteristics/corecom:PriceUpdatePercentTolerance"/>
                                    </corecomEBO:ItemPurchasingCharacteristics>
                                    <corecomEBO:ItemPlanningCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ConsignmentItemIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:LotSizeMultiplier"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:InventoryPlanningCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MakeOrBuyCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MaximumProductionOrderQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MinimumProductionOrderQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ReplenishmentSourceCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ShrinkageRate"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:PlanTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:FixedSupplyDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:VMIMinimumSupplyDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:VMIMaximumSupplyDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:VMIFixedOrderQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:VMIForecastTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ForecastHorizon"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MRPPlanningMethodCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:PlanningExceptionControlSet"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ATOForecastControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:EndAssemblyPeggingCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:AcceptableEarlyDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:OrderQuantityRoundingCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SupplyCreationIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:NonBudgetableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:CriticalIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:RepetitivePlanningIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:CalculateATPIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MPSAutoDeletionCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:PlanningTimeFenceCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:PlanningTimeFenceDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:DemandTimeFenceCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:DemandTimeFenceDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ReleaseTimeFenceCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ReleaseTimeFenceDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SubstitutionWindowCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SubstitutionWindowDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ContinuousInterOrganizationTransferCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:DistributionPlannedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MaximumInventoryQuantityCalculationDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:TargetInventoryQuantitySupplyDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:TargetInventoryQuantityCalculatrionDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SubcontractingComponentCategoryCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ReleaseAuthorizationRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:AutoASNExpirationIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:PlannedInventoryPointEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SupplyConsumptionConvergenceCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SupplyFeedingDivergenceCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:RepairProgram"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:RepairYieldPercent"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SupplierRepairLeadtime"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:PrepositionPointIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecom:Cost"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:SafetyStockCharacteristics"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ItemRepetitivePlanning"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ReorderCharacteristics"/>
                                          <corecomEBO:ProcessingLeadTimeCharacteristics>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:CumulativeManufacturingDuration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:CumulativeTotalDuration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:FixedDuration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:ReferenceLotSizeQuantity "/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:PostprocessingDuration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:PreprocessingDuration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:ProcessingDuration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:ProcessingLeadTimeCharacteristics/corecomEBO:UnitProductionDuration"/>
                                          </corecomEBO:ProcessingLeadTimeCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPlanningCharacteristics/corecomEBO:MinMaxCharacteristics"/>
                                    </corecomEBO:ItemPlanningCharacteristics>
                                    <corecomEBO:ItemManufacturingCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:StructureAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:BOMItemTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:ConfiguratorModelTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:EffectivityControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:EngineeringItemIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:CostingEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:InventoryAssetIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:StandardLotSizeQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:WIPSupplyTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:SumComponentTaxIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:WIPIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:OverCompletionToleranceTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:OverCompletionTolerancePercent"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:InventoryCarryingPenaltyAmount"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:OperationSlackPenaltyAmount"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:BillsOfMaterialsConfigurationOptionCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:ConfigurationMatchingMethodCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecomEBO:RollUpInclusionIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecom:ReturnPercentTolerance"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecom:ShipmentPercentTolerance"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturingCharacteristics/corecom:BaseModelItemReference"/>
                                    </corecomEBO:ItemManufacturingCharacteristics>
                                    <corecomEBO:ItemOrderManagementCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:AssembleToOrderIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:BackOrderEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:SaleableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:OrderableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:ReturnAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:ReturnInspectionRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:InvoicingEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:ShippableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:FulfillmentCompositionTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:FulfillmentSuccessCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:PriceTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:InternalOrderAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:InternalOrderEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:SalesOrderTransactionAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:PickComponentIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:PartialShipmentAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:OrderingATPCheckRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:ComponentATPCheckRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:DefaultSalesOrderSourceTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:FinancingEligibileIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:TaxCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:VolumeDiscountExclusionIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:MinimumOrderQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:MaximumOrderQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:InvoiceAppearanceAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemOrderManagementCharacteristics/corecomEBO:EligibilityCheckRequiredIndicator"/>
                                    </corecomEBO:ItemOrderManagementCharacteristics>
                                    <corecomEBO:ItemServiceCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:BillingTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:ContractTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:CreateFixedAssetIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:DefaultServiceContractDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:DefaultServiceContractPeriodCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:ContractCoverageEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:DefectTrackingEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:ProvisioningEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:ServiceBillingEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:ServiceRequestEnabledIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:WarrantyDelayDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:TrackInstanceIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:MeanTimeBetweenFailureDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:MeanTimeToRepairDuration"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:FieldReplacableIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:DefectiveReturnRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:MaximumOwnershipQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:MinimumOwnershipQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:PartialPurchaseAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:MultiRatingUsageMetricsSupportIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:ProvisioningTagCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:SpecialRatingMaximumQuantity"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:SpecialRatingTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:BillableIndicator"/>
											<!-- MSISDNRequired field change -->
										  <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/ns7:Custom/corecomEBO:MSISDNIndicator"/>
										  <!-- MSISDNRequired field change -->
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemServiceCharacteristics/corecomEBO:ServiceInstanceIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:RecoveredPartReturnControlCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:PriorityCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:BillingEntityTypeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemServiceCharacteristics/corecomEBO:AssetLinearityClassificationCode"/>
                                    </corecomEBO:ItemServiceCharacteristics>
                                    <corecomEBO:ItemClassification>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemClassification/corecom:Identification"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemClassification/corecomEBO:ClassificationCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemClassification/corecomEBO:ClassificationCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemClassification/corecomEBO:ProductLine"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemClassification/corecomEBO:PrimaryProductLineIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemClassification/corecomEBO:ItemClassificationSpecificationOverride"/>
                                    </corecomEBO:ItemClassification>
                                    <corecomEBO:ItemSupplier>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemSupplier/corecom:Identification/corecom:ID"/>
                                    </corecomEBO:ItemSupplier>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemManufacturer"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:RelatedItem"/>
                                    <corecomEBO:ItemRevisionHistory>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemRevisionHistory/corecom:Identification"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemRevisionHistory/corecomEBO:Description"/>
                                          <corecom:EffectiveTimePeriod>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemRevisionHistory/corecom:EffectiveTimePeriod/corecom:StartDateTime"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemRevisionHistory/corecom:EffectiveTimePeriod/corecom:Duration"/>
                                                <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemRevisionHistory/corecom:EffectiveTimePeriod/corecom:EndDateTime"/>
                                          </corecom:EffectiveTimePeriod>
                                    </corecomEBO:ItemRevisionHistory>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemUOMConversion"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:InventoryLocation"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemPriceList"/>
                                    <corecomEBO:ItemMarketingCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemMarketingCharacteristics/corecomEBO:TargetIndustryCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemMarketingCharacteristics/corecomEBO:TargetMinimumAge"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemMarketingCharacteristics/corecomEBO:TargetPostalCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemMarketingCharacteristics/corecomEBO:TargetCountryCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemMarketingCharacteristics/corecomEBO:TargetMaximumAge"/>
                                    </corecomEBO:ItemMarketingCharacteristics>
                                    <corecomEBO:ItemLogisticCharacteristics>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecomEBO:ModeOfTransportCodeCode"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecomEBO:BelowReorderQuantityAllocationAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecomEBO:AutomaticSubstitutionAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecomEBO:AutomaticAllocationAllowedIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecomEBO:AutomaticExplodeIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecomEBO:ShippingRequiredIndicator"/>
                                          <xsl:apply-templates select="ns0:SyncItemList/corecom:ItemIdentification/corecom:Revision/corecomEBO:ItemLogisticCharacteristics/corecom:CarrierPartyReference"/>
                                    </corecomEBO:ItemLogisticCharacteristics>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemRule"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemContainerCharacteristics"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemInternetCharacteristics"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemAssetCharacteristics"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemProcessManufacturingCharacteristics"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:ItemGLAcccount"/>
                                    <xsl:apply-templates select="ns0:SyncItemList/corecomEBO:Custom"/>
                              </ns0:SyncItemList>
                        </ns0:DataArea>
                  </xsl:for-each>
            </ns0:SyncItemListEBM>
      </xsl:template>
      
      
    <xsl:template match="*">
    <xsl:element name="{name()}">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
</xsl:template>

<xsl:template match="@*|text()|comment()|processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>
</xsl:stylesheet>
