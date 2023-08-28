package com.ham.main.util.auth;


import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SnsValue implements SnsUrls {
	private String service;
	private String clientId;
	private String cleintSecret;
	private String redirectURL;
	private DefaultApi20 api20Instance; 
	private String profileUrl;
	private String state;
	private boolean isNaver;
	private String verifyUrl;
	
	public SnsValue(String service, String naverClientID, String naverClientSecret, String naverRedirectUrl, String naverState) {
	    	this.service = service;
	    	this.clientId = naverClientID;
	    	this.cleintSecret = naverClientSecret;
	    	this.redirectURL = naverRedirectUrl;
	    	this.state = naverState;
	    	this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
	    	
	    	if(isNaver) {
	    	   this.api20Instance = NaverAPI20.instance();	
	    	   this.profileUrl = NAVER_PROFILE_URL;
	    	   this.verifyUrl = NAVER_VERIFY_URL;
	    	}
	    	
	}
	    
	
	
	
}
