package com.gdg.gyulDamGil.vo;

import lombok.Data;

@Data
public class CartVO {
	private int id;
	private int consumerId;
	private int productId;
	private int price;
	private int count;
	private int totalPrice;
	private String title;
	private int stock;
	private String mainImageUrl;
}
