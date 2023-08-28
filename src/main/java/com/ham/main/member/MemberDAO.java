package com.ham.main.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ham.main.member.MemberDAO."; 
	
	
	public MemberDTO getInfoCheck(MemberDTO memDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE + "getInfoCheck", memDTO);
	}
	
}
