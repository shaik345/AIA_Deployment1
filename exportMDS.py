import sys

wlUser=sys.argv[1]
wlPass=sys.argv[2]
wlUrl=sys.argv[3]
wlSrvr=sys.argv[4]
mdsPth=sys.argv[5]

#wlUrl="t3://" + wlHost + ":" + wlPort
connect(wlUser,wlPass,wlUrl)
exportMetadata(application='soa-infra',server=wlSrvr,toLocation=mdsPth,docs='/apps/**')
disconnect()
exit()
