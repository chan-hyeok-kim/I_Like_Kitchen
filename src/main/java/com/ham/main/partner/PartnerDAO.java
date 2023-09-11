package com.ham.main.partner;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.member.MemberDTO;
import com.ham.main.util.Pager;

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
	
	public List<PartnerDTO> getList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pager);
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
	
	public List<PartnerDTO> getPermitList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPermitList", pager);
	}
	
    public long getTotal() throws Exception{
    	return sqlSession.selectOne(NAMESPACE+"getTotal", NAMESPACE);
    }
    
    public long getPermitTotal() throws Exception{
    	return sqlSession.selectOne(NAMESPACE+"getPermitTotal", NAMESPACE);
    }

}
