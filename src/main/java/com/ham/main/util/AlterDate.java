package com.ham.main.util;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AlterDate {

	public int useTime(Date startDate, Date endDate) {
		String startDateStr = startDate.toString();
		String endDateStr = endDate.toString();
		
		startDateStr = startDateStr.substring(12, 14);
		endDateStr = endDateStr.substring(12, 14);
	    int startDateInt =	Integer.parseInt(startDateStr);
		int endDateInt = Integer.parseInt(endDateStr);
		
		int result = endDateInt-startDateInt;
		return result;
	}
	
	
	
}
