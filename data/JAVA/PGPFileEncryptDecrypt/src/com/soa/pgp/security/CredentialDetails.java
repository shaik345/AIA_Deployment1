package com.soa.pgp.security;


import com.soa.pgp.custom.valve.PgpDecryptValve;

import java.security.AccessController;
import java.security.PrivilegedAction;

import java.security.PrivilegedActionException;

import oracle.security.jps.JpsContext;
import oracle.security.jps.JpsContextFactory;
import oracle.security.jps.JpsException;
import oracle.security.jps.service.JpsServiceLocator;
import oracle.security.jps.service.credstore.Credential;
import oracle.security.jps.service.credstore.CredentialAlreadyExistsException;
import oracle.security.jps.service.credstore.CredentialFactory;
import oracle.security.jps.service.credstore.CredentialStore;
import oracle.security.jps.service.credstore.PasswordCredential;


/**
 * The class implements methods for retrieving password from CSF framework
 */
public class CredentialDetails {
    
    // this is the log handler class
    final static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CredentialDetails.class);

    /**
     * Class default constructor - no params
     */
    public CredentialDetails() {
        super();
    }

   /* public static void main(String[] args) throws Exception {
        CredentialDetails cd = new CredentialDetails();
        String pwd = cd.getPassphraseFromCSFKey("SOA","manufacturer-gemalto");
        System.out.println("CSF key details retrieved successfully :"+pwd);
    }
    */
    /**
     * fetches password from CSF for a given MAP & KEY
     * @param map
     * @param key
     * @return String
     * @throws Exception
     */
    public String getPassphraseFromCSFKey(String map, String key) throws Exception{
        String password = "";
        PasswordCredential pc = null;
        
        try{   
            
            JpsContextFactory jpsCtxFactory = JpsContextFactory.getContextFactory();  
            JpsContext jpsCtx = jpsCtxFactory.getContext();
            
            CredentialStore store = jpsCtx.getServiceInstance(CredentialStore.class);
            
            pc = (PasswordCredential)store.getCredential(map, key);
            
            password = new String(pc.getPassword());
            
            //System.out.println("the csf password retrieved is :"+ password);
            
        }catch (JpsException ej) {
            logger.error("Error reading credentials from store. Please check the error logs for more details.\n", ej);
            ej.printStackTrace();
        }catch(Exception e){
                logger.error("Generic Error reading credentials from store. Please check the error logs for more details.\n", e);
                e.printStackTrace();
            }        
        
        return password;
    }
}
