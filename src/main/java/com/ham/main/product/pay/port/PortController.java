package com.ham.main.product.pay.port;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PortController {
	
	private IamportClient api;
	
	
	public PortController() {
		this.api = new IamportClient("4731477725013655", "P2hvzzI2zCBK55XBS2hK5p0pElypPFVFJL6goWoyx5g9wi4HguUmiORjta8YQOPGWoKVY8nzokTs7OcG");
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model,Locale locale,HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	
	
	public String getImportToken() throws Exception { 
	HttpURLConnection conn = null;
	String access_token = null;
	URL url = new URL("http://api.iamport.kr/users/getToken");
	conn = (HttpURLConnection)url.openConnection();
	
	conn.setRequestMethod("POST");
	
//	헤더 설정
	conn.setRequestProperty("Content-Type", "applicaition/json");
	conn.setRequestProperty("Accpet", "applicaition/json");
	
	conn.setDoOutput(true);
	
	JsonObject obj = new JsonObject();
	obj.addProperty("imp_key","4731477725013655");
	obj.addProperty("imp_secret","4sLy60QFBFGWqZMMhf3oyDKdIqP3KQnVkgrjy5HOEP2qLap6MY3thgDoCYpbVzQRoMlDOQzqa1o3uW48");
//	JSON형태로 넣은 후 요청
	
	
	BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	bw.write(obj.toString());
	bw.flush();
	bw.close();
    
	int result = 0;
	int responseCode = conn.getResponseCode();
	System.out.println("응답코드 : " + responseCode);
	
    if(responseCode == 200) {
    	System.out.println("환불 성공");
    	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    	StringBuilder sb = new StringBuilder();
    	String line = null;
    	while((line = br.readLine())!=null) {
    		sb.append(line+"\n");
    	}
    	br.close();
    	System.out.println(""+sb.toString());
    	result = 1;
    }else {
    	System.out.println(conn.getResponseMessage());	
    }
       return "sb.toString()";
	}
	
}
