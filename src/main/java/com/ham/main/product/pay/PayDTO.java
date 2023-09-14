package com.ham.main.product.pay;

import java.lang.reflect.Member;
import java.sql.Date;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.book.BookDTO;

import lombok.Data;

public class PayDTO {
	
	private String payNum;
	private Long bookNum;
	private Date payDate;
	private Long payAmount;
	
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public Long getBookNum() {
		return bookNum;
	}
	public void setBookNum(Long bookNum) {
		this.bookNum = bookNum;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Long getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(Long payAmount) {
		this.payAmount = payAmount;
	}
	
    
	
}
