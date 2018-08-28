#!/usr/bin/python

import sys
import shutil
import os
import re
import csv
import string

set_deployed = set()
set_package = set()
set_toDeploy = set()
list1= []
path= sys.argv[1]

def deploy_all():
 print " hash_file.csv is not  present,hence all composites will be deployed"
 file2=path + '/data/O2CCustomDP.xml'
 ins=open(file2)
 for line in ins:
   if 'compositeName' in line:
      m=line.strip().split(' ')
      comp_name= re.findall(r'"([^"]*)"', m[1])
      if not comp_name:
        print "Please check O2CCustomDP for extraspace before or some other formating error near the element 'compositeName=' in the line ", line
      version=  re.findall(r'"([^"]*)"', m[3])
      if not version:
      	print "Please check O2CCustomDP for extraspace before or some other formating error near the element 'revision=' in the line", line
      my_tuple2= tuple([comp_name[0]] + [version[0]])
      list1.append(my_tuple2)
      with open(path +'/composites_to_deploy.csv','wb') as out:
          csv_out=csv.writer(out)
          for row in list1:
                csv_out.writerow(row)
 
def deploy_smart():
 print "hash_file.csv is  present, hence smart deployment will be performed"
 file3=path + '/data/hash_file.csv'
 file4='/opt/aia/deployment/hashdir/hash_file.csv'
 ins=open(file3)
 for line in ins:
  comp_pkg=line.split(",")[0]
  hash_pkg=line.split(",")[1].rstrip()
  my_tuple0= tuple([comp_pkg] + [hash_pkg])
  set_package.add(my_tuple0)
 ins=open(file4)
 for line in ins:
  comp_pkg=line.split(",")[0]
  hash_pkg=line.split(",")[1].rstrip()
  my_tuple1= tuple([comp_pkg] + [hash_pkg])
  set_deployed.add(my_tuple1)
 set_toDeploy= set_package - set_deployed
 list5= list(set_toDeploy)
 comps = [ seq[0] for seq in list5 ]
 file2=path + '/data/O2CCustomDP.xml'
 ins=open(file2)
 for line in ins:
  for l in comps:
   if 'compositeName="' + l + '"'  in line:
      m=line.strip().split(' ')
      comp_name= re.findall(r'"([^"]*)"', m[1])
      if not comp_name:
       print "Please check O2CCustomDP for extraspace before or some other formating error near the element 'compositeName=' in the line ", line
      version= re.findall(r'"([^"]*)"', m[3])
      if not version:
       print "Please check O2CCustomDP for extraspace before or some other formating error near the element 'revision=' in the line", line
      my_tuple2= tuple([comp_name[0]] + [version[0]])
      list1.append(my_tuple2)
      with open(path +'/composites_to_deploy.csv','wb') as out:
          csv_out=csv.writer(out)
          for row in list1:
                csv_out.writerow(row)

def compositesToDeploy():
 print "i will deploy composites" 
 file1=path + '/composites_to_deploy.csv'
 composite_list = ''
 revision_list = ''
 ins=open(file1)
 for line in ins:
  composite_list=line.split(",")[0] + ',' + composite_list
  revision_list=line.split(",")[1].rstrip() + ',' + revision_list
  composite_list = composite_list.rstrip(',')
  revision_list = revision_list.rstrip(',')
 filein=path + '/data/build.properties'
 print composite_list 
 print revision_list
 f = open(filein,'r')
 filedata = f.read()
 f.close()
 fileout=path + '/data/build.properties'
 newdata = filedata.replace("compile_project_lists=", "compile_project_lists=" + composite_list)
 newdata = newdata.replace("package_revision=", "package_revision=" +  revision_list)
 f = open(fileout,'w')
 f.write(newdata)
 f.close()

def main ():
 if not os.path.exists('/opt/aia/deployment/hashdir/hash_file.csv'):
	deploy_all()
 	if not os.path.exists('/opt/aia/deployment/hashdir'):
         os.makedirs('/opt/aia/deployment/hashdir')
 else:
	deploy_smart()
 if os.path.exists(path + '/composites_to_deploy.csv'):
  compositesToDeploy()
 else:
  print 'No composites to deploy'
 #shutil.copy(path + '/data/hash_file.csv', '/opt/aia/deployment/hashdir/hash_file.csv')   

main()
