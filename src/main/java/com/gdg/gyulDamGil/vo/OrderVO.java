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
    
//  주문 목록 페이지에서 sellerId 대신 farmName, productTitle, mainImageUrl을 표기 하고싶어서
//  테이블 컬럼 추가없이 VO에만 따로 저장할 수 있게 만들었습니다.
    private String farmName;
    private String productTitle;
    private String mainImageUrl;
}
