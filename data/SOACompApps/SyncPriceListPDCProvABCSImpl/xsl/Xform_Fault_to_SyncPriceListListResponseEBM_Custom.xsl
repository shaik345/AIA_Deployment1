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
<xsl:stylesheet version="1.0" xmlns:coreitemresp="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:coreitemebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:str="http://www.oracle.com/XSL/Transform/java/java.lang.String" exclude-result-prefixes="xsl xacml-context xref xp20 bpws ora ehdr orcl ids hwf aia wsa corecom coresalesorder sblorderdata sblasi str" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
   <xsl:template name="EBMHeaderType_ext"/>
   <xsl:template name="SenderType_ext"/>
   <xsl:template name="TargetType_ext"/>
   <xsl:template name="MessageProcessingInstructionType_ext"/>
   <xsl:template name="EBMTrackingType_ext"/>
   <xsl:template name="BusinessScopeType_ext"/>
</xsl:stylesheet>
