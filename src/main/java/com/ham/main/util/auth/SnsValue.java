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
	
	public SnsValue(String service, String naverClientID, String naverClientSecret, String naverRedirectUrl) {
	    	this.service = service;
	    	this.clientId = naverClientID;
	    	this.cleintSecret = naverClientSecret;
	    	this.redirectURL = naverRedirectUrl;
	    	if(StringUtils.equalsIgnoreCase(service,"naver")) {
	    	   this.api20Instance = NaverAPI20.instance();	
	    	}
	    	
	}
	    
	
	
	
}
