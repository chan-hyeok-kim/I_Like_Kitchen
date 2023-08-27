package com.ham.main.util.auth;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	private OAuth20Service oauthService;
	
    public SNSLogin(SnsValue sns) {
    	this.oauthService = new ServiceBuilder(sns.getClientId())
    	       .apiSecret(sns.getCleintSecret())
    	       .callback(sns.getRedirectURL())
    	       .defaultScope("profile")
    	       .build(sns.getApi20Instance()); 
    }
    
    public String getNaverAuthURL() {
    	return this.oauthService.getAuthorizationUrl();
    }
}
