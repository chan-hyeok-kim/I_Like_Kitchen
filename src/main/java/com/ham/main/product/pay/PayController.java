package com.ham.main.product.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService payService;
    
	
	
	@GetMapping("add")
	public void setPay() throws Exception{
		
	}
	
	@PostMapping("add")
	public String setPay(PayDTO payDTO,Model model) throws Exception{
		
		payDTO.setId("id677");
		payDTO.setProductNum(2L);
		int result = payService.setPay(payDTO);
		
		model.addAttribute("result", result);
		return "commons/ajaxResult"; 
	}
}



