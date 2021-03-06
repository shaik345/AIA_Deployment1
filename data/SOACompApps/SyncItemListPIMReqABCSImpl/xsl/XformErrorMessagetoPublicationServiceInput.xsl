<?xml version = '1.0' encoding = 'UTF-8'?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationObjectLibrary/PIM/V1/wsdls/PublicationService_Service.wsdl"/>
      <rootElement name="PublicationService_GetBatchSystems_Response" namespace="http://xmlns.oracle.com/apps/ego/pubfwk/service"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/AIAMetaData/AIAComponents/ApplicationObjectLibrary/PIM/V1/wsdls/PublicationService_Service.wsdl"/>
      <rootElement name="PublicationService_UpdatePublicationStatus" namespace="http://xmlns.oracle.com/apps/ego/pubfwk/service"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 10.1.3.4.0(build 080718.0645) AT [TUE JUN 23 15:57:06 IST 2009]. -->
?>
<xsl:stylesheet version="1.0" xmlns:ns2="http://xmlns.oracle.com/svc" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:tns="http://xmlns.oracle.com/oracle/apps/ego/pubfwk/service/PublicationService" xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:tns1="http://xmlns.oracle.com/apps/ego/pubfwk/service" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns0="http://xmlns.oracle.com/svc/expression" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:tns2="http://xmlns.oracle.com/apps/fnd/ServiceBean" xmlns:ns1="http://xmlns.oracle.com/svc/description" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" exclude-result-prefixes="xsl ns2 tns tns1 xsd soap ns0 tns2 ns1 bpws ehdr hwf xp20 xref ora ids orcl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
  <xsl:include href="XformErrorMessagetoPublicationServiceInput_Custom.xsl"/>
  <xsl:param name="MODE"/>
  <xsl:param name="BATCHID"/>
  <xsl:param name="ERRORSUMMARY"/>
  <xsl:template match="/">
    <tns1:PublicationService_UpdatePublicationStatus>
      <statusInputParams>
        <Mode>
          <xsl:value-of select="$MODE"/>
        </Mode>
        <BatchStatus>
          <BatchId>
            <xsl:value-of select="$BATCHID"/>
          </BatchId>
        <xsl:for-each select="/tns1:PublicationService_GetBatchSystems_Response/listofTargetSystems/TargetSystem">
           <ListofSystemStatuses>
            <SystemCode>
			   <xsl:value-of select="SystemCode"/>
	      </SystemCode>
      		<StatusCode>
		       <xsl:text disable-output-escaping="no">F</xsl:text>
	      </StatusCode>
	      <Message>
       		<xsl:value-of select="$ERRORSUMMARY"/>
		      </Message>
                </ListofSystemStatuses>
              </xsl:for-each>  
        </BatchStatus>
      </statusInputParams>
      <xsl:call-template name="XformErrorMessagetoPublicationServiceInputEXT"/>
    </tns1:PublicationService_UpdatePublicationStatus>
  </xsl:template>
</xsl:stylesheet>
