package com.ham.main.member;

import java.util.Random;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.scribejava.core.model.Response;
import com.ham.main.util.SendMessage;

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
	
	public String sendRandomMessage(String phone) {
        SendMessage message = new SendMessage();
        Random random = new Random();
        String numStr = "";
        for (int i = 0; i < 6; i++) {
            String randomNum = Integer.toString(random.nextInt(10));
            numStr += randomNum;
        }
     
        System.out.println("회원가입 문자 인증 => " + numStr);
        message.sendMsg(phone, numStr);

        return numStr;
    }
	
	 public Long memberTelCount(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.memberTelCount(memberDTO);
	 }
	 
	 public MemberDTO getBySns(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.getBySnsNaver(memberDTO);
	 }
	 
	 public MemberDTO getDetail(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.getDetail(memberDTO);
	 }
	
	
}