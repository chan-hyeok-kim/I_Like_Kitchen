package com.ham.main.product.pay;

import java.sql.Date;

import lombok.Data;

public class RefundDTO {

	private Long refundNum;
	private String payNum;
	private Long refundAmount;
	private Date refundDate;
	private String refundReason;
	private String refundCheck;
	
	public Long getRefundNum() {
		return refundNum;
	}
	public void setRefundNum(Long refundNum) {
		this.refundNum = refundNum;
	}
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public Long getRefundAmount() {
		return refundAmount;
	}
	public void setRefundAmount(Long refundAmount) {
		this.refundAmount = refundAmount;
	}
	public Date getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	public String getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}
	public String getRefundCheck() {
		return refundCheck;
	}
	public void setRefundCheck(String refundCheck) {
		this.refundCheck = refundCheck;
	}
	
	
	
	
	
}
