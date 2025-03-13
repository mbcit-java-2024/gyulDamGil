package com.gdg.gyulDamGil.vo;

import java.util.Date;

import lombok.Data;


@Data
public class ReviewVO {

	private int id;
	private int consumerId;
	private int sellerId;
	private int productId;
	private float rate;
	private String comment;
	private Date createDate;
	private Date updateDate;
	
}

