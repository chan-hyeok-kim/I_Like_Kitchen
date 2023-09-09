package com.ham.main.product.pay;

import java.lang.reflect.Member;
import java.sql.Date;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.book.BookDTO;

import lombok.Data;

@Data
public class PayDTO {
	
	private String payNum;
	private Long bookNum;
	private Date payDate;
	private Long payAmount;
    
	
}
