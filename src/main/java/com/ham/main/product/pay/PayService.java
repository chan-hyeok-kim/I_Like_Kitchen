package com.ham.main.product.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.product.pay.refund.RefundDTO;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	public int setPay(PayDTO payDTO) throws Exception{
		return payDAO.setPay(payDTO);
	}
	
	public PayDTO getDetail(PayDTO payDTO) throws Exception{
		return payDAO.getDetail(payDTO);
	}
	
	public int setRefund(RefundDTO refundDTO) throws Exception{
	    return payDAO.setRefund(refundDTO);	
	}
	
	public int setUpdatePay(PayDTO payDTO) throws Exception{
		return payDAO.setUpdatePay(payDTO);
	}

}
