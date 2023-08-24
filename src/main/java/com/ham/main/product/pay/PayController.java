package com.ham.main.product.pay;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpHeaders;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.ham.main.product.pay.refund.RefundDTO;
import com.ham.main.util.AlterDate;
import com.ham.main.util.CreatOrderNum;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService payService;
    
	@Autowired
	private CreatOrderNum creatOrderNum;
	
	@Autowired
	private AlterDate alterDate;
	
	
	@GetMapping("add")
	public void setPay() throws Exception{
		
	}
	
	@PostMapping("add")
	public String setPay(PayDTO payDTO,Model model, String pay_method) throws Exception{
		
		payDTO.setId("id677");
		payDTO.setProductNum(2L);
		int result = payService.setPay(payDTO);
	    
		Long payNum = payDTO.getPayNum();
		model.addAttribute("payNum", payNum);
//		model.addAttribute("result", result);
		return "commons/ajaxPayResult"; 
	}
	
	@GetMapping("detail")
	public void getDetail(PayDTO payDTO,Model model) throws Exception{
	
	payDTO =  payService.getDetail(payDTO);
	model.addAttribute("kto", payDTO);
	/*
	 * Date date1 = payDTO.getBookDTO().getStartTime(); Date date2 =
	 * payDTO.getBookDTO().getEndTime();
	 * 
	 * int useTime = alterDate.useTime(date1,date2); model.addAttribute("useTime",
	 * useTime);
	 */
//	model.addAttribute("pay_method", pay_method);
	}
	
//	@GetMapping("refund")
//	public void setRefund(Model model) throws Exception{
//		payDTO =  payService.getDetail(payDTO);
//		model
//	}
//	
	@PostMapping("refund")
	public String setRefund(Model model,PayDTO payDTO,@RequestParam("reason") String reason) throws Exception{
//		payDTO =  payService.getDetail(payDTO);
		int result = payService.setUpdatePay(payDTO);
		RefundDTO refundDTO = new RefundDTO();
		refundDTO.setPayNum(payDTO.getPayNum());
		
        long payAmount = payDTO.getPayAmount();
//		당일 환불이거나 일정 시간 지난 후 환불이면
//      여기서 메서드 추가해서 계산
//      적립금 없애기도 가능할듯
		refundDTO.setRefundAmount(payAmount);
		refundDTO.setRefundReason(reason);
		if(result>0) {
			payService.setRefund(refundDTO);
		}
		model.addAttribute("result",result);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	 	params.add(reason, reason);
	 	
	 	HttpHeaders headers = new HttpHeaders(params);
	 	headers.add("");
	 	
	 	HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);
		
		return "commons/ajaxResult";
		
//		HttpURLConnection conn = null;
//		String access_token = null;
//		URL url = new URL("http://api.iamport.kr/users/getToken");
//		conn = (HttpURLConnection)url.openConnection();
//		
//		conn.setRequestMethod("POST");
//		
////		헤더 설정
//		conn.setRequestProperty("Content-Type", "applicaition/json");
//		conn.setRequestProperty("Accpet", "applicaition/json");
//		
//		conn.setDoOutput(true);
//		
//		JsonObject obj = new JsonObject();
//		obj.addProperty("imp_key","imp_key");
//		obj.addProperty("imp_secret","imp_secret");
////		JSON형태로 넣은 후 요청
//		
//		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//		bw.write(obj.toString());
//		bw.flush();
//		bw.close();
//	    
//		int result = 0;
//		int responseCode = conn.getResponseCode();
//		System.out.println("응답코드 : " + responseCode);
//		
//	    if(responseCode == 200) {
//	    	System.out.println("환불 성공");
//	    	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//	    	StringBuilder sb = new StringBuilder();
//	    	String line = null;
//	    	while((line = br.readLine())!=null) {
//	    		sb.append(line+"\n");
//	    	}
//	    	br.close();
//	    	System.out.println(""+sb.toString());
//	    	result = 1;
//	    }else {
//	    	System.out.println(conn.getResponseMessage());	
//	    }
	 	
		
	 	
		
	}
		
		
		
	
}



