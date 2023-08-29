package com.ham.main.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ham.main.member.MemberDAO."; 
	
	
	public MemberDTO getCheckInfo(MemberDTO memDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE + "getCheckInfo", memDTO);
	}
	
	public int setUpdate(MemberDTO memDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE + "setUpdate", memDTO);
	}
	
	public int setDelete(MemberDTO memDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE + "setDelete", memDTO);
	}
	
}
