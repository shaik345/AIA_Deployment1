package com.soa.pgp.structure;

/**
 * FileType data structure holder class
 */
public class FileType {
    private String csf_key_name;
    private String csf_map_name;
    private String file_type;
    private String private_key;
    
    // default constructor
    FileType() {        
    }


    public void setCsf_key_name(String csf_key_name) {
        this.csf_key_name = csf_key_name;
    }

    public String getCsf_key_name() {
        return csf_key_name;
    }

    public void setCsf_map_name(String csf_map_name) {
        this.csf_map_name = csf_map_name;
    }

    public String getCsf_map_name() {
        return csf_map_name;
    }

    public void setFile_type(String file_type) {
        this.file_type = file_type;
    }

    public String getFile_type() {
        return file_type;
    }

    public void setPrivate_key(String private_key) {
        this.private_key = private_key;
    }

    public String getPrivate_key() {
        return private_key;
    }
}
