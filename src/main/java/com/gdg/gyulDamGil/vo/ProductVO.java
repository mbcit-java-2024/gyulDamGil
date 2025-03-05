package com.gdg.gyulDamGil.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private int id;
	private int sellerId;
	private int categoryId;
	private String title;
	private int price;
	private String description;
	private int stock;
	private String mainImageUrl;
	private String detailImageUrl;
	private Date createDate;
	private Date updateDate;
	private String farmName;
	private int status;
	private int bookMarkCnt;
	
}
