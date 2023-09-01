package com.ham.main.member;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.ham.main.member.MemberDAO.";
	
  public MemberDTO getMemberByEmail(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberByEmail", memberDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setMemberJoin", memberDTO);
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberLogin", memberDTO);
	}
	
	public int setMemberRole(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setMemberRole", memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setMemberUpdate", memberDTO);
	}
	
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getIdCheck", memberDTO);
	}
	
	public int setKakaoJoin(SnsMemberDTO snsMemberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setKakaoJoin", snsMemberDTO);
	}
	
	public long getKakaoLogin(SnsMemberDTO snsMemberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getKakaoLogin", snsMemberDTO);
	}

	
	
    public Long memberTelCount(MemberDTO memberDTO) throws Exception{
    	return sqlSession.selectOne(NAMESPACE+"memberTelCount",memberDTO);
    }
    
    public SnsMemberDTO getBySnsNaver(SnsMemberDTO snsMemberDTO) throws Exception{
    	return sqlSession.selectOne(NAMESPACE+"getBySnsNaver", snsMemberDTO);
    }
    
    public MemberDTO getDetail(MemberDTO memberDTO) throws Exception{
    	return sqlSession.selectOne(NAMESPACE+"getDetail",memberDTO);
    }
    
//  admin 권한 부여, 삭제
    public int adminAdd(MemberDTO memberDTO) throws Exception{
    	return sqlSession.update(NAMESPACE+"adminAdd", memberDTO);
    }
    
    public int adminRemove(MemberDTO memberDTO) throws Exception{
    	return sqlSession.update(NAMESPACE+"adminRemove", memberDTO);
    }
//  partner 권한 부여, 삭제
    public int partnerAdd(MemberDTO memberDTO) throws Exception{
    	return sqlSession.update(NAMESPACE+"adminAdd", memberDTO);
    }
    
    public int partnerRemove(MemberDTO memberDTO) throws Exception{
    	return sqlSession.update(NAMESPACE+"adminRemove", memberDTO);
    }
    
    

}
