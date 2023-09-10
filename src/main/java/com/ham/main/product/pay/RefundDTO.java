package com.ham.main.product.pay;

import java.sql.Date;

import lombok.Data;

@Data
public class RefundDTO {

	private Long refundNum;
	private String payNum;
	private Long refundAmount;
	private Date refundDate;
	private String refundReason;
	private String refundCheck;
	
	
	
	
	
}
