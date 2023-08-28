package com.ham.main.partner;

import java.sql.Date;
import java.util.List;

import com.ham.main.member.RoleDTO;

public class PartnerDTO {
	
	private Long partnerNum;
	private String id;
	private String partnerEmail;
	private String partnerEmailDomain;
	private Long partnerAccount;
	private Date partnerDate;
	private String partnerName;
	private String companyName;
	private String partnerPhone;
	
	public Long getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(Long partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPartnerEmail() {
		return partnerEmail;
	}
	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}
	public String getPartnerEmailDomain() {
		return partnerEmailDomain;
	}
	public void setPartnerEmailDomain(String partnerEmailDomain) {
		this.partnerEmailDomain = partnerEmailDomain;
	}
	public Long getPartnerAccount() {
		return partnerAccount;
	}
	public void setPartnerAccount(Long partnerAccount) {
		this.partnerAccount = partnerAccount;
	}
	public Date getPartnerDate() {
		return partnerDate;
	}
	public void setPartnerDate(Date partnerDate) {
		this.partnerDate = partnerDate;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPartnerPhone() {
		return partnerPhone;
	}
	public void setPartnerPhone(String partnerPhone) {
		this.partnerPhone = partnerPhone;
	}
	
}
