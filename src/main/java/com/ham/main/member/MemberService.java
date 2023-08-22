package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public int setJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setJoin(memberDTO);
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getLogin(memberDTO);
	}
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberIdCheck(memberDTO);
	}
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberEmailCheck(memberDTO);
	}
	
	public int setMemberRole(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberRole(memberDTO);
	}
	
	public MemberDTO findId(MemberDTO memberDTO) throws Exception {
		return memberDAO.findId(memberDTO);
	}
}