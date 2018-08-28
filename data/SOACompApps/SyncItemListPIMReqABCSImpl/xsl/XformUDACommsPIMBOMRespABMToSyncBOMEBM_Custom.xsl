<?xml version = '1.0' encoding = 'windows-1252'?>
<xsl:stylesheet version="1.0" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" 
 xmlns:ebi="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
 xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:hdr="http://xmlns.oracle.com/pcbpel/adapter/appscontext/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1" xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/CommonEBO/V1" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04" xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:coreeboitem="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Item/V2" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/APPS/INV_EBI_ITEM_PUB/PROCESS_ITEM_LIST/" xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/apps/SyncItemListEbizAdapter/" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/apps/SyncItemListEbizAdapter/" exclude-result-prefixes="xsl xsd corecomEBO ns1 corecomcust xacml corecom coreeboitem svcdoc wsa coreitemcust xacml-context plt hdr jca db ns2 ehdr aia xp20 ora orcl dvm bpws hwf xref ids">
 <xsl:param name="SystemID"/>
      <xsl:template name="ProcessCustomAttributeGroupUDA">
            <xsl:param name="Name"/>
            
             <corecomEBO:ComponentItemSpecificationGroup>
                  <corecom:SpecificationGroup>
                        <corecom:Name>
                              <xsl:value-of select="AttributeGroupName"/>
                        </corecom:Name>
                        <xsl:for-each select="ComponentUDA">
                              <corecom:Specification>
                                    <corecom:Name>
                                          <xsl:value-of select="Name"/>
                                    </corecom:Name>
                                    <xsl:choose>
                                     <xsl:when test="Name = 'Description'">
                                     <xsl:for-each select="ComponentTranslatableUDA">
                                      <corecom:ValueText>
                                        <xsl:attribute name="languageCode">
                                         <xsl:value-of select="dvm:lookupValue(&quot;oramds:/apps/AIAMetaData/dvm/LANGUAGE_CODE.dvm&quot;,$SystemID,LanguageCode,'COMMON',LanguageCode)" />
                                        </xsl:attribute>
                                        <xsl:choose>
                                         <xsl:when test="TranslatedCharValue != ''">
                                            <xsl:call-template name="getTranslatedCharValue">
                                                <xsl:with-param name="charValueParam" select="CharValue"/>
                                                <xsl:with-param name="transCharValueParam" select="TranslatedCharValue"/>
                                            </xsl:call-template>
                                          </xsl:when>
                                          <xsl:otherwise>
                                           <xsl:call-template name="getTranslatedCharValue">
                                                <xsl:with-param name="charValueParam" select="../CharValue"/>
                                                <xsl:with-param name="transCharValueParam" select="../TranslatedCharValue"/>
                                            </xsl:call-template>
                                          </xsl:otherwise>
                                         </xsl:choose>
                                      </corecom:ValueText>
                                     </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <corecom:ValueText>
                                          <xsl:call-template name="getTranslatedCharValue">
                                                <xsl:with-param name="charValueParam" select="CharValue"/>
                                                <xsl:with-param name="transCharValueParam" select="TranslatedCharValue"/>
                                          </xsl:call-template>
                                      </corecom:ValueText>
                                    </xsl:otherwise>
                                    </xsl:choose>
                                    <corecom:ValueNumeric>
                                          <xsl:value-of select="NumberValue"/>
                                    </corecom:ValueNumeric>
                                    <corecom:ValueDate>
                                          <xsl:value-of select="DateValue"/>
                                    </corecom:ValueDate>
                                    <corecom:ValueDateTime>
                                          <xsl:call-template name="formatUDADate">
                                                <xsl:with-param name="formatDateParam" select="DatetimeValue"/>
                                          </xsl:call-template>
                                    </corecom:ValueDateTime>
                                    <corecom:ValueQuantity>
                                          <xsl:value-of select="UomValue"/>
                                    </corecom:ValueQuantity>
                              </corecom:Specification>
                        </xsl:for-each>
                  </corecom:SpecificationGroup>
              </corecomEBO:ComponentItemSpecificationGroup>
      </xsl:template>
      <xsl:template name="ProcessCustomStructureHeaderAttributeGroupUDA">
            <xsl:param name="Name"/>
            <corecomEBO:ItemStructureSpecificationGroup>
                  <corecom:SpecificationGroup>
                        <corecom:Name>
                              <xsl:value-of select="AttributeGroupName"/>
                        </corecom:Name>
                        <xsl:for-each select="StructureHeaderUDA">
                              <corecom:Specification>
                                    <corecom:Name>
                                          <xsl:value-of select="Name"/>
                                    </corecom:Name>
                                    <corecom:ValueText>
                                          <xsl:call-template name="getTranslatedCharValue">
                                                <xsl:with-param name="charValueParam" select="CharValue"/>
                                                <xsl:with-param name="transCharValueParam" select="TranslatedCharValue"/>
                                          </xsl:call-template>
                                    </corecom:ValueText>
                                    <corecom:ValueNumeric>
                                          <xsl:value-of select="NumberValue"/>
                                    </corecom:ValueNumeric>
                                    <corecom:ValueDate>
                                          <xsl:value-of select="DateValue"/>
                                    </corecom:ValueDate>
                                    <corecom:ValueDateTime>
                                          <xsl:call-template name="formatUDADate">
                                                <xsl:with-param name="formatDateParam" select="DatetimeValue"/>
                                          </xsl:call-template>
                                    </corecom:ValueDateTime>
                                    <corecom:ValueQuantity>
                                          <xsl:value-of select="UomValue"/>
                                    </corecom:ValueQuantity>
                              </corecom:Specification>
                        </xsl:for-each>
                  </corecom:SpecificationGroup>
            </corecomEBO:ItemStructureSpecificationGroup>
      </xsl:template>
      
      <xsl:template name="getTranslatedCharValue">
            <xsl:param name="charValueParam"/>
            <xsl:param name="transCharValueParam"/>
            <xsl:choose>
                  <xsl:when test="$charValueParam != ''">
                        <xsl:value-of select="$charValueParam"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$transCharValueParam"/>
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
