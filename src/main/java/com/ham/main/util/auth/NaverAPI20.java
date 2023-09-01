package com.ham.main.util.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;


public class NaverAPI20 extends DefaultApi20 implements SnsUrls{
    private static NaverAPI20 selfInstance;
	
	private NaverAPI20() {	
    }
	
    private static class InstanceHolder{
    	private static final NaverAPI20 INSTANCE = new NaverAPI20();
    	
    }
    
    public static NaverAPI20 instance() {
    	return InstanceHolder.INSTANCE;
    }


	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return NAVER_ACCESS_TOKEN;
	}


	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return NAVER_AUTH;
	}
    
    
        
	
	
}

//얘는 싱글톤으로 만들어야 함
//calendar생각하면 이해감 getinstance()
//왜 싱글톤이어야 하는가?

//싱글톤 만드는 법
//1. getInstance안에 객체 가져가게끔 코딩
//2. instanceHolder final로 객체 생성 후 리턴
//  - instanceHolder를 쓰는 경우, getInstance보단 instance로 많이 쓴다