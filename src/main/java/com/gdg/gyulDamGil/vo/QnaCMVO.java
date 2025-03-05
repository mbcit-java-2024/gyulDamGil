package com.gdg.gyulDamGil.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class QnaCMVO {
    private int id;
    private int consumerId;
    private String title;
    private String comment;
    private Timestamp createDate;
    private List<QnaCMRepliesVO> replies;

}
