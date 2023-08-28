package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memDAO;
	
	
	public MemberDTO getInfoCheck(MemberDTO memDTO) throws Exception{
		
		return memDAO.getInfoCheck(memDTO);
	}

}
