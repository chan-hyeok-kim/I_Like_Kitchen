package com.ham.main.member;

import java.util.List;

import lombok.ToString;


@ToString
public class SnsMemberDTO {
	

	private String platForm;
	private String snsName;
	private String snsEmail;
	
	
	public String getPlatForm() {
		return platForm;
	}
	public void setPlatForm(String platForm) {
		this.platForm = platForm;
	}
	public String getSnsName() {
		return snsName;
	}
	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}
	public String getSnsEmail() {
		return snsEmail;
	}
	public void setSnsEmail(String snsEmail) {
		this.snsEmail = snsEmail;
	}

	
}
