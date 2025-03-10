package com.gdg.gyulDamGil.vo;

import lombok.Data;
@Data
public class BookmarkVO {
	private int id;
	private int sellerId;
	private int productId;
	private int consumerId;
	private String userId;
	private String title;
	private int price;
	private String description;
	private int stock;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String detailAddress;
	private String createDate;
	private String farmName;
	private int reviewCount;
	private int bussinessNumber;
	private String mainImageUrl;
}
