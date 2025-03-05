package com.gdg.gyulDamGil.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class QnaSMVO {
    private int id;
    private int sellerId;
    private String title;
    private String comment;
    private Timestamp createDate;
    private List<QnaCMRepliesVO> replies;

}
