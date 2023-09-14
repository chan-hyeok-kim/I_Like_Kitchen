package com.ham.main.product.book;

import java.sql.Date;

public class BookDTO {
	
	private Long bookNum;
	private Long productNum;
	private String id;
	private String contents;
	private Integer headCount;
	private String purpose;
	private Date bookDate;
	private java.util.Date startTime;
	private java.util.Date endTime;
	private String bookCheck;
	
	public Long getBookNum() {
		return bookNum;
	}
	public void setBookNum(Long bookNum) {
		this.bookNum = bookNum;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getHeadCount() {
		return headCount;
	}
	public void setHeadCount(Integer headCount) {
		this.headCount = headCount;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	public java.util.Date getStartTime() {
		return startTime;
	}
	public void setStartTime(java.util.Date startTime) {
		this.startTime = startTime;
	}
	public java.util.Date getEndTime() {
		return endTime;
	}
	public void setEndTime(java.util.Date endTime) {
		this.endTime = endTime;
	}
	public String getBookCheck() {
		return bookCheck;
	}
	public void setBookCheck(String bookCheck) {
		this.bookCheck = bookCheck;
	}
	
	

}
