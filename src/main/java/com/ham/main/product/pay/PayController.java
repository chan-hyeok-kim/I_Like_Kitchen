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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ham.main.member.MemberService;
import com.ham.main.partner.PartnerDTO;
import com.ham.main.partner.PartnerService;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.ProductService;
import com.ham.main.product.book.BookDTO;
import com.ham.main.product.book.BookService;
import com.ham.main.product.pay.port.PortController;
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
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("add")
	public void setPay(BookDTO bookDTO, Model model, HttpSession session) throws Exception{
//		파트너디테일,productdetail 넣어야함 
		bookDTO = bookService.getDetail(bookDTO);
		
//		예약번호로 상품번호 조회
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(bookDTO.getProductNum());
		productDTO = productService.getDetail(productDTO);
		
//		상품번호로 파트너조회
		PartnerDTO partnerDTO = new PartnerDTO();
		partnerDTO.setPartnerNum(productDTO.getPartnerNum());
		partnerDTO = partnerService.getDetail(partnerDTO);
	   
	
		model.addAttribute("kto", partnerDTO);
		model.addAttribute("book", bookDTO);
	}
	
	@PostMapping("add")
	public String setPay(PayDTO payDTO, Model model) throws Exception{
//	    Pay-method받을까 말까
		
		int result = payService.setPay(payDTO);
	    
		String payNum = payDTO.getPayNum();
		model.addAttribute("payNum", payNum);
//		model.addAttribute("result", result);
		return "commons/ajaxPayResult"; 
	}
	
	@GetMapping("detail")
	public void getDetail(PayDTO payDTO,Model model) throws Exception{
	
	payDTO =  payService.getDetail(payDTO);
	model.addAttribute("kto", payDTO);
//	String token = portController.getImportToken();
//    	
//	System.out.println(token);
	}
	
	
	
	
	@PostMapping("refund")
	public String setRefund(Model model,PayDTO payDTO,@RequestParam("reason") String reason) throws Exception{
//		payDTO =  payService.getDetail(payDTO);
		
		RefundDTO refundDTO = new RefundDTO();
		refundDTO.setPayNum(payDTO.getPayNum());
		
        long payAmount = payDTO.getPayAmount();
//		당일 환불이거나 일정 시간 지난 후 환불이면
//      여기서 메서드 추가해서 계산
//      적립금 없애기도 가능할듯
		refundDTO.setRefundAmount(payAmount);
		refundDTO.setRefundReason(reason);
		
		String token = portController.getImportToken();
		payDTO = payService.getDetail(payDTO);
	    String uid = payDTO.getPayNum().toString();
	    
		portController.payMentCancle(token, uid, refundDTO.getRefundAmount(), reason);
	
		int result = payService.setRefund(refundDTO);
		
		model.addAttribute("result",result);
		
		
//		조회를 하고 uid빼서넣기
		
		
		
		return "commons/ajaxResult";
	}
	
    @GetMapping("list")
    public void getList(BookDTO bookDTO,Model model) throws Exception{
    	List<BookDTO> bl = bookService.getBookInfo(bookDTO);  
    	
    	List<PayDTO> pl = new ArrayList<PayDTO>();
		for(BookDTO b: bl) {
			PayDTO payDTO = new PayDTO();
			payDTO.setBookNum(b.getBookNum()); 
			payDTO = payService.getPayInfo(payDTO);	
			if(payDTO!=null) {
			System.out.println(payDTO);
			pl.add(payDTO);
			}
		}
		
		if(pl.size()!=0) {
			model.addAttribute("payList", pl);
			model.addAttribute("list", bl);
		}
		
		
		
	}
		
		
		
	
}



