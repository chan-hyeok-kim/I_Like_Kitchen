package com.ham.main.review;

import java.sql.Date;

public class ReviewDTO{

	private Long reviewNum;
	private Long productNum;
	private String id;
	private String reviewContents;
	private Date reviewDate;
	private Long reviewRate;

	
	public Long getReviewRate() {
		return reviewRate;
	}
	public void setReviewRate(Long reviewRate) {
		this.reviewRate = reviewRate;
	}
		public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
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
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	
}
