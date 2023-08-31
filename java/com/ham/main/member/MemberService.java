package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	
	@Autowired
	private static MemberDAO memberDAO;
	
	public static MemberDTO getLogin(MemberDTO memberDTO)throws Exception{
		return memberDAO.getLogin(memberDTO);
	}
}
