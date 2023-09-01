package com.ham.main.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("home")
	public void goHome() throws Exception{
		
	}
	
	@GetMapping("adminAuth")
	public void getAuth()throws Exception{
		
	}
	
	@PostMapping("adminAdd")
	public String adminAdd(MemberDTO memberDTO) throws Exception{
		int result = memberService.adminAdd(memberDTO);
		
		return "admin/home";
	}
	
	@PostMapping("adminRemove")
	public String adminRemove(MemberDTO memberDTO) throws Exception{
	    int result = memberService.adminRemove(memberDTO);
		return "admin/adminAuth";
	}
	
	
	
}
