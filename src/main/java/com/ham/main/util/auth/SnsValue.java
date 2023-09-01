package com.ham.main.util.auth;


import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

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
	private boolean isKakao;
	
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
	    	}else if(isKakao){
	    	   this.api20Instance = KakaoAPI20.instance();
	    	   this.profileUrl = KAKAO_PROFILE_URL;
	    	}
	    	
	}
	
	
	

	    
	
	
	
}
