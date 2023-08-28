package com.ham.main.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String getInfo(MemberDTO memDTO, HttpSession session) throws Exception{
		memDTO.setPassword("1234");
		
		session.setAttribute("kto", memDTO);
		
		return "/mypage/checkInfo";
	}
	@PostMapping("info")
	public String getInfo(MemberDTO memDTO, Model model) throws Exception{
		memDTO = memService.getInfoCheck(memDTO);
		
		model.addAttribute("kto", memDTO);
		
		return "/mypage/info";
	}
	
	@GetMapping("memberUpdate")
	public String setUpdate(MemberDTO memDTO, Model model) throws Exception {
		
		return "/mypage/memberUpdate";
	}
	
	
}
