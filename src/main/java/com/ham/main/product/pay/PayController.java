package com.ham.main.product.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService payService;
    
	
	
	@GetMapping("add")
	public void setPay() throws Exception{
		
	}
	
	
//	@PostMapping("add")
	public int setPay(PayDTO payDTO) throws Exception{
		
		return payService.setPay(payDTO);
	}
}



