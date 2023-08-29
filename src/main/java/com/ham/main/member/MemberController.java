package com.ham.main.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.Post;

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
		memDTO.setId("qwe");
		memDTO = memService.getCheckInfo(memDTO);
		
		session.setAttribute("kto", memDTO);
		
		return "/mypage/info";
	}
	
	@GetMapping("checkInfo")
	public String checkInfo(MemberDTO memDTO, HttpSession session, Model model) throws Exception {
		memDTO = (MemberDTO)session.getAttribute("kto");
		
		memDTO = memService.getCheckInfo(memDTO);
		
		model.addAttribute("kto", memDTO);
		
		return "/mypage/checkInfo";
	}
	
	@GetMapping("memberUpdate")
	public String setUpdate() throws Exception {
		
		return "/mypage/memberUpdate";
	}
	@PostMapping("memberUpdate")
	public String setUpdate(MemberDTO memDTO) throws Exception {
		int result = memService.setUpdate(memDTO);
		
		System.out.println(memDTO.getId());
		System.out.println(memDTO.getPassword());
		System.out.println(memDTO.getName());
		System.out.println(result);
		
		return "redirect:/mypage/info";
	}
	
	@PostMapping("delete")
	public String setDelete(MemberDTO memDTO, HttpSession session) throws Exception{
		memService.setDelete(memDTO);
		session.invalidate();
		System.out.println(memDTO.getId());
		
		return "redirect:/";
	}
	
	
}
