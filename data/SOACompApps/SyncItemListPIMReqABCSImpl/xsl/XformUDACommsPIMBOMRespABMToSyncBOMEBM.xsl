<?xml version = '1.0' encoding = 'windows-1252'?>
<xsl:stylesheet version="1.0" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:hdr="http://xmlns.oracle.com/pcbpel/adapter/appscontext/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" exclude-result-prefixes="xsl xsd corecomEBO ns1 corecomcust xacml corecom coreeboitem svcdoc wsa coreitemcust xacml-context plt hdr jca db ns2 ehdr aia xp20 ora orcl dvm bpws hwf xref ids">

     <xsl:template name="VersionStructure">
                        <corecom:Name>
			      <xsl:value-of select="ComponentUDA[Name='Relationship_Name']/CharValue"/>	
                        </corecom:Name>
                        <corecom:TypeCode>
			      <xsl:value-of select="ComponentUDA[Name='Domain_Type']/CharValue"/>	
                        </corecom:TypeCode>
                        <corecom:DefaultIndicator>
			      <xsl:value-of select="ComponentUDA[Name='Default_Product']/CharValue"/>	
                        </corecom:DefaultIndicator>
                        <corecom:MaximumQuantity>
			      <xsl:value-of select="ComponentUDA[Name='Max_Cardinality']/NumberValue"/>	
                        </corecom:MaximumQuantity>
                        <corecom:MinimumQuantity>
			      <xsl:value-of select="ComponentUDA[Name='Min_Cardinality']/NumberValue"/>	
                        </corecom:MinimumQuantity>
                        <corecom:DefaultQuantity>
			      <xsl:value-of select="ComponentUDA[Name='Default_Cardinality']/NumberValue"/>	
                        </corecom:DefaultQuantity>
			<corecom:ClassificationReference>
			  <corecom:Name>
				<xsl:value-of select="ComponentUDA[Name='Product_Class']/CharValue"/>	
			  </corecom:Name>
			</corecom:ClassificationReference>
    </xsl:template>
    
    <!--
      <xsl:template name="ComponentPricing">
                  <corecomEBO:BillOfMaterialsComponentItem>
                        <corecom:PriceAdjustmentTypeCode>
                              <xsl:value-of select="corecom:Specification[corecom:Name='Adjustment_Type']/corecom:ValueText"/>
                        </corecom:PriceAdjustmentTypeCode>
                        <corecom:PriceAdjustmentQuantity>
                              <xsl:value-of select="corecom:Specification[corecom:Name='Value']/corecom:NumberValue"/>
                              <xsl:attribute name="unitCode">
                                    <xsl:value-of select="corecom:Specification[corecom:Name='Currency_Code']/corecom:ValueText"/>
                              </xsl:attribute>
                        </corecom:PriceAdjustmentQuantity>
		    	   <corecom:OverrideComponentItemIdentification>
    		    	       <corecom:ContextID> <xsl:value-of select="corecom:Specification[corecom:Name='Exchange_Date']/corecom:DatetimeValue"/></corecom:ContextID>
		    	   </corecom:OverrideComponentItemIdentification>
                  </corecomEBO:BillOfMaterialsComponentItem>
      </xsl:template>
      -->
</xsl:stylesheet>
