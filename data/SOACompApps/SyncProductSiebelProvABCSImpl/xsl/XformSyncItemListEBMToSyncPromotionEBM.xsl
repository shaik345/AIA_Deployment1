<?xml version = '1.0' encoding = 'UTF-8'?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="XSD">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/EnterpriseObjectLibrary/Core/EBO/Item/V2/ItemEBM.xsd"/>
      <rootElement name="SyncItemListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/EnterpriseObjectLibrary/Core/EBO/Item/V2/ItemEBM.xsd"/>
      <rootElement name="SyncItemListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.4.0(build 080718.0645) AT [MON JUN 01 11:50:14 IST 2009]. -->
?>
<xsl:stylesheet version="1.0" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" exclude-result-prefixes="xsl xref xp20 bpws ora ehdr orcl ids hwf" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  <xsl:template match="/">
      <coreeboitem:SyncItemListEBM>
          <xsl:apply-templates select="@*"/>
            <!--xsl:value-of select="corecomEBO:ItemSpecificationGroup/corecom:SpecificationGroup[corecom:Name='Prod_Details_Definitions']/corecom:Specification[corecom:Name='Entity_Type']/corecom:ValueText"/-->
            <!--xsl:value-of select="corecomEBO:ItemSpecificationGroup[corecom:SpecificationGroup/corecom:Name='Prod_Details_Definitions']/corecom:Specification[corecom:Name='Entity_Type']/corecom:ValueText"/>-->                      
               <xsl:apply-templates select="coreeboitem:SyncItemListEBM/corecom:EBMHeader"/>
               <xsl:for-each select="/coreeboitem:SyncItemListEBM/coreeboitem:DataArea">
                      <xsl:variable name="EntityType">
                        <xsl:value-of select="coreeboitem:SyncItemList/corecomEBO:EntityTypeCode"/>                    
                      </xsl:variable>
                    <xsl:if test="$EntityType='PROMOTION'">     
                             <xsl:copy-of select="."/>
                   </xsl:if>
               </xsl:for-each>
      </coreeboitem:SyncItemListEBM>
  
  </xsl:template>
  
  
  
  <xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>  
  </xsl:template>

</xsl:stylesheet>
