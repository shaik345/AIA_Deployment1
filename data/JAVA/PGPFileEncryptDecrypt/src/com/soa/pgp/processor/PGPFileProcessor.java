package com.soa.pgp.processor;


import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.bouncycastle.openpgp.PGPPublicKey;
import org.bouncycastle.openpgp.PGPSecretKey;

/**
 * This is a wrapper class for implementing encryption / decryption using open PGP standards
 */
public class PGPFileProcessor {

    private String passphrase;
    private String publicKeyFileName;
    private String secretKeyFileName;    
    private boolean asciiArmored = false;
    private boolean integrityCheck = true;
    private byte[] buffer;

    /**
     * encrypts the input bytestream
     * @return
     * @throws Exception
     */
    public byte[] encrypt() throws Exception {
        FileInputStream keyIn = new FileInputStream(publicKeyFileName);       
        byte[] bytes = PGPUtils.encryptFile(null, PGPUtils.readPublicKey(keyIn), asciiArmored, integrityCheck, buffer);       
        keyIn.close();
        return bytes;
    }


    /**
     * decrypts the input bytestream
     * @return
     * @throws Exception
     */
    public byte[] decrypt() throws Exception {
        
        FileInputStream keyIn = new FileInputStream(secretKeyFileName);        
        byte[] bytes = PGPUtils.decryptFile(buffer, keyIn, passphrase.toCharArray());        
        keyIn.close();
        return bytes;
    }
 
    /**
     * get asciiArmored flag
     * @return boolean
     */
    public boolean isAsciiArmored() {
            return asciiArmored;
    }

    /**
     * set asciiArmored flag
     * @param asciiArmored
     */
    public void setAsciiArmored(boolean asciiArmored) {
            this.asciiArmored = asciiArmored;
    }

    /**
     * get integrityCheck flag
     * @return
     */
    public boolean isIntegrityCheck() {
            return integrityCheck;
    }

    /**
     * set integrityCheck flag
     * @param integrityCheck
     */
    public void setIntegrityCheck(boolean integrityCheck) {
            this.integrityCheck = integrityCheck;
    }


    /**
     * get private key password
     * @return
     */
    public String getPassphrase() {
            return passphrase;
    }

    /**
     * set private key password
     * @param passphrase
     */
    public void setPassphrase(String passphrase) {
            this.passphrase = passphrase;
    }

    /**
     * get public key filename
     * @return
     */
    public String getPublicKeyFileName() {
            return publicKeyFileName;
    }

    /**
     * set public key filename
     * @param publicKeyFileName
     */
    public void setPublicKeyFileName(String publicKeyFileName) {
            this.publicKeyFileName = publicKeyFileName;
    }

    /**
     * get private key filename
     * @return
     */
    public String getSecretKeyFileName() {
            return secretKeyFileName;
    }

    /**
     * set private key filename
     * @param secretKeyFileName
     */
    public void setSecretKeyFileName(String secretKeyFileName) {
            this.secretKeyFileName = secretKeyFileName;
    }


    /**
     * set input bytestream
     * @param buffer
     */
    public void setInputByteStream(byte [] buffer) {
            this.buffer = buffer;
    }
}
