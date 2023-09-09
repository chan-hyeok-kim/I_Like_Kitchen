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
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	

    
	public String getService() {
		return service;
	}



	public void setService(String service) {
		this.service = service;
	}



	public String getClientId() {
		return clientId;
	}



	public void setClientId(String clientId) {
		this.clientId = clientId;
	}



	public String getCleintSecret() {
		return cleintSecret;
	}



	public void setCleintSecret(String cleintSecret) {
		this.cleintSecret = cleintSecret;
	}



	public String getRedirectURL() {
		return redirectURL;
	}



	public void setRedirectURL(String redirectURL) {
		this.redirectURL = redirectURL;
	}



	public DefaultApi20 getApi20Instance() {
		return api20Instance;
	}



	public void setApi20Instance(DefaultApi20 api20Instance) {
		this.api20Instance = api20Instance;
	}



	public String getProfileUrl() {
		return profileUrl;
	}



	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public boolean isNaver() {
		return isNaver;
	}



	public void setNaver(boolean isNaver) {
		this.isNaver = isNaver;
	}



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
