"""
@author 

This script will first try to connect to a running server using the 
values in the properties file. The server is required to be running 
It will then create the following users automation, oms and add them to all the groups."""

from weblogic.management.security.authentication import UserEditorMBean
from weblogic.management.security.authentication import UserReaderMBean
from weblogic.management.security.authentication import GroupReaderMBean
from weblogic.descriptor import BeanAlreadyExistsException
from weblogic.management.utils import AlreadyExistsException
from java.lang.reflect import UndeclaredThrowableException
from java.lang import System
import javax
from javax import management
from javax.management import MBeanException
from javax.management import RuntimeMBeanException
import javax.management.MBeanException
from java.lang import UnsupportedOperationException

def validConnect():
    try:
        loadProperties("build.properties")
        connect(deploy_user,deploy_password,deploy_adminURL)
    except WLSTException:
        print 'Error: server is not running'
        stopExecution('You need to be connected.')


def deployBRMAdapter():
    try:
		print brm_rar_location
		vasApps=cmo.getAppDeployments()
		AppState='NotExists'
		for app in vasApps:
			if(app.getName()=='OracleBRMJCA15Adapter'):
				AppState='Exists'
		print AppState
		if(AppState=='NotExists'):
			deploy(appName='OracleBRMJCA15Adapter',path=brm_rar_location+'/OracleBRMJCA15Adapter.rar',targets=Target_SOA_ManagedServername,planPath=brm_rar_location+'/Plan.xml');		
		else:
			redeploy('OracleBRMJCA15Adapter'); 
    except WLSTException:
       	print 'an error occured, undoing all the changes'
       	undo(defaultAnswer='y', unactivatedChanges='true')
       	stopExecution('You need to be connected.')

try:
 hideDumpStack("true")
 validConnect()
 edit()
 startEdit()
 deployBRMAdapter()
 save()
 activate(block="true")
 print 'Done executing the script.'
finally:
 if connected=="true":
  print 'Disconnect from Admin server.'

