#!/bin/ksh

# Framework initialization
IKIT_HOME=/opt/application/imp/current/bin/lib
. ${IKIT_HOME}/COM/init.ksh

UNTAR=$(cd $(dirname "$0") ; pwd)

#DATE=$(date +"%Y%m%d")
DATE=$(date +"%Y%m%d_%s")

echo $BRM_SRVRNAME ........................ Print.....
rm -rf BRMJAR
#COM_directory BRMJAR delete

mkdir BRMJAR
#COM_directory BRMJAR create

cp $BRMRAR_NAME BRMJAR/
#COM_file $BRMRAR_NAME copyTo BRMJAR/

cd BRMJAR
#COM_directory BRMJAR goInto
echo  --- RAR file will be taken from SVN location. Temp location to test this script Currently is BRMJAR/test folder ---

echo  --- Untar the RAR file to current location ---
jar -xvf $BRMRAR_NAME
EXIT_CODE=$?
if [ ${EXIT_CODE} -ne 0 ]; then
  echo -e "\n Command jar xvf failed. Error code : ${EXIT_CODE} \n"
  exit ${EXIT_CODE}
fi

echo  --- Untar the RAR file to current location ---
rm -rf $BRMRAR_NAME
#COM_file $BRMRAR_NAME delete

cd META-INF
#COM_directory META-INF goInto


sed "s/BRMlocalhost/${BRM_SRVRNAME}/g" ra.xml > ra_temp.xml
EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi
#rm -rf ra.xml
#COM_directory ra.xml delete

mv ra_temp.xml ra.xml
#COM_file ra_temp.xml renameTo ra.xml


sed "s/BRMCMPORT/${BRM_SERVERCMPORT}/g" ra.xml > ra_temp.xml
EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi
#rm -rf ra.xml
#COM_directory ra.xml delete

mv ra_temp.xml ra.xml
#COM_file ra_temp.xml renameTo ra.xml

echo  --- Updated ra.xml file ---

sed "s/BRMlocalhost/${BRM_SRVRNAME}/g" weblogic-ra.xml > weblogic-ra_temp.xml
EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi
rm -rf weblogic-ra.xml
#COM_directory weblogic-ra.xml delete

mv weblogic-ra_temp.xml weblogic-ra.xml
#COM_file weblogic-ra_temp.xml renameTo weblogic-ra.xml

sed "s/BRMCMPORT/${BRM_SERVERCMPORT}/g" weblogic-ra.xml > weblogic-ra_temp.xml
EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi
#rm -rf weblogic-ra.xml
#COM_directory weblogic-ra.xml delete

mv weblogic-ra_temp.xml weblogic-ra.xml
#COM_file weblogic-ra_temp.xml renameTo weblogic-ra.xml

echo  --- Updated weblogic-ra.xml file ---

cd ..
#COM_directory ./.. goInto


echo  --- RAR the file in current location ---
jar -cvf $BRMRAR_NAME *
EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command jar cvf failed. \n"
      exit ${EXIT_CODE}
    fi

cp $BRMRAR_NAME ../
#COM_file $BRMRAR_NAME copy ../.

cd ..
#COM_directory BRMJAR/.. goInto

echo  --- Take a backup of existing RAR file ---
cd $BRMJAR_DESTN_LOCN
#COM_directory $BRMJAR_DESTN_LOCN goInto

cp $BRMRAR_NAME $BRMRAR_NAME\_${DATE}
#COM_file $BRMRAR_NAME copy $BRMRAR_NAME\_${DATE}

rm -rf $BRMRAR_NAME
#COM_file $BRMRAR_NAME delete
cd -
#COM_directory ${UNTAR} goInto

echo  --- Copying the updated RAR file to required location ---
cp $BRMRAR_NAME $BRMJAR_DESTN_LOCN
#COM_file $BRMRAR_NAME copy $BRMJAR_DESTN_LOCN

java weblogic.PlanGenerator $BRMJAR_DESTN_LOCN/$BRMRAR_NAME -plan $BRMJAR_DESTN_LOCN/Plan.xml
EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n java weblogic.PlanGenerator failed. \n"
      exit ${EXIT_CODE}
    fi

cd ..
#COM_directory $BRMJAR_DESTN_LOCN/.. goInto

echo  --- Task Completed --- 
