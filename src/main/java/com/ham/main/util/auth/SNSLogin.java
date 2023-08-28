package com.ham.main.util.auth;

import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.hc.client5.http.auth.AuthExchange.State;

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



public class SNSLogin {
	private OAuth20Service oauthService;
    private SnsValue sns;
	
    public SNSLogin(SnsValue sns) {
    	
    	this.oauthService = new ServiceBuilder(sns.getClientId())
    	       .apiSecret(sns.getCleintSecret())
    	       .callback(sns.getRedirectURL())
    	       .defaultScope("profile")
    	       .build(sns.getApi20Instance());
    	       
    	this.sns = sns;
    }
    
    public String getNaverAuthURL(String state) {
    	return this.oauthService.getAuthorizationUrl(state);
    }
    	
    public MemberDTO getUserProfile(String code) throws Exception {
    	OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
    	
    	OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
    	oauthService.signRequest(accessToken, request);		
    	
    	Response response = oauthService.execute(request);
    	
    	return parseJson(response.getBody());
    }

	private MemberDTO parseJson(String body) throws Exception {
		System.out.println("=====================\n" + body + "\n=====================");
		
		MemberDTO memberDTO = new MemberDTO();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if(this.sns.isNaver()) {
		    JsonNode resNode = rootNode.get("response");
		    System.out.println(resNode);
		    memberDTO.setNaverId(resNode.get("id").asText());
		    memberDTO.setName(resNode.get("name").asText());
		    memberDTO.setEmail(resNode.get("email").asText());
		    memberDTO.setPhone(resNode.get("mobile").asText());
//		String id = rootNode.get("id").asText();
//		String displayName = rootNode.get("displayName");
//		JsonNode nameNode = rootNode.path("name");
//		String name = nameNode.get("familyName").asText() + nameNode.get("givenName").asText();
//		
//		Iterator<JsonNode> iterEmails = rootNode.get("emails").elements();
//        while(iterEmails.hasNext()) {
//        	JsonNode emailNode =  iterEmails.next();
//        	String type = emailNode.get("type").asText();
//        	if(StringUtils.equals(type,"account")) {
//        	memberDTO.setEmail(emailNode.get("value").asText()); 
//        	break;
//        	}
//        }
		
		}
		
		
		return memberDTO;
	}
}
