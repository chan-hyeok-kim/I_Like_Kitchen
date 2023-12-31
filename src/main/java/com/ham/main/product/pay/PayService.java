package com.ham.main.product.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.util.Pager;

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
	
	public PayDTO getPayInfo(PayDTO payDTO) throws Exception{
		return payDAO.getPayInfo(payDTO); 
	}
	
	public RefundDTO getRefundInfo(RefundDTO refundDTO) throws Exception{
		return payDAO.getRefundInfo(refundDTO);
	}

	public long getRefundTotal(RefundDTO refundDTO) throws Exception{
		return payDAO.getRefundTotal(refundDTO);
	}
	
	public int setRefundCheck(RefundDTO refundDTO) throws Exception{
		return payDAO.setRefundCheck(refundDTO);
	}
	
	public List<PayDTO> getList(PayDTO payDTO,Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(payDAO.getPayTotal(payDTO));
	    return payDAO.getList(pager);
	}
	
	public long getPayTotal(PayDTO payDTO) throws Exception{
		return payDAO.getPayTotal(payDTO);
	}


}
