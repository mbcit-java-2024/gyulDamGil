package com.gdg.gyulDamGil.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ConsumerVO {
	
	private int id;
	private String userId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String detailAddress;
	private Date createDate;
	private Date updateDate;

}
