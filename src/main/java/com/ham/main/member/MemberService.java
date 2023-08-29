package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memDAO;
	
	
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
