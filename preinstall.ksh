#!/bin/ksh

untarfolder=$(cd $(dirname "$0") ; pwd)
cd ${untarfolder} 
dos2unix ${untarfolder}/aia.env
. ${untarfolder}/aia.env

${FMW_HOME_TOKEN}/oracle_common/common/bin/wlst.sh exportMDS.py ${BP_TARGET_WEBLOGIC_UN} ${BP_TARGET_WEBLOGIC_PW} ${BRM_HOSTNAME} ${SERVER_NAME} ${MDS_BKP_PATH}
EXIT_CODE=$?
if [ ${EXIT_CODE} -ne 0 ]; then
  echo -e "\n Backup of MDS failed. \n"
  exit ${EXIT_CODE}
fi
echo "preinstall complete"
