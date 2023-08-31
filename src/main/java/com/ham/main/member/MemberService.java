package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
//	public boolean getMemberIdCheck(MemberDTO memberDTO)throws Exception{
//		memberDTO = memberDAO.getMemberLogin(memberDTO);
//		
//		boolean check = true;
//		
//		if(memberDTO != null) {
//			check = false;
//		}
//		return check;
//	}
	
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getIdCheck(memberDTO);
	}
	
	public boolean getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
	    memberDTO = memberDAO.getMemberByEmail(memberDTO);

	    boolean check = true;

	    if (memberDTO != null) {
	        check = false;
	    }
	    return check;
	}
	
	//회원가입
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.setMemberJoin(memberDTO);
		
		result = memberDAO.setMemberRole(memberDTO);
		
		return result;
	}
	
	//로그인
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	//회원정보
	public MemberDTO getMemberPage(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	//회원정보수정
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberUpdate(memberDTO);
	}
	
	public int setKakaoJoin(KakaoDTO kakaoDTO) throws Exception {
		return memberDAO.setKakaoJoin(kakaoDTO);
	}

}
