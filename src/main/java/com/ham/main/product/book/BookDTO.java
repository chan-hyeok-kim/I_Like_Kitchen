package com.ham.main.product.book;

import java.sql.Date;

import java.time.LocalTime;

import lombok.Data;

@Data
public class BookDTO {
	
	private Long orderNum;
	private Long productNum;
	private String id;
	private Integer choice;
	private String contents;
	private Integer headCount;
	private String purpose;
	private Date bookDate;
	private Date startTime;
	private Date endTime;
	private String status;
	
	
	
	
	
	
	

}
