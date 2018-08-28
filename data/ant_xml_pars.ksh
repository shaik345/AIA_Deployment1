#!/bin/bash

Component_arg=$1
Build_file='build.properties'

components=`grep 'compile_project_lists' build.properties | awk -F  "=" '{print $2}'`
IFS=',' read -r -a array_cmp <<< "$components"

versions=`grep 'package_revision' build.properties | awk -F  "=" '{print $2}'`
IFS=',' read -r -a array_ver <<< "$versions"

COUNTER=0
for cmp in "${array_cmp[@]}"
do
  cmp="$(echo -e "${cmp}" | sed -e 's/[[:space:]]*$//')"
  if [ "$cmp" == "$Component_arg" ]; then
    Vers=${array_ver[$COUNTER]}
  fi
  COUNTER=$[$COUNTER +1]
done

echo $Vers
