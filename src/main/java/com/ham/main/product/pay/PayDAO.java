package com.ham.main.product.pay;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.util.Pager;

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
	
	public int setRefundCheck(RefundDTO refundDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setRefundCheck", refundDTO);
	}
	
	public long getPayTotal(PayDTO payDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPayTotal", payDTO);
	}
	
	public List<PayDTO> getList(Pager pager) throws Exception{
	    return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
}
