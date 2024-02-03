package com.ham.main.member;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Random;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.scribejava.core.model.Response;
import com.ham.main.util.SendMessage;


@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public SnsMemberDTO getBySns(SnsMemberDTO snsMemberDTO) throws Exception {
		return memberDAO.getBySns(snsMemberDTO);
	}

	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberIdCheck(memberDTO);
	}
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberEmailCheck(memberDTO);
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
	
	

	
	public String sendRandomMessage(String phone) {
        SendMessage message = new SendMessage();
  
        String numStr = "예약이 취소되셨습니다. 자세한 사항은 문의 바랍니다";
        message.sendMsg(phone, numStr);

        return numStr;
    }
	
	 public Long memberTelCount(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.memberTelCount(memberDTO);
	 }
	 
	 public SnsMemberDTO getBySnsNaver(SnsMemberDTO snsMemberDTO) throws Exception{
	    	return memberDAO.getBySnsNaver(snsMemberDTO);
	 }
	 
	 public MemberDTO getDetail(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.getDetail(memberDTO);
	 }
	 
	//  admin 권한 부여, 삭제
	   public int adminAdd(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.adminAdd(memberDTO);
	    }
	    
	    public int adminRemove(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.adminRemove(memberDTO);
	    }
	//  partner 권한 부여, 삭제
	    public int partnerAdd(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.partnerAdd(memberDTO);
	    }
	    
	    public int partnerRemove(MemberDTO memberDTO) throws Exception{
	    	return memberDAO.partnerRemove(memberDTO);
	    }

//    민준 업데이트
    public MemberDTO getCheckInfo(MemberDTO memberDTO) throws Exception{
		   return memberDAO.getCheckInfo(memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.setUpdate(memberDTO);
		return result;
    }

	public int setDelete(MemberDTO memberDTO) throws Exception{
		return memberDAO.setDelete(memberDTO);
	}

	public int setSnsJoin(SnsMemberDTO snsMemberDTO) throws Exception {
		return memberDAO.setSnsJoin(snsMemberDTO);
	}
	
	public int setAdd(MemberDTO memberDTO) throws Exception{
		int result=memberDAO.setAdd(memberDTO);
		
		result=memberDAO.setMemberRole(memberDTO);
		
		
		return result;	
	}
	
	public MemberDTO getSnsMemberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getSnsMemberLogin(memberDTO);
	}
	
	
	
}
	    
	
	



