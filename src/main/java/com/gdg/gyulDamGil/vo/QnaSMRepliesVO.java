package com.gdg.gyulDamGil.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaSMRepliesVO {
    private int id;
    private int parentId; 
    private int sellerId; 
    private String comment; 
    private Timestamp createDate;  
}