package com.ham.main.product.pay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.product.pay.refund.RefundDTO;

@Repository
public class PayDAO {
	
	@Autowired
	public SqlSession sqlSession;
	public final String NAMESPACE="com.ham.main.product.pay.PayDAO.";
	
	public int setPay(PayDTO payDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setPay", payDTO);
	}
	
	public PayDTO getDetail(PayDTO payDTO) throws Exception{
	    return sqlSession.selectOne(NAMESPACE+"getDetail", payDTO);	
	}
	
	public int setRefund(RefundDTO refundDTO) throws Exception{
	    return sqlSession.insert(NAMESPACE+"setRefund", refundDTO);	
	}
	
	public int setUpdatePay(PayDTO payDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdatePay", payDTO);
	}
}
