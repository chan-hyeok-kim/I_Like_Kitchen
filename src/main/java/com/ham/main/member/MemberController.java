package com.ham.main.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/mypage/*")
public class MemberController {

	@Autowired
	private MemberService memService;

	
	@PostMapping("memberEmailCheck")
	public ModelAndView getMemberEmailCheck(MemberDTO memberDTO)throws Exception {
	    boolean check = memService.getMemberEmailCheck(memberDTO);
	    ModelAndView mv = new ModelAndView();

	    mv.addObject("result", check);
	    mv.setViewName("commons/ajaxResult");
	    return mv;
	}
	
	//회원가입
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/memberJoin");
		
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = memService.setMemberJoin(memberDTO);
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	//로그인
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/memberLogin");
		
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memService.getMemberLogin(memberDTO);
		
		if(memberDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberDTO);
			
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("errorMessage", "로그인에 실패했습니다.");
			mv.setViewName("/member/memberLogin");
		}
		
		return mv;
	}
		
	
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
	
	@GetMapping("productDetail")
	public String getProductDetail() throws Exception {
		
		return "/mypage/productDetail";
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
