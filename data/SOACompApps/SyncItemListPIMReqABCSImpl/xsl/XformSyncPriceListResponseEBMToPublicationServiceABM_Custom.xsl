<?xml version = '1.0' encoding = 'UTF-8'?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="XSD">
        <schema location="oramds:/apps/AIAMetaData/AIAComponents/EnterpriseObjectLibrary/Industry/Communications/EBO/PriceList/V2/PriceListEBM.xsd"/>
        <rootElement name="SyncPriceListListEBM" namespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2"/>    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationObjectLibrary/PIM/V1/wsdls/PublicationService_Service.wsdl"/>
      <rootElement name="PublicationService_UpdatePublicationStatus" namespace="http://xmlns.oracle.com/apps/ego/pubfwk/service"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.4.0(build 080718.0645) AT [SUN JUL 12 21:09:01 IST 2009]. -->
?>
<xsl:stylesheet version="2.0" xmlns:corepricelistcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/PriceList/V2" xmlns:pricelistebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:ns2="http://xmlns.oracle.com/svc/expression" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:tns2="http://xmlns.oracle.com/apps/fnd/ServiceBean" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:ns5="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PriceList/V2" xmlns:ns4="http://xmlns.oracle.com/svc" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:tns="http://xmlns.oracle.com/oracle/apps/ego/pubfwk/service/PublicationService" xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:tns1="http://xmlns.oracle.com/apps/ego/pubfwk/service" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:coreitemcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/Item/V2" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:ns3="http://xmlns.oracle.com/svc/description" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" exclude-result-prefixes="xsl corepricelistcust xsd corecomEBO corecomcust xacml corecom ns5 svcdoc wsa xacml-context ns2 tns2 ns4 tns tns1 soap ns3 ehdr xp20 ora orcl bpws hwf xref ids" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  <xsl:template name="XformSyncPriceListResponseEBMToPublicationServiceABMEXT"/>
</xsl:stylesheet>
