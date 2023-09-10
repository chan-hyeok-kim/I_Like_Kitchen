package com.ham.main.product.pay;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public PayDTO getPayInfo(PayDTO payDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPayInfo", payDTO); 
	}
	
	public RefundDTO getRefundInfo(RefundDTO refundDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getRefundInfo", refundDTO);
	}
	
	public long getRefundTotal(RefundDTO refundDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getRefundTotal", refundDTO);
	}
}
