package com.ham.main.product.pay;

import java.lang.reflect.Member;
import java.sql.Date;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.book.BookDTO;

import lombok.Data;

@Data
public class PayDTO {
	
	private Long payNum;
	private Long orderNum;
	private Long productNum;
	private String id;
	private Date payDate;
	private Long payAmount;
	private Integer payState;
    private String sid;
    
	private BookDTO bookDTO;
	private MemberDTO memberDTO;

	
	
	
	
	
}
