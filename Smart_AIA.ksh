#!/bin/ksh
untarfolder=$(cd $(dirname "$0") ; pwd)
echo "$untarfolder"
#LOG4SH_CONFIGURATION=$untarfolder/data/log4sh.properties
#export LOG4SH_CONFIGURATION


cd ${untarfolder}
. ${untarfolder}/aia.env
#source AIA environment 
. ${AIA_INSTANCE}/bin/aiaenv.sh 

echo -e "\n -------  Running the Smart AIA logic now -----\n"

#dir_path=`pwd`
$SOA_HOME/common/bin/wlst.sh wlstextract.py $1 $2 $3 $4 > /tmp/op.txt
if [ $? -ne 0 ]; then
      echo -e "\n Failed to execute wlstextract.py. \n"
      exit 1
    fi
untarfolder=$(cd $(dirname "$0") ; pwd)
./list_parse.py ${untarfolder}/data
if [ $? -ne 0 ]; then
      echo -e "\n Failed to execute list_parse.py. \n"
      exit 1
    fi

l1=`head -1 /tmp/tmp.out`
l2=`head -2 /tmp/tmp.out | tail -1`
string="compile_project_lists=$l1"
string2="package_revision=$l2"
echo " appending values"
l3=`cat ${untarfolder}/data/build.properties | grep "compile_project_lists=" | cut -d'=' -f1`
sed -i "s/$l3=/$string/g" ${untarfolder}/data/build.properties
l4=`cat ${untarfolder}/data/build.properties | grep "package_revision=" | cut -d'=' -f1`
sed -i "s/$l4=/$string2/g" ${untarfolder}/data/build.properties

