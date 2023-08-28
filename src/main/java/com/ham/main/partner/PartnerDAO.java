package com.ham.main.partner;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartnerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.ham.main.partner.PartnerDAO.";
	
	public int setPartnerRegisterJoin(PartnerDTO partnerDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setPartnerRegisterJoin", partnerDTO);
	}
	
}
