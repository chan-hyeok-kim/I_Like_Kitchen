package com.ham.main.partner;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.member.MemberDTO;

@Repository
public class PartnerDAO {


	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.ham.main.partner.PartnerDAO.";
	
	public int setPartnerJoin(PartnerDTO partnerDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setPartnerJoin", partnerDTO);
	}
	
	public PartnerDTO getDetail(PartnerDTO partnerDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", partnerDTO);
	}
	
	public List<PartnerDTO> getList(PartnerDTO partnerDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", partnerDTO);
	}
	
	public int setPermitUpdate(PartnerDTO partnerDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setPermitUpdate", partnerDTO);
	}
	
	public PartnerDTO getPartnerInfo(String id) throws Exception{
		System.out.println(id);
		System.out.println("1");
		return sqlSession.selectOne(NAMESPACE+"getPartnerInfo", id);
	}
	
	public int setUpdate(PartnerDTO partnerDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"setUpdate", partnerDTO);
	}


}
