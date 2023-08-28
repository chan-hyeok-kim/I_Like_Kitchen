package com.ham.main.partner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;

@Controller
@RequestMapping("/partner/*")
public class PartnerController {
	
	@Autowired
	private PartnerService partnerService;
	
	private final String SERVICE_KEY = "bJ6kMWyyBbwha2z3sjC5XeliD%2F%2FTMdJcXmr9veQc%2BIKmwfUs0IYcoRmG0F7qXaxYkf61qRvzBy67J30mnS64Mg%3D%3D";
	
	@Autowired
	private MemberService memberService;
	
	//로그인
	@GetMapping("partnerLogin")
	public void getMemberLogin() throws Exception {
		
	}
	
	@PostMapping("partnerLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberLogin(memberDTO);
		
		if(memberDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberDTO);
			
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("errorMessage", "로그인에 실패했습니다.");
			mv.setViewName("/partner/partnerLogin");
		}
		
		return mv;
	}
	
	//사업자등록
	@GetMapping("partnerRegister")
	public ModelAndView setPartnerRegisterJoin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("serviceKey", SERVICE_KEY);
		mv.setViewName("/partner/partnerRegister");
		
		return mv;
	}
	
	@PostMapping("partnerRegister")
	public ModelAndView setPartnerRegisterJoin(PartnerDTO partnerDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = partnerService.setPartnerRegisterJoin(partnerDTO);
		mv.setViewName("redirect:../");
		
		return mv;
	}
}
