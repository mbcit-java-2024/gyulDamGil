package com.gdg.gyulDamGil.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaCMRepliesVO {
    private int id;
    private int parentId; 
    private int consumerId; 
    private String comment; 
    private Timestamp createDate;  
}