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
	
	
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE +"getMemberEmailCheck", memberDTO);
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
	
	
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMemberIdCheck", memberDTO);
	}
	
//	public int setKakaoJoin(SnsMemberDTO snsMemberDTO) throws Exception {
//		return sqlSession.insert(NAMESPACE + "setKakaoJoin", snsMemberDTO);
//	}
//	
//	public long getKakaoLogin(SnsMemberDTO snsMemberDTO) throws Exception {
//		return sqlSession.selectOne(NAMESPACE + "getKakaoLogin", snsMemberDTO);
//	}

	
	
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
    
//    민준 업데이트
  
    public MemberDTO getCheckInfo(MemberDTO memDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getCheckInfo", memDTO);
	}
	
	public int setUpdate(MemberDTO memDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdate", memDTO);
	}
	
	public int setDelete(MemberDTO memDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", memDTO);
	}

	public int setSnsJoin(SnsMemberDTO snsMemberDTO) throws Exception {
		System.out.println(snsMemberDTO);
		return sqlSession.insert(NAMESPACE+"setSnsJoin", snsMemberDTO);
	}
	


}
