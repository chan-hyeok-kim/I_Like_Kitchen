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

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.ham.main.product.pay.port.PortController;
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
	
	@Autowired
	private PortController portController;
	
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
	
	//String token = portController.getImportToken();
	//System.out.println(token);
	
	/*
	 *
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
		
	    
		return "commons/ajaxResult";
		

	 	
		
	 	
		
	}
		
		
		
	
}



