#!/usr/bin/python

import sys
host=sys.argv[1]
port=sys.argv[2]
webusername=sys.argv[3]
webpassword=sys.argv[4]

sca_listDeployedComposites(host,port,webusername,webpassword)
