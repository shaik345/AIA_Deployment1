#!/bin/ksh
. ${1}/aia.env
dest_ip=$BP_TARGET_AIA_HOSTNAME:$BP_TARGET_AIA_PORTNO
echo "$dest_ip"
cd ${1}/data/SOACompApps
for d in * ; do
echo " $d "
if [ -f $d/composite.xml ]; then
source=($(cat $d/composite.xml | grep -E "http://t" | awk -F  "http://t" '{print $2}' | cut -d'/' -f1)) 
for i in ${!source[*]}
do
source_ip=t${source[${i}]}
echo "$source_ip"
sed -i "s/$source_ip/$dest_ip/g" $d/composite.xml
if [ $? -eq 0 ]; then
echo "replaced $source_ip with $dest_ip"
else
echo "sed command failed"
fi
done
fi
done
sed -e "s|PriceListToken1|${PriceListToken1}|g" -e "s|PriceListToken2|${PriceListToken2}|g" -e "s|PriceListToken3|${PriceListToken3}|g" $1/data/AIAMetaData/dvm/PRICELIST.dvm > $1/data/AIAMetaData/dvm/PRICELIST.dvm_final
   EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi
mv $1/data/AIAMetaData/dvm/PRICELIST.dvm_final $1/data/AIAMetaData/dvm/PRICELIST.dvm

sed -e "s|Email_Id|${Email_Id}|g" -e "s|MobileNumber|${MobileNumber}|g" $1/data/AIAMetaData/dvm/EmailSMSInformation.dvm > $1/data/AIAMetaData/dvm/EmailSMSInformation.dvm_final

    EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
      echo -e "\n Command sed failed. \n"
      exit ${EXIT_CODE}
    fi
mv $1/data/AIAMetaData/dvm/EmailSMSInformation.dvm_final $1/data/AIAMetaData/dvm/EmailSMSInformation.dvm

cd ${1}
