package com.ham.main.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.ham.main.member.MemberDAO.";
	
	public int setJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setJoin", memberDTO);
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getLogin", memberDTO);
	}
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberIdCheck", memberDTO);
	}
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberEmailCheck", memberDTO);
	}
	
	public int setMemberRole(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setMemberRole", memberDTO);
	}
	
	public MemberDTO findId(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "findId", memberDTO);
	}
	
    public Long memberTelCount(MemberDTO memberDTO) throws Exception{
    	return sqlSession.selectOne(NAMESPACE+"memberTelCount",memberDTO);
    }
    
}
