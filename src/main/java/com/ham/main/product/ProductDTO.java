package com.ham.main.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductDTO {

	private Long productNum;
	private Long partnerNum;
	private Date regDate;
	private String address;
	private String tel;
	private Long price;
	private String contents;
	private String productName;
}
