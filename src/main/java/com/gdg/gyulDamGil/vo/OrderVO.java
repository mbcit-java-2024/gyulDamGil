package com.gdg.gyulDamGil.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
    private int id;
    private int consumerId;
    private int sellerId;
    private int productId;
    private int count;
    private Date orderDate;
    private int totalPrice;
    private int price;
    private int status;
    
    private String title;

    
}
