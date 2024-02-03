package com.ham.main.util.auth;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.hc.client5.http.auth.AuthExchange.State;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.ham.main.member.MemberDTO;

import com.ham.main.member.SnsMemberDTO;

import java.util.UUID;

import javax.servlet.http.HttpSession;


import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;


public class SNSLogin {
//	naver
	private OAuth20Service oauthService;
    private SnsValue sns;
   
//  kakao
   
    public SNSLogin() {
		// TODO Auto-generated constructor stub
	}
    
    public SNSLogin(SnsValue sns) {
    	this.oauthService = new ServiceBuilder(sns.getClientId())
    	       .apiSecret(sns.getCleintSecret())
    	       .callback(sns.getRedirectURL())
    	       .build(sns.getApi20Instance());
    	       
    	this.sns = sns;
    }
    
    public String getNaverAuthURL(String state) {
    	return this.oauthService.getAuthorizationUrl(state);
    }
    	
    public SnsMemberDTO getUserProfile(String code) throws Exception {
    	OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
    	
    	OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
    	oauthService.signRequest(accessToken, request);		
    	
    	Response response = oauthService.execute(request);
    	
    	return parseJson(response.getBody());
    }

	private SnsMemberDTO parseJson(String body) throws Exception {
		System.out.println("=====================\n" + body + "\n=====================");
		
		SnsMemberDTO snsMemberDTO = new SnsMemberDTO();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if(this.sns.isNaver()) {
		    JsonNode resNode = rootNode.get("response");
		    System.out.println(resNode);
		   // snsMemberDTO.setSnsId(resNode.get("id").asText());
		    snsMemberDTO.setSnsName(resNode.get("name").asText());
		    snsMemberDTO.setSnsEmail(resNode.get("email").asText());
		    snsMemberDTO.setPlatForm("naver");
		}
	    
		return snsMemberDTO;
	}
		

	    
	
	
		
		
		    
		


// google

//String id = rootNode.get("id").asText();
//String displayName = rootNode.get("displayName");
//JsonNode nameNode = rootNode.path("name");
//String name = nameNode.get("familyName").asText() + nameNode.get("givenName").asText();
//
//Iterator<JsonNode> iterEmails = rootNode.get("emails").elements();
//while(iterEmails.hasNext()) {
//	JsonNode emailNode =  iterEmails.next();
//	String type = emailNode.get("type").asText();
//	if(StringUtils.equals(type,"account")) {
//	memberDTO.setEmail(emailNode.get("value").asText()); 
//	break;
//	}
//}
	
	
}
