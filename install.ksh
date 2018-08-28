#!/bin/ksh
untarfolder=$(pwd)
echo "$untarfolder"
cd ${untarfolder}
. ${untarfolder}/aia.env

echo -e "\n -------  Running the aia.env script -----\n"
echo -e "\n ------- Running the AIA Deployment Script ------- \n"
echo "${AIA_HOSTNAME} ${AIA_PORTNO} ${BP_TARGET_WEBLOGIC_UN} ${BP_TARGET_WEBLOGIC_PW}"
${untarfolder}/SmartAIA.py  ${untarfolder}
if [ $? -ne 0 ]; then
      echo -e "\n Failed to execute SmartAIA.py \n"
      rm ${untarfolder}/aia.env
      exit 1
fi

${untarfolder}/AIA_Auto_Deployment_UpdateMetadata.ksh
if [ $? -ne 0 ]; then
      echo -e "\n Failed to execute AIA_Auto_Deployment_UpdateMetadata.ksh \n"
      rm ${untarfolder}/aia.env
      exit 1
fi

${untarfolder}/AIA_Auto_Deployment_SOACompApps.ksh
if [ $? -ne 0 ]; then
      echo -e "\n Failed to execute AIA_Auto_Deployment_SOACompApps.ksh \n"
      rm ${untarfolder}/aia.env
      exit 1
fi

cd /opt/aia/logs
if [ -f "err.txt" ]
then
	rm err.txt
fi
file=`ls -t AIAProcessesLog* | head -1`
echo $file
grep -n  "INFO: Received HTTP response from the server, response code=500" $file | while read line;
do
        lineno=$(echo $line | cut -d':' -f1)
        lineno=$(($lineno -2))
        echo $lineno
        sed -n ${lineno}p  $file | cut -d'/' -f9>> err.txt
done

if [ -f "err.txt" ]
then
	cp $untarfolder/data/hash_file.csv $untarfolder/data/hash_file_tmp.csv
	cat err.txt | while read line;
	do
          sed -i "/$line/d" $untarfolder/data/hash_file_tmp.csv
          sed -n "/$line/p" /opt/aia/deployment/hashdir/hash_file.csv >> $untarfolder/data/hash_file_tmp.csv
	done
	cp $untarfolder/data/hash_file_tmp.csv /opt/aia/deployment/hashdir/hash_file.csv
	echo "Deployment for the following composites was not completed due to --code=500-- error: $(<err.txt)"  >> $file
	echo "Composite build failed." >> $file
	rm ${untarfolder}/aia.env 
	exit 1
else
	cp ${untarfolder}/data/hash_file.csv /opt/aia/deployment/hashdir
	if [ $? -ne 0 ]; then
          echo -e "\n Failed to copy  hash_file.csv to the path /opt/aia/deployment/hashdir. \n"
          rm ${untarfolder}/aia.env
          exit 1
	fi
fi
cd ${untarfolder}
