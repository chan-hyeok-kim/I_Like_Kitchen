package com.ham.main.util.auth;

import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
	private OAuth20Service oauthService;
    private SnsValue sns;
	
   
    
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
		    snsMemberDTO.setSnsId(resNode.get("id").asText());
		    snsMemberDTO.setSnsName(resNode.get("name").asText());
		    snsMemberDTO.setSnsEmail(resNode.get("email").asText());
		    snsMemberDTO.setPlatForm("naver");
		}
	    
		
		
		
		return snsMemberDTO;
	}
		
		
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
		
		    
		    
	
//
//private final static String KAKAO_CLIENT_ID = "afe2f18ae504e6a6e246ffaf5a595455";
//private final static String KAKAO_CLIENT_SECRET = "u1ddJi6GhEtAD71RgYkWCSatNgKaWIHu";
//private final static String KAKAO_REDIRECT_URI = "http://localhost:8081/member/callbackKakao.do";
//private final static String SESSION_STATE = "kakao_oauth_state";
//private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
//
//public String getAuthorizationUrl(HttpSession session) {
//	String state = generateRandomString();
//	setSession(session, state);
//	 this.oauthService = new ServiceBuilder(sns.getClientId())
//		.apiKey(KAKAO_CLIENT_ID)
//		.apiSecret(KAKAO_CLIENT_SECRET)
//		.callback(KAKAO_REDIRECT_URI)
//		.build(KakaoAPI20.instance());
//	return oauthService.getAuthorizationUrl();
//}
//
//public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
//	String sessionState = getSession(session);
//	if (org.springframework.util.StringUtils.pathEquals(sessionState, state)) {
//		this.oauthService = new ServiceBuilder(sns.getClientId())
//			.apiKey(KAKAO_CLIENT_ID)
//			.apiSecret(KAKAO_CLIENT_SECRET)
//			.callback(KAKAO_REDIRECT_URI)
//			.build(KakaoAPI20.instance());
//		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
//		return accessToken;
//	}
//	return null;
//}
//
//public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
//	OAuth20Service oauthService = new ServiceBuilder(sns.getClientId())
//		.apiKey(KAKAO_CLIENT_ID)
//		.apiSecret(KAKAO_CLIENT_SECRET)
//		.callback(KAKAO_REDIRECT_URI)
//		.build(KakaoAPI20.instance());
//	OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL);
//	oauthService.signRequest(oauthToken, request);
//	Response response = oauthService.execute(request);
//	return response.getBody();
//}
//
//private String generateRandomString() {
//	return UUID.randomUUID().toString();
//}
//
//private void setSession(HttpSession session, String state) {
//	session.setAttribute(SESSION_STATE, state);
//}
//
//private String getSession(HttpSession session) {
//	return (String)session.getAttribute(SESSION_STATE);
//}
//
//	
//	
	
	
}
