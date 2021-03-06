<?xml version = '1.0' encoding = 'windows-1252'?>
<xsl:stylesheet version="1.0" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:hdr="http://xmlns.oracle.com/pcbpel/adapter/appscontext/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/APPS/INV_EBI_ITEM_PUB/PROCESS_ITEM_LIST/" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/apps/SyncItemListEbizAdapter/" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/apps/SyncItemListEbizAdapter/" exclude-result-prefixes="xsl xsd corecomEBO ns1 corecomcust xacml corecom coreeboitem svcdoc wsa coreitemcust xacml-context plt hdr jca db ns2 ehdr aia xp20 ora orcl dvm bpws hwf xref ids">
   <xsl:include href="XformUDACommsPIMBOMRespABMToSyncBOMEBM.xsl"/>
   <xsl:include href="XformUDACommsPIMBOMRespABMToSyncBOMEBM_Custom.xsl"/>
   <xsl:template name="ProcessAttributeGroupUDA">
      <xsl:param name="Name"/>
      <xsl:param name="SystemId"/>
      <xsl:choose>
         <xsl:when test="$Name='Version_Structure'">
            <xsl:call-template name="VersionStructure"/>
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
         <xsl:when test="$Name='Prod_Promotions_Components'">
            <xsl:call-template name="ProcessCustomAttributeGroupUDA">
               <xsl:with-param name="Name" select="$Name"/>
            </xsl:call-template>
         </xsl:when>
         <!-- Code added for Bethpage Developement for Validate,Delete,Period,PeriodUOM,Grace Period,Grace Period UOM values -->
         <xsl:when test="$Name='Promotion_More_Information'">
            <xsl:call-template name="ProcessCustomAttributeGroupUDA">
               <xsl:with-param name="Name" select="$Name"/>
            </xsl:call-template>
         </xsl:when>
         
         <xsl:when test="$Name='Promotion_Upgrade'">
              <xsl:call-template name="ProcessCustomAttributeGroupUDA">
                <xsl:with-param name="Name" select="$Name"/> 
               </xsl:call-template>              
         </xsl:when>
         <!-- ends here -->
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
   <xsl:template name="ProcessStructureHeaderAttributeGroup">
      <xsl:param name="Name"/>
      <xsl:param name="SystemId"/>
             <xsl:call-template name="ProcessCustomStructureHeaderAttributeGroupUDA">
               <xsl:with-param name="Name" select="$Name"/>
            </xsl:call-template>
   </xsl:template>
</xsl:stylesheet>
