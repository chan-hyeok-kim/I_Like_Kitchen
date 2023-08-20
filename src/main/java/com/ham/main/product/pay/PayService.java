package com.ham.main.product.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	public int setPay(PayDTO payDTO) throws Exception{
		return payDAO.setPay(payDTO);
	}

}
