package com.ham.main.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	//회원가입
	@GetMapping("join")
	public void setJoin() throws Exception {
		
	}
	
	@PostMapping("join")
	public String setJoin(MemberDTO memberDTO) throws Exception {
		int result = memberService.setJoin(memberDTO);
		if(result > 0) {
			memberService.setMemberRole(memberDTO);
		}
		return "redirect:../";
	}
	
	//로그인
	@GetMapping("login")
	public void getLogin() throws Exception {
		
	}
	
	@PostMapping("login")
	public String getLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		memberDTO = memberService.getLogin(memberDTO);
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
		}
		
		return "redirect:../";
	}
	
	//로그아웃
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:../";
	}
	
	//ID중복체크
	@GetMapping("MemberIdCheck")
	public String getMemberIdCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.getMemberIdCheck(memberDTO);
		
		int result = 0; //중복
		if(memberDTO == null) {
			result = 1; //중복x
		}
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	//EMAIL중복체크
	@GetMapping("MemberEmailCheck")
	public String getMemberEmailCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.getMemberEmailCheck(memberDTO);
		
		int result = 0; 
		if(memberDTO == null) {
			result = 1;
		}
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
//	//ID 확인 폼
//	@GetMapping("findIdForm")
//	public ModelAndView setMemberFindId()throws Exception{
//		ModelAndView mv = new ModelAndView();
//				
//		mv.setViewName("/member/findIdForm");
//		return mv;
//	}
	
//	//ID찾기
//	@PostMapping("findId")
//	public ModelAndView findId(HttpServletRequest response, MemberDTO memberDTO, ModelAndView mv) throws Exception {
//		response.setCharacterEncoding("UTF-8");
//		memberDTO = memberService.findId(memberDTO);
//		
//		mv.addObject("id", memberDTO.getId());
//		mv.setViewName("/member/findId");
//		return mv;
//	}
}