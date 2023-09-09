package com.ham.main.member.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.member.MemberDAO;
import com.ham.main.member.MemberDTO;

@Service
public class FindMemberService {

	@Autowired
	private FindMemberDAO findMemberDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	public boolean getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
	    memberDTO = memberDAO.getMemberEmailCheck(memberDTO);

	    boolean check = true;

	    if (memberDTO != null) {
	        check = false;
	    }
	    return check;
	}
	
	public MemberDTO getMemberId(MemberDTO memberDTO) throws Exception {
		return findMemberDAO.getMemberId(memberDTO);
	}
	
	public MemberDTO findMemberByIdAndEmail(MemberDTO memberDTO) throws Exception {
		return findMemberDAO.findMemberByIdAndEmail(memberDTO);
	}
	public int setUpdatePassword(MemberDTO memberDTO) throws Exception {
		return findMemberDAO.setUpdatePassword(memberDTO);
	}
}
