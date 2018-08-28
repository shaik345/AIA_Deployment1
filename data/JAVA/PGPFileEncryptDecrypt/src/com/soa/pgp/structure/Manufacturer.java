package com.soa.pgp.structure;

import java.util.HashMap;
import java.util.Map;

/**
 * Manufacturer data structure holder class
 */
public class Manufacturer {
    private String id;
    private String name;
    private Map fileTypeMap;     
    
    Manufacturer() {
        super();
        fileTypeMap = new HashMap();
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void addFileType(FileType fileType, String key) {
        this.fileTypeMap.put(key, fileType);
    }

    public Map getFileTypeMap() {
        return fileTypeMap;
    }
    
    public FileType getFileType(String szKey) {
        //System.out.println("key as received "+szKey);
        return (FileType)fileTypeMap.get(szKey);
    }
}
