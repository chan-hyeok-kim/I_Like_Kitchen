package com.ham.main.util.auth;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ham.main.member.SnsMemberDTO;

import lombok.Data;

@Data
@Component
public class KakaoLogin {
	
    //kakao
	private String state = "test";
	private String kakaoClientId = "ad31c6a5aaaa8e58d6a71df13e7a8cbd";
    private String kakaoRedirectUri = "http://localhost:82/member/callbackKakao";
    private String kakaoLoginUrl = "https://kauth.kakao.com/oauth/authorize?response_type=code"
							+ "&client_id=" + kakaoClientId
							+ "&redirect_uri=" + kakaoRedirectUri
							+ "&state=" + state;
    private String kakaoToken = "https://kauth.kakao.com/oauth/token";
    private String kakaoClientSecret = "jXYjRZugqnjo6BWGDzuCy3bkbu6dGtpB";  
   
	
	public String getAccessToken(String code) throws Exception {
		// 카카오에서 전달해준 code 값 가져오기
	
	    String tokenURL = kakaoToken;
	    String client_id = kakaoClientId;
	    String client_secret = kakaoClientSecret;   // 필수X
		String redirect_uri = kakaoRedirectUri;     // 예시의 경우 {contextPath}/kakao_redirect
		String accessToken = "";
        String refreshToken = "";
        
		  try {
	            URL url = new URL(tokenURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id="+client_id);  //본인 걸로 수정하기            
	            sb.append("&redirect_uri="+redirect_uri);  //본인 걸로 수정하기 
	            sb.append("&code="+code);

	            bw.write(sb.toString());
	            bw.flush();

	            //결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("response code = " + responseCode);

	            //JSON 파싱
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";
	            while((line = br.readLine())!=null) {
	                result += line;
	            }
	            System.out.println("response body=" + result);

	            //Gson 라이브러리에 포함된 클래스로 JSON 파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            accessToken = element.getAsJsonObject().get("access_token").getAsString();
	            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

	            br.close();
	            bw.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return accessToken;
	    }

	    public HashMap<String, Object> getUserInfo(String accessToken) throws Exception {
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqUrl = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqUrl);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode =" + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body ="+result);

	            JsonParser parser = new JsonParser();
	            JsonElement element =  parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	            JsonObject snsID = element.getAsJsonObject();

	            String profile_nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String account_email = kakaoAccount.getAsJsonObject().get("email").getAsString();
                String sns_id = snsID.get("id").getAsString();
                		
	            userInfo.put("profile_nickname", profile_nickname);
	            userInfo.put("account_email", account_email);
                userInfo.put("id", sns_id);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return userInfo;
	    }


	    public void logout(String accessToken) {
	        String reqURL = "http://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode = " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String result = "";
	            String line = "";

	            while((line = br.readLine()) != null) {
	                result+=line;
	            }
	            System.out.println(result);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
