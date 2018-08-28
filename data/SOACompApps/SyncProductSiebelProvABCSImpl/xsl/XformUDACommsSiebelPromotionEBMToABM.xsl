<?xml version = '1.0' encoding = 'windows-1252'?>
<xsl:stylesheet version="1.0" xmlns:xsdLocal="http://www.siebel.com/xml/SWIPromotionIntegrationIO" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" exclude-result-prefixes="xsl ns0 xsd svcdoc corecomEBO wsa ns1 coreitemcust xacml-context corecomcust xacml corecom xsdLocal bpws ehdr hwf xp20 xref ora ids orcl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
 <xsl:param name="SystemID"/>
 <xsl:variable name="DVMSourceCol" select="$SystemID"/>
  <xsl:variable name="DVMTargetCol">
    <xsl:value-of select="&quot;COMMON&quot;"/>
  </xsl:variable> 
   <xsl:template name="Promotion_More_Information">
      <xsl:param name="DataAreaVar"/>
<!--
         <xsdLocal:DynamicDiscountMethod>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Promotion_More_Information']/corecom:Specification[corecom:Name='Dynamic_Discount_Method']/corecom:ValueText"/>
         </xsdLocal:DynamicDiscountMethod>
         <xsdLocal:PricingCommitType>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Promotion_More_Information']/corecom:Specification[corecom:Name='Pricing_Commit_Type']/corecom:ValueText"/>
         </xsdLocal:PricingCommitType>
