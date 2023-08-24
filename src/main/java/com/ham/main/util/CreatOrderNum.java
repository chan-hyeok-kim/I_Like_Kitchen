package com.ham.main.util;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component
public class CreatOrderNum {

	public String getOrderNum(){
//      주문번호 생성		
		LocalDate nowDate = LocalDate.now();
		String nowDateStr = nowDate.toString();
		String orderNum = nowDateStr;
		
		for(int i=0; i<10; i++) {
			orderNum += (int)Math.floor(Math.random() * 10);	
		}
		
		return orderNum;
		
	}
}
