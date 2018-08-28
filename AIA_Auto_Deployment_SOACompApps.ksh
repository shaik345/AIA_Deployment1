#!/bin/ksh
untarfolder=$(cd $(dirname "$0") ; pwd)
. ${untarfolder}/aia.env

echo --- DATE Format ----
DATE=$(date +"%Y%m%d_%s")

. ${AIA_INSTANCE}/bin/aiaenv.sh 
 

doAIAProcessesLog() {
  . ${untarfolder}/aia.env
  echo "... Deploying all AIA Processes ..."

  cd ${untarfolder}/data

echo "============================================================="

  ## AIA services
  for subdir in ./SOACompApps/*; do cp -r ${AIA_INSTANCE}/config/MDSConfig/src/  ${subdir}; done
  for subdir in ./SOACompApps/*; do cp -r ${AIA_INSTANCE}/config/MDSConfig/.adf/  ${subdir}; done

  echo
  echo "... Running ANT Build All ..."
  echo

  ant buildall

  EXIT_CODE=$?
  if [ ${EXIT_CODE} -ne 0 ]; then
    echo -e "\n ANT buildall failed. \n"
    exit ${EXIT_CODE}
  fi

  EXIT_CODE=$?
  return ${EXIT_CODE}
}

doAIAProcessesLog > /opt/aia/logs/AIAProcessesLog.${DATE}
if [ $? -ne 0 ]; then
  echo -e "\n Function doAIAProcessesLog failed. \n"
  exit 1
fi