-->
         <xsl:if test="boolean($DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Promotion_More_Information']/corecom:Specification[corecom:Name='Pricing_Commit_Type'])">
           <xsdLocal:PricingCommitType>
             <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/PRICE_OVERRIDETYPECODE.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name='Pricing_Commit_Type']/corecom:ValueText,$DVMSourceCol,&quot;&quot;)"/>
          </xsdLocal:PricingCommitType>
        </xsl:if>
        <xsl:if test="boolean($DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Promotion_More_Information']/corecom:Specification[corecom:Name='Dynamic_Discount_Method'])">
          <xsdLocal:DynamicDiscountMethod>
            <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/PRICE_DISCOUNTTYPECODE.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name='Dynamic_Discount_Method']/corecom:ValueText,$DVMSourceCol,&quot;&quot;)"/>
          </xsdLocal:DynamicDiscountMethod>
        </xsl:if>
     
         <xsdLocal:AdjustCharge>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Adjust_Usage']/corecom:Specification[corecom:Name='Adjust_Charge']/corecom:ValueNumeric"/>
         </xsdLocal:AdjustCharge>
         <xsdLocal:AdjustReason>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Adjust_Usage']/corecom:Specification[corecom:Name='Adjust_Reason']/corecom:ValueText"/>
         </xsdLocal:AdjustReason>
         <xsdLocal:CommitFlag>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Adjust_Usage']/corecom:Specification[corecom:Name='Commit']/corecom:ValueText"/>
         </xsdLocal:CommitFlag>
         <xsdLocal:ChargeBasis>
              <xsl:variable name="ChargeBasisVar">
                    <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Adjust_Usage']/corecom:Specification[corecom:Name='Charge_Basis']/corecom:ValueText"/>
              </xsl:variable>
            <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/UNIT_OF_MEASURE.dvm&quot;,$DVMTargetCol,$ChargeBasisVar,$DVMSourceCol,$ChargeBasisVar)"/>
         </xsdLocal:ChargeBasis>
         <xsdLocal:GracePeriod>
            <xsl:value-of select="corecom:Specification[corecom:Name='Grace_Period']/corecom:ValueNumeric"/>
         </xsdLocal:GracePeriod>
         <xsdLocal:GracePeriodUOM>
            <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/GRACE_PERIOD_UOM.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Grace_UOM&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Grace_UOM&quot;]/corecom:ValueText)"/>            
         </xsdLocal:GracePeriodUOM>
         <xsdLocal:Instances>
                    <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_INSTANCES.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Instances&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Instances&quot;]/corecom:ValueText)"/>                             
         </xsdLocal:Instances>
          <xsdLocal:NRCAmount>
             <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Non_Recurring']/corecom:Specification[corecom:Name='Non_Recurring']/corecom:ValueNumeric"/>
          </xsdLocal:NRCAmount>
         <xsdLocal:NRCQty>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Non_Recurring']/corecom:Specification[corecom:Name='NRC_Quantity']/corecom:ValueNumeric"/>
         </xsdLocal:NRCQty>
         <xsdLocal:Period>
            <xsl:value-of select="corecom:Specification[corecom:Name='Period']/corecom:ValueNumeric"/>
         </xsdLocal:Period>
         <xsdLocal:PeriodUOM>
            <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/GRACE_PERIOD_UOM.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Period_UOM&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Period_UOM&quot;]/corecom:ValueText)"/>
         </xsdLocal:PeriodUOM>
         <xsdLocal:Type>
              <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_TYPE.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Promotion_Type&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Promotion_Type&quot;]/corecom:ValueText)"/>            
         </xsdLocal:Type>
         <xsdLocal:RCAdjust>
            <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Recurring']/corecom:Specification[corecom:Name='RC_Adjust']/corecom:ValueNumeric"/>
         </xsdLocal:RCAdjust>
         <xsdLocal:RCAdjustmentUM>
             <xsl:variable name="RCAdjustmentUMVar">
                           <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Recurring']/corecom:Specification[corecom:Name='RC_Adjust_UM']/corecom:ValueText"/>
             </xsl:variable>   
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/RECURRING_ADJUST_UOM.dvm&quot;,$DVMTargetCol,$RCAdjustmentUMVar,$DVMSourceCol,RCAdjustmentUMVar)"/>
         </xsdLocal:RCAdjustmentUM>
         <xsdLocal:Recurring>
             <xsl:value-of select="$DataAreaVar/corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Charge_Plan_Recurring']/corecom:Specification[corecom:Name='Recurring']/corecom:ValueNumeric"/>
         </xsdLocal:Recurring>
         <xsdLocal:Score>
            <xsl:value-of select="corecom:Specification[corecom:Name='Score']/corecom:ValueNumeric"/>
         </xsdLocal:Score>
         <xsdLocal:Message>
            <xsl:value-of select="corecom:Specification[corecom:Name='Message']/corecom:ValueText"/>
         </xsdLocal:Message>
         <xsdLocal:TrackAsAgreement>
            <xsl:value-of select="corecom:Specification[corecom:Name='Track_As_Agreement']/corecom:ValueText"/>
         </xsdLocal:TrackAsAgreement>
              <xsdLocal:ShowInCatalog>
            <xsl:value-of select="corecom:Specification[corecom:Name='Show_In_Catalog']/corecom:ValueText"/>
         </xsdLocal:ShowInCatalog>    
        </xsl:template>
    
    
    <xsl:template name="Commitment_Terms">
      <xsl:param name="DataAreaVar"/>
         <xsdLocal:SwiPromotionTermsVbc>
            <xsdLocal:Description>
               <xsl:value-of select="corecom:Specification[corecom:Name='Description']/corecom:ValueText"/>
            </xsdLocal:Description>
            <xsdLocal:Name>
              <xsl:value-of select="corecom:Specification[corecom:Name='Name']/corecom:ValueText"/>
            </xsdLocal:Name>
            <xsdLocal:Number>
                <xsl:value-of select="corecom:Specification[corecom:Name='Number_Value']/corecom:ValueNumeric"/>
            </xsdLocal:Number>
            <xsdLocal:Type>
                     <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_COMMITMENT_TERMS_TYPE.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Commitment_Terms_Type&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Commitment_Terms_Type&quot;]/corecom:ValueText)"/>
            </xsdLocal:Type>
    </xsdLocal:SwiPromotionTermsVbc>
   </xsl:template>

    
   <xsl:template name="Commit_Charge_Credits">
      <xsl:param name="DataAreaVar"/>
         <xsdLocal:SwiPromotionCharges_CreditsVbc>
         <!--
            <xsdLocal:Id>
               <xsl:value-of select="corecom:Specification[corecom:Name='Serial_Number']/corecom:ValueText"/>
            </xsdLocal:Id>
     -->
            <xsdLocal:Amount>
               <xsl:value-of select="corecom:Specification[corecom:Name='Amount']/corecom:ValueNumeric"/>
            </xsdLocal:Amount>
            <xsdLocal:Plan>
              <xsl:value-of select="corecom:Specification[corecom:Name='Plan']/corecom:ValueText"/>
            </xsdLocal:Plan>
            <xsdLocal:Type>
                <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_CHARGE_CREDITS_TYPE.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Charge_Credits_Type&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Charge_Credits_Type&quot;]/corecom:ValueText)"/>
            </xsdLocal:Type>
         </xsdLocal:SwiPromotionCharges_CreditsVbc>
   </xsl:template>

  <xsl:template name="Related_Product_Lines">
    <xsl:param name="DataAreaVar"/>
     <xsdLocal:SwiPromotionAggregateProductLineVbc>
       <xsdLocal:ProductLine>
          <xsl:value-of select="corecom:Specification[corecom:Name='Product_Line']/corecom:ValueText"/>
       </xsdLocal:ProductLine>
     </xsdLocal:SwiPromotionAggregateProductLineVbc>
   </xsl:template>
   
   <xsl:template name="Promotion_Upgrade">
      <xsl:param name="DataAreaVar"/>
	   <xsl:if test="(corecom:Specification[corecom:Name='Product_Line']/corecom:ValueText = '') and (corecom:Specification[corecom:Name='Product_Class']/corecom:ValueText = '')">
         <xsdLocal:SwiPromotionUpgradeVbc>
            <xsdLocal:Reason>
                <xsl:value-of select="corecom:Specification[corecom:Name='Reason']/corecom:ValueText"/>
            </xsdLocal:Reason>
            <xsdLocal:DisplayProratedCharge>
                <xsl:value-of select="corecom:Specification[corecom:Name='Display_Prorated_Charge']/corecom:ValueText"/>
            </xsdLocal:DisplayProratedCharge>
            <xsdLocal:DisplayCommitment>
                <xsl:value-of select="corecom:Specification[corecom:Name='Display_Commitment']/corecom:ValueText"/>
            </xsdLocal:DisplayCommitment>
            <xsdLocal:ProratePlan>
                <xsl:value-of select="corecom:Specification[corecom:Name='Prorated_Plan']/corecom:ValueText"/>
            </xsdLocal:ProratePlan>
            <xsdLocal:CommitmentStart>
                <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_COMMITMENT_START.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Commitment_Start&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Commitment_Start&quot;]/corecom:ValueText)"/>                           
            </xsdLocal:CommitmentStart>
            <xsdLocal:Duration>
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_DURATION.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Duration&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Duration&quot;]/corecom:ValueText)"/>                           
            </xsdLocal:Duration>
            <xsdLocal:Penalty>
             <xsl:value-of select="corecom:Specification[corecom:Name='Penalty']/corecom:ValueNumeric"/>
            </xsdLocal:Penalty>
            <xsdLocal:OriginalPromotion>
               <xsl:value-of select="corecom:Specification[corecom:Name='Original_Promotion']/corecom:ValueText"/>
            </xsdLocal:OriginalPromotion>
            <xsdLocal:PenaltyAmountCurrencyCode>
                       <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/CURRENCY_CODE.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Currency&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Currency&quot;]/corecom:ValueText)"/>                
            </xsdLocal:PenaltyAmountCurrencyCode>
         </xsdLocal:SwiPromotionUpgradeVbc>
	  </xsl:if>
	<xsl:if test="corecom:Specification[corecom:Name='Product_Line']/corecom:ValueText != ''">
	  <xsdLocal:SwiPromotionUpgradeAggregateProductLineVbc>
            <xsdLocal:CommitmentStart>
                <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_COMMITMENT_START.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Commitment_Start&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Commitment_Start&quot;]/corecom:ValueText)"/>                           
            </xsdLocal:CommitmentStart>
            <xsdLocal:DisplayCommitment>
                <xsl:value-of select="corecom:Specification[corecom:Name='Display_Commitment']/corecom:ValueText"/>
            </xsdLocal:DisplayCommitment>
            <xsdLocal:DisplayProratedCharge>
                <xsl:value-of select="corecom:Specification[corecom:Name='Display_Prorated_Charge']/corecom:ValueText"/>
            </xsdLocal:DisplayProratedCharge>
            <xsdLocal:Duration>
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_DURATION.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Duration&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Duration&quot;]/corecom:ValueText)"/>                           
            </xsdLocal:Duration>
            <xsdLocal:Penalty>
             <xsl:value-of select="corecom:Specification[corecom:Name='Penalty']/corecom:ValueNumeric"/>
            </xsdLocal:Penalty>
            <xsdLocal:ProductLine>
              <xsl:value-of select="corecom:Specification[corecom:Name='Product_Line']/corecom:ValueText"/>
            </xsdLocal:ProductLine>
            <xsdLocal:ProratePlanName>
                <xsl:value-of select="corecom:Specification[corecom:Name='Prorated_Plan']/corecom:ValueText"/>
            </xsdLocal:ProratePlanName>
            <xsdLocal:Reason>
                <xsl:value-of select="corecom:Specification[corecom:Name='Reason']/corecom:ValueText"/>
            </xsdLocal:Reason>
         </xsdLocal:SwiPromotionUpgradeAggregateProductLineVbc>
	</xsl:if>

	<xsl:if test="corecom:Specification[corecom:Name='Product_Class']/corecom:ValueText != ''">
	  <xsdLocal:SwiPromotionUpgradeAggregateProductClassVbc>
	    <xsdLocal:CommitmentStart>
                <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_COMMITMENT_START.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Commitment_Start&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Commitment_Start&quot;]/corecom:ValueText)"/>                           
            </xsdLocal:CommitmentStart>
            <xsdLocal:DisplayCommitment>
                <xsl:value-of select="corecom:Specification[corecom:Name='Display_Commitment']/corecom:ValueText"/>
            </xsdLocal:DisplayCommitment>
            <xsdLocal:DisplayProratedCharge>
                <xsl:value-of select="corecom:Specification[corecom:Name='Display_Prorated_Charge']/corecom:ValueText"/>
            </xsdLocal:DisplayProratedCharge>
            <xsdLocal:Duration>
                  <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/ITEM_PROMOTION_DURATION.dvm&quot;,$DVMTargetCol,corecom:Specification[corecom:Name=&quot;Duration&quot;]/corecom:ValueText,$DVMSourceCol,corecom:Specification[corecom:Name=&quot;Duration&quot;]/corecom:ValueText)"/>                           
            </xsdLocal:Duration>
            <xsdLocal:Penalty>
             <xsl:value-of select="corecom:Specification[corecom:Name='Penalty']/corecom:ValueNumeric"/>
            </xsdLocal:Penalty>
	     <xsdLocal:ProductClassName>
		<xsl:value-of select="corecom:Specification[corecom:Name='Product_Class']/corecom:ValueText"/>
	     </xsdLocal:ProductClassName>
	     <xsdLocal:ProratePlanName>
                <xsl:value-of select="corecom:Specification[corecom:Name='Prorated_Plan']/corecom:ValueText"/>
            </xsdLocal:ProratePlanName>
            <xsdLocal:Reason>
                <xsl:value-of select="corecom:Specification[corecom:Name='Reason']/corecom:ValueText"/>
            </xsdLocal:Reason>
	  </xsdLocal:SwiPromotionUpgradeAggregateProductClassVbc>
	</xsl:if>
   </xsl:template>
   
     
</xsl:stylesheet>
