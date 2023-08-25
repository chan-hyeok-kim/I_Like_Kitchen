package com.ham.main.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MemberController {

	@Autowired
	private MemberService memService;
	
	
	@GetMapping("onGoing")
	public String getOnGoing() throws Exception{
		
		return "/mypage/onGoing";
	}
	
	@GetMapping("complete")
	public String getComplete() throws Exception{
		
		return "/mypage/complete";
	}
	
	@GetMapping("cancle")
	public String getCancle() throws Exception{
		
		return "/mypage/cancle";
	}
	
	@GetMapping("info")
	public String getInfo() throws Exception{
		
		return "/mypage/checkInfo";
	}
	
}
