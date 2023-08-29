package com.ham.main.partner;

import java.sql.Date;

import lombok.Data;

@Data
public class PartnerDTO {

	private Long partnerNum;
	private String id;
	private String partnerEmail;
	private String partnerAddress;
	private Long partnerAccount;
	private Date partnerDate;
	private String partnerName;
	
}
