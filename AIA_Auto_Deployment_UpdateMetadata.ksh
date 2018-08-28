#!/bin/ksh

untarfolder=$(cd $(dirname "$0") ; pwd)
echo "${untarfolder}"
. ${untarfolder}/aia.env

echo --- DATE Format ----
DATE=$(date +"%Y%m%d_%s")

echo "... Creating deployment articrafts... Untaring as well executing META DATA deployment... "

echo "... Logs are captured in /opt/aia/logs/ScriptLog.${DATE}"

doScriptLog() {
  BRM_HOSTNAME=
  FMW_HOME_TOKEN=
  BP_TARGET_AIA_HOSTNAME=
  BP_TARGET_AIA_SCHEMA=
  DEST_XML_PATH=
  AIA_HOME_PATH=
  SIEBEL_ENDPOINT_WS_NAME=
  BRMJAR_DESTN_LOCN=
  OSM_PASS=

  . ${untarfolder}/aia.env

  #DEST_XML_PATH=${untarfolder}/data/AIAMetaData


  ## Chceking if $DEST_XML_PATH starts with /
  if [ $(echo ${DEST_XML_PATH} | sed 's%^/%%') = ${DEST_XML_PATH} ]; then
    echo "Script will exit"
    echo "Please correct the of DEST_XML_PATH in aia.env.propagaties file then run it once again"
    exit 1
  else
    echo "Continue with Deployment"
  fi

  echo  --- Running aiaenv.sh File ---
  . ${AIA_INSTANCE}/bin/aiaenv.sh 
  
  cd  ${untarfolder}/data

  ## Manipulate string DEST_XML_PATH to introduce escape character for "/" to wrk for sed command below
  TEMP_DELIMITER='\\\/'
  DEST_XML_PATH=`echo ${DEST_XML_PATH} | sed "s/\//${TEMP_DELIMITER}/g"`
  BP_TARGET_SERVER_URL=`echo ${BP_TARGET_SERVER_URL} | sed "s/\//${TEMP_DELIMITER}/g"`
  BRM_HOSTNAME=`echo ${BRM_HOSTNAME} | sed "s/\//${TEMP_DELIMITER}/g"`
  FMW_HOME_TOKEN=`echo ${FMW_HOME_TOKEN} | sed "s/\//${TEMP_DELIMITER}/g"`
  AIA_HOME_PATH=`echo ${AIA_HOME_PATH} | sed "s/\//${TEMP_DELIMITER}/g"`
  SIEBEL_ENDPOINT_WS_NAME=`echo ${SIEBEL_ENDPOINT_WS_NAME} | sed "s/\//${TEMP_DELIMITER}/g"`
  BRMJAR_DESTN_LOCN=`echo ${BRMJAR_DESTN_LOCN} | sed "s/\//${TEMP_DELIMITER}/g"`
  OSM_PASS=`echo ${OSM_PASS} | sed "s/\//${TEMP_DELIMITER}/g"`
  ## Conditional check for ProductXrefTabPopulation process deployment
  echo "------  Conditional check for ProductXrefTabPopulation process deployment ------"

  if [ -d ${untarfolder}/data/SOACompApps/ProductXrefTabPopulation ]; then
    cd ${untarfolder}/data/SOACompApps/ProductXrefTabPopulation

    sed -e "s/AIA_HOME_PATH/${AIA_HOME_PATH}/g" composite.xml > composite.xml_final
    EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi

    echo " --- Path Replaced in composite.xml  ---"
    echo "--- Deleting the composite.xml  ---"
    rm -rf composite.xml
    mv composite.xml_final composite.xml
  else
    echo "..... No ProductXrefTabPopulation process exsists ...."
  fi

  ## metadata
  ## copy deploy descriptor file
  echo --- Updating the Build.Properties ---

  cd ${untarfolder}/data 

  sed -e "s|AIA_XREF_SCHEMA|${AIA_XREF_SCHEMA}|g" -e "s|BRM_DATABASE_SCHEMA|${BRM_DATABASE_SCHEMA}|g" -e "s|AIA_PATH|${AIA_HOME_PATH}|g" -e "s|OSM_PASS|${OSM_PASS}|g" -e "s|BRM_HOSTNAME|${BRM_HOSTNAME}|g" -e "s|FMW_HOME_TOKEN|${FMW_HOME_TOKEN}|g" -e "s|BP_TARGET_AIA_HOSTNAME|${BP_TARGET_AIA_HOSTNAME}|g" -e "s|BP_TARGET_AIA_PORTNO|${BP_TARGET_AIA_PORTNO}|g" -e "s|BP_TARGET_AIA_SCHEMA|${BP_TARGET_AIA_SCHEMA}|g" -e "s|BP_TARGET_SIEBEL_HOSTNAME|${BP_TARGET_SIEBEL_HOSTNAME}|g" -e "s|BP_TARGET_SIEBEL_PORTNO|${BP_TARGET_SIEBEL_PORTNO}|g" -e "s|BP_TARGET_WEBLOGIC_UN|${BP_TARGET_WEBLOGIC_UN}|g" -e "s|BP_TARGET_WEBLOGIC_PW|${BP_TARGET_WEBLOGIC_PW}|g" -e "s|BP_TARGET_SERVER_URL|${BP_TARGET_SERVER_URL}|g" -e "s|BRMJAR_DESTN_LOCN|${BRMJAR_DESTN_LOCN}|g" -e "s|TARGET_SOA_MANAGEDSERVERNAME|${TARGET_SOA_MANAGEDSERVERNAME}|g" -e "s|TA_DB_HOSTNAME|${TA_DB_HOSTNAME}|g" -e "s|TA_DB_PORT|${TA_DB_PORT}|g" -e "s|TA_DB_NAME|${TA_DB_NAME}|g" -e "s|TA_DB_USER|${TA_DB_USER}|g" -e "s|TA_DB_PASSWORD|${TA_DB_PASSWORD}|g" -e "s|TA_DEP_USER|${TA_DEP_USER}|g" -e "s|PCKNAME|${PCKNAME}|g" -e "s|PCK_LOCTN|${PCK_LOCTN}|g" ${untarfolder}/data/build.properties > ${untarfolder}/data/build.properties_Final
  EXIT_CODE=$?
  if [ ${EXIT_CODE} -ne 0 ]; then
    echo -e "\n Command sed failed. \n"
    exit ${EXIT_CODE}
  fi

  echo --- Path Replaced in Build.Properties ---
  echo --- Deleting the Build.Properties ---
  rm -rf ${untarfolder}/data/build.properties
  
  
  mv ${untarfolder}/data/build.properties_Final ${untarfolder}/data/build.properties
  
  
  ## Conditional check for AIA config prperties file deployment
  if [ -f ${untarfolder}/data/AIAMetaData/config/AIAConfigurationProperties.xml ]; then
    cd ${untarfolder}/data/AIAMetaData/config 

        sed -e "s|AIA_HOSTNAME|${AIA_HOSTNAME}|g" -e "s/AIA_PORT/${AIA_PORT}/g" -e "s/PDC_HOSTNAME/${PDC_HOSTNAME}/g" -e "s/PDC_PORT/${PDC_PORT}/g" -e "s/OPH_HOSTNAME/${OPH_HOSTNAME}/g" -e "s/OPH_PORT/${OPH_PORT}/g" -e "s/UIM_HOSTNAME/${UIM_HOSTNAME}/g"  -e "s/UIM_PORT/${UIM_PORT}/g" -e "s/PH4C_PORT/${PH4C_PORTNO}/g" -e "s/SBL_HOSTNAME/${SBL_HOSTNAME}/g" -e "s/SBL_PORT/${SBL_PORT}/g" -e "s/SBL_PRICE_LIST/${SBL_PRICE_LIST}/g" -e "s/CLUSTER_URLS/${CLUSTER_URLS}/g" -e "s/GESB_HOSTNAME/${GESB_HOSTNAME}/g" -e "s/GESB_PORT/${GESB_PORT}/g" AIAConfigurationProperties.xml > AIAConfigurationProperties.xml_Final
    EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi

    echo --- Path Replaced in AIAConfigurationProperties.xml ---
    echo --- Deleting the Build.Properties ---
    rm -rf AIAConfigurationProperties.xml
    mv AIAConfigurationProperties.xml_Final AIAConfigurationProperties.xml
  else
    echo"..... No AIA config prperties file to be deployed ...."
  fi

  cd ${untarfolder}/data
  echo --- Updating the UpdateMetaDataDP_FULL.xml ---

  sed "s/<REPLACE_PATH>/${DEST_XML_PATH}/g" UpdateMetaDataDP_FULL.xml > ${untarfolder}/data/UpdateMetaDataDP_FULL_temp.xml
  EXIT_CODE=$?
  if [ ${EXIT_CODE} -ne 0 ]; then
    echo -e "\n Command sed failed. \n"
    exit ${EXIT_CODE}
  fi

  echo --- Path Replaced in UpdateMetaDataDP_FULL_temp.xml ---
  echo --- Deleting the UpdateMetaDataDP_FULL.xml ---
  rm -rf UpdateMetaDataDP_FULL.xml
  mv UpdateMetaDataDP_FULL_temp.xml UpdateMetaDataDP_FULL.xml

  cp UpdateMetaDataDP_FULL.xml ${AIA_INSTANCE}/config
  cp ${untarfolder}/data/UpdateMetaData_FULL.xml ${AIA_HOME}/Infrastructure/Install/config/
  #EXIT_CODE=$?
  return ${EXIT_CODE}
}

