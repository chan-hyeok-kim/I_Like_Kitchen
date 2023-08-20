package com.ham.main.product.pay;

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

}
