package com.ham.main.product.pay.refund;

import java.sql.Date;

public class RefundDTO {

	private Long refundNum;
	private Long payNum;
	private Long refundAmount;
	private Date refundDate;
	private String refundReason;
	
	
	
	public String getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}
	public Long getRefundNum() {
		return refundNum;
	}
	public void setRefundNum(Long refundNum) {
		this.refundNum = refundNum;
	}
	public Long getPayNum() {
		return payNum;
	}
	public void setPayNum(Long payNum) {
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
	
	
	
}