doScriptLog > /opt/aia/logs/ScriptLog.${DATE} 2>&1
if [ ${EXIT_CODE} -ne 0 ]; then
  echo -e "\n Function doScriptLog failed. \n"
  exit ${EXIT_CODE}
fi

doDeployLog() {
  . ${untarfolder}/aia.env
  cd ${untarfolder}/data
  echo "... Running ANT replaceAll URLs ..."
  
  ant replaceAllURLs

  EXIT_CODE=$?
  if [ ${EXIT_CODE} -ne 0 ]; then
    echo -e "\n ANT replaceAllURLs failed. \n"
    exit ${EXIT_CODE}
  fi

}

doDeployLog | tee /opt/aia/logs/DeployLog.${DATE}
if [ ${EXIT_CODE} -ne 0 ]; then
  echo -e "\n Function doDeployLog failed. \n"
  exit ${EXIT_CODE}
fi

cd ${untarfolder}
. ${untarfolder}/aia.env

echo
echo "... Running ANT Updatemetadata_Full XML ..."
echo

cd ${AIA_HOME}/Infrastructure/Install/config/

ant -f UpdateMetaData_FULL.xml -logfile /opt/aia/logs/UpdateMetaData.log_${DATE}
EXIT_CODE=$?
if [ ${EXIT_CODE} -ne 0 ]; then
  echo -e "\n ANT UpdateMetaData_FULL.xml failed. \n"
  exit ${EXIT_CODE}
fi
echo
echo "... Completed Meta Data deployment ... For status please check the log /opt/aia/logs/ScriptLog.${DATE} ..."
echo
cd  ${untarfolder}
