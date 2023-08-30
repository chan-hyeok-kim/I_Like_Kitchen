package com.ham.main.util.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoAPI20 extends DefaultApi20 {
	protected KakaoAPI20() {
		
	}
	
	private static class InstanceHolder {
		private static final KakaoAPI20 INSTANCE = new KakaoAPI20();
	}
	
	public static KakaoAPI20 instance() {
		return InstanceHolder.INSTANCE;
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		return "https://kauth.kakao.com/oauth/token";
	}
	
	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://kauth.kakao.com/oauth/authorize";
	}
}
