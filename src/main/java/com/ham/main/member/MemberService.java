package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public boolean getMemberIdCheck(MemberDTO memberDTO)throws Exception{
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		
		boolean check = true;
		
		if(memberDTO != null) {
			check = false;
		}
		return check;
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
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberLogin(memberDTO);
	}
}
