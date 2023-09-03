package com.ham.main.util.auth;


import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

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
	

    
	public SnsValue(String service, String snsClientID, String snsClientSecret, String snsRedirectUrl, String snsState) {
	    	this.service = service;
	    	this.clientId = snsClientID;
	    	this.cleintSecret = snsClientSecret;
	    	this.redirectURL = snsRedirectUrl;
	    	this.state = snsState;
	    	this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);

	    	if(isNaver) {
	    	   this.api20Instance = NaverAPI20.instance();	
	    	   this.profileUrl = NAVER_PROFILE_URL;

	    	}
	    	
	}
	
	
	

	    
	
	
	
}
