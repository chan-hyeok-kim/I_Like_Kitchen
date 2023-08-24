package com.ham.main.product.pay;

import java.lang.reflect.Member;
import java.sql.Date;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.book.BookDTO;

public class PayDTO {
	
	private Long payNum;
	private Long orderNum;
	private Long productNum;
	private String id;
	private Date payDate;
	private Long payAmount;
	private Integer payState;
	private BookDTO bookDTO;
	private MemberDTO memberDTO;
	 
	
	
	public BookDTO getBookDTO() {
		return bookDTO;
	}
	public void setBookDTO(BookDTO bookDTO) {
		this.bookDTO = bookDTO;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public Long getPayNum() {
		return payNum;
	}
	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
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
	public Integer getPayState() {
		return payState;
	}
	public void setPayState(Integer payState) {
		this.payState = payState;
	}

	
	
}
