package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memDAO;
	@Autowired
	FileManager fileManager;
	
	
	public boolean getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
	    memberDTO = memDAO.getMemberByEmail(memberDTO);

	    boolean check = true;

	    if (memberDTO != null) {
	        check = false;
	    }
	    return check;
	}
	
	//회원가입
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		int result = memDAO.setMemberJoin(memberDTO);
		
		result = memDAO.setMemberRole(memberDTO);
		
		return result;
	}
	
	//로그인
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		return memDAO.getMemberLogin(memberDTO);
	}
	
	
	public MemberDTO getCheckInfo(MemberDTO memDTO) throws Exception{
		
		return memDAO.getCheckInfo(memDTO);
	}
	
	public int setUpdate(MemberDTO memDTO) throws Exception {
		
		return memDAO.setUpdate(memDTO);
	}
	
	public int setDelete(MemberDTO memDTO) throws Exception{
		
		return memDAO.setDelete(memDTO);
	}

}
