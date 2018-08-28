#!/usr/bin/python

import sys
import shutil
import os
import re

set_wlst = set()
set_package = set()
set_diff = set()
list1= []
path= sys.argv[1]

def wlstfile_parse():
 file1='/tmp/op.txt'
 print file1
 ins=open(file1)
 for line in ins:
    if 'isDefault=true' in line and 'partition=default' in line:
      m=line.split(' ')
      comp_name=m[1].rsplit('[', 1)[0]
      version=m[1][ m[1].find("[")+1 : m[1].find("]") ]
      my_tuple1= tuple([comp_name] + [version])
      set_wlst.add(my_tuple1)

def customDP_parse():
 file2=path+'/O2CCustomDP.xml'
 print file2
 ins=open(file2)
 for line in ins:
   if 'compositeName' in line:
      m=line.strip().split(' ')
      comp_name= re.findall(r'"([^"]*)"', m[1]) 
      version=  re.findall(r'"([^"]*)"', m[3])
      my_tuple2= tuple([comp_name[0]] + [version[0]])
      set_package.add(my_tuple2)
     

def compositesToDeploy():
  set_diff= set_package -  set_wlst
  print set_diff 
  list1 = list(set_diff)  
  print list1
  composite_list = [ seq[0] for seq in list1 ]
  package_revision = [ seq[1] for seq in list1 ] 
  composite_list = ','.join(composite_list)
  print composite_list
  package_revision  = ','.join(package_revision) 
  print package_revision
  file3='/tmp/tmp.out'
  print file3
  bp=open(file3, 'w')
  bp.write(composite_list+'\n')
  bp.write(package_revision)
  bp.close() 
 

def main ():
  wlstfile_parse()
  customDP_parse()
  compositesToDeploy()
 
   
main()
