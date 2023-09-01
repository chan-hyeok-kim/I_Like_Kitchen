package com.ham.main.util.auth;

public interface SnsUrls {
 
	 static final String NAVER_ACCESS_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	 static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize";
	 static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
     static final String NAVER_VERIFY_URL = "https://openapi.naver.com/v1/nid/verify";		
	 
     static final String KAKAO_CLIENT_ID = "afe2f18ae504e6a6e246ffaf5a595455";
 	 static final String KAKAO_CLIENT_SECRET = "u1ddJi6GhEtAD71RgYkWCSatNgKaWIHu";
 	 static final String KAKAO_REDIRECT_URI = "http://localhost:8081/member/callbackKakao";
     static final String KAKAO_ACCESS_TOKEN = "https://kauth.kakao.com/oauth/token";
	 static final String KAKAO_AUTH = "https://kauth.kakao.com/oauth/authorize";
	 static final String SESSION_STATE = "kakao_oauth_state";	
	 static final String KAKAO_PROFILE_URL = "https://kapi.kakao.com/v2/user/me";
		
}
