package com.ham.main.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ham.main.member.MemberDAO."; 
	
	
	public MemberDTO getMemberByEmail(MemberDTO memDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberByEmail", memDTO);
	}
	
	public int setMemberJoin(MemberDTO memDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setMemberJoin", memDTO);
	}
	
	public MemberDTO getMemberLogin(MemberDTO memDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberLogin", memDTO);
	}
	
	public int setMemberRole(MemberDTO memDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setMemberRole", memDTO);
	}
	
	
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
