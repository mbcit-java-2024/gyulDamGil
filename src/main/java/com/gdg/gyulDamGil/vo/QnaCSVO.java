package com.gdg.gyulDamGil.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class QnaCSVO {
    private int id;
    private int sellerId;
    private int consumerId;
    private String title;
    private String comment;
    private Date createDate;
    private List<QnaCSRepliesVO> replies;
    
    private String farmName;
    private String consumerName;
    
}
