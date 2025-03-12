package com.gdg.gyulDamGil.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class QnaCSRepliesVO {
    private int id;
    private int parentId; 
    private int sellerId;
    private int consumerId; 
    private String comment; 
    private Date createDate;  
}