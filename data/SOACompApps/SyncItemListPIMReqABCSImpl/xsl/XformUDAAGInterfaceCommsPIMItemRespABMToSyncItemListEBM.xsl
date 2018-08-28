<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" 
 xmlns:ebi="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
  xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:ns4="http://xmlns.oracle.com/apps/bom/structure/service/in" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns7="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns1="http://xmlns.oracle.com/apps/ego/item/service" xmlns:ns3="http://xmlns.oracle.com/apps/bom/structure/service/out" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:ns5="http://xmlns.oracle.com/apps/ego/item/service/out" xmlns:ns6="http://xmlns.oracle.com/apps/ego/item/service/in" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:ns2="http://xmlns.oracle.com/QueryItemListPIMAdapter" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" version="1.0" exclude-result-prefixes="xsl ns4 xsd ns1 ns3 ns5 ns6 ns2 corecomEBO ns7 corecomcust xacml corecom ns0 svcdoc wsa coreitemcust xacml-context ehdr xp20 ora orcl bpws hwf xref ids" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
      <xsl:include href="XformUDACommsPIMItemRespABMToSyncItemListEBM.xsl"/>
      <xsl:include href="XformUDACommsPIMItemRespABMToSyncItemListEBM_Custom.xsl"/>

      <xsl:template name="ProcessAttributeGroupUDA">
            <xsl:param name="Name"/>
            <xsl:param name="SystemId"/>
            <xsl:param name="offsetServer"/>
            <xsl:variable name="DVMSourceCol" select="$SystemId"/>
            <xsl:variable name="PIMoffSet" select="$offsetServer"/>
            
            <xsl:choose>
            <xsl:when test="$Name='Prod_Details_Definitions'">
                  <xsl:call-template name="ProdDetailsDefinitions"/>
            </xsl:when>
            <!--Bethpage Dev PH.PRL.03 -->
            <xsl:when test="$Name='Related_Product_Lines'">
                  <xsl:call-template name="RelatedProdLines"/>
            </xsl:when>
            <!-- ends -->
            <xsl:when test="$Name='Product_Details_Marketing'">
                  <xsl:call-template name="PoductDetailsMarketing"/>
            </xsl:when>
            <xsl:when test="$Name='Product_Details_Service'">
                  <xsl:call-template name="ProductDetailsService"/>
            </xsl:when>
            <xsl:when test="$Name='Product_Details_Logistics'">
                  <xsl:call-template name="ProductDetailsLogistics"/>
            </xsl:when>
            <xsl:when test="$Name='Prod_Detail_More_Info'">
                  <xsl:call-template name="ProdDetailMoreInfo"/>
            </xsl:when>
            <xsl:when test="$Name='Sub_Compatible_Rule'">
                <xsl:call-template name="SubCompatibleRule"/>
            </xsl:when>
            <xsl:when test="$Name='Billing_Prod_Attr_General'">
                <xsl:call-template name="BillingProdAttrGeneral">
                 <xsl:with-param name="SystemId" select="$DVMSourceCol"/> 
                 <xsl:with-param name="PIMOffSetServer" select="$PIMoffSet"/> 
                </xsl:call-template>
            </xsl:when>  
            <xsl:when test="$Name='Comms_Product_Info'">
                <xsl:call-template name="CommsProductInfo"/>
            </xsl:when>       
             <!--MDM 2.5.1 -->
            <xsl:when test="$Name='Additional_Entity_Details'">
                <xsl:call-template name="AdditionalEntityDetails">                 
               </xsl:call-template>  
            </xsl:when>
             <xsl:when test="$Name='Additional_Billing_Information'">
                <xsl:call-template name="AdditionalBillingInformation"/>
            </xsl:when>
          <!-- End -->
            <!-- Promotions -->
            <xsl:when test="$Name='Promotion_More_Information'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
           <xsl:when test="$Name='Charge_Plan_Non_Recurring'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Charge_Plan_Recurring'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Charge_Plan_Adjust_Usage'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Commit_Charge_Credits'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Commitment_Terms'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Promotion_Upgrade'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Prod_Promotions_Components'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Component_Pricing'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <xsl:when test="$Name='Product_Promotion_Com_Adj'">
                          <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                                        <xsl:with-param name="Name" select="$Name"/> 
                           </xsl:call-template>              
            </xsl:when>
            <!-- End of Promotions -->        
            
            <!-- Sponsorship Event Map -->
            
            <xsl:when test="$Name='Sponsorship_Event_Map'">
                <xsl:call-template name="ProcessCustomSponsorshipEventAttributeGroupUDA">
                  <xsl:with-param name="Name" select="$Name"/>
                  <xsl:with-param name="SystemId" select="$DVMSourceCol"/>
                </xsl:call-template>
            </xsl:when>
            
            <!-- Promotion Group Access Control Membership -->
            
            <xsl:when test="$Name='Promotion_Group_Access_Control'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                  <xsl:with-param name="Name" select="$Name"/>
                </xsl:call-template>
            </xsl:when>
            
            <!-- Promotion Group Compatibility Rules -->
            
            <xsl:when test="$Name='PG_Compatibility_Rules'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                  <xsl:with-param name="Name" select="$Name"/>
                </xsl:call-template>
            </xsl:when>
            
            <!-- Asset Memeber Cardinality rules -->
            <xsl:when test="$Name='Product_AM_Cardinality_Rules'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                  <xsl:with-param name="Name" select="$Name"/>
                </xsl:call-template>
            </xsl:when>
            
            <!-- Billing-->
            <xsl:when test="$Name='Comms_Product_Info'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                    <xsl:with-param name="Name" select="$Name"/> 
                </xsl:call-template>              
            </xsl:when>
            

            <!-- End Of Billing-->
            
            <!-- Billing Discount Attributes -->
            <xsl:when test="$Name='Billing_Discount_Attributes'">
               <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                 <xsl:with-param name="Name" select="$Name"/> 
               </xsl:call-template>  
            </xsl:when>
            
            <!-- Billing Prod Attribute General -->
           <!-- <xsl:when test="$Name='Billing_Prod_Attr_General'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                 <xsl:with-param name="Name" select="$Name" /> 
               </xsl:call-template>  
            </xsl:when>-->
            <xsl:when test="$Name='Billing_Discount_Event_Map'">
                <xsl:call-template name="ProcessCustomDiscountEventAttributeGroupUDA">
                 <xsl:with-param name="Name" select="$Name"/> 
                 <xsl:with-param name="SystemId" select="$DVMSourceCol"/>
                </xsl:call-template>  
            </xsl:when>   
             <xsl:when test="$Name='Billing_Products_Event_Map'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                 <xsl:with-param name="Name" select="$Name"/> 
               </xsl:call-template>  
            </xsl:when>             
            <!-- Item Level AG -->
            <xsl:when test="$Name='Destination_Sys_Specification'">
                <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                 <xsl:with-param name="Name" select="$Name"/> 
               </xsl:call-template>  
            </xsl:when>            
            <xsl:when test="starts-with($Name,'XX')">
                     <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                       <xsl:with-param name="Name" select="$Name"/>
                 </xsl:call-template>
          </xsl:when>
       <xsl:otherwise>
              <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                       <xsl:with-param name="Name" select="$Name"/>
                 </xsl:call-template>
       </xsl:otherwise>
            </xsl:choose>
            
            
            
      </xsl:template>
</xsl:stylesheet>
