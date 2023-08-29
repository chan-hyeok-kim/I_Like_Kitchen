package com.ham.main.member;


import java.net.http.HttpRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;
import com.ham.main.util.auth.SNSLogin;
import com.ham.main.util.auth.SnsValue;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

    @Inject
	private SnsValue naverSns;
	
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
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
	public void getLogin(Model model) throws Exception {
		
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naverUrl", snsLogin.getNaverAuthURL("test"));
		
		
	}
	
	@PostMapping("login")
	public String getLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		memberDTO = memberService.getLogin(memberDTO);
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
		}
		//널아닐 시 어떻게 할지 추가
		
		return "redirect:/";
	}
	
	//sns로그인
	@RequestMapping(value = "/auth/{service}/callback", method = {RequestMethod.GET,RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String service, Model model,@RequestParam("code") String code,@RequestParam("state") String state, HttpSession session) throws Exception{
	    System.out.println(code);
	    System.out.println(state);
		logger.info("snsLoginCallback: service={}", service);
	      SnsValue sns = null;
	      if(StringUtils.equals("naver", service)) {
	    	  sns = naverSns;
	      }
	      
	      //1.code를 이용해서 access_token받기
	      //2.access_token을 이용해서 profile받아오기
	      
	      SNSLogin snsLogin = new SNSLogin(sns);
	      MemberDTO snsMemberDTO = snsLogin.getUserProfile(code); //1,2번 동시
	      System.out.println("Profile>>" + snsMemberDTO);
	      
//	      3.DB에 해당 유저가 존재하는지 체크
	      MemberDTO memberDTO = memberService.getBySns(snsMemberDTO);  
          if(memberDTO == null) {
        	  model.addAttribute("result","존재하지 않는 사용자입니다 가입해주세요");
          }else {
        	  model.addAttribute("result",memberDTO.getName() + "님 반갑습니다.");
        	  //4. 존재 시 강제 로그인, 미존재시 가입페이지로
        	  
        	  session.setAttribute("member", memberDTO);
          }
          
	      return "commons/loginResult";
	}
	
	//로그아웃
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
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
	
	
	
	  @PostMapping("phoneAuth")
	    @ResponseBody
	    public Boolean phoneAuth(String phone, HttpSession session) {
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setPhone(phone);
	        try { // 이미 가입된 전화번호가 있으면
	            if(memberService.memberTelCount(memberDTO) > 0) 
	                return true; 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        String code = memberService.sendRandomMessage(phone);
	        session.setAttribute("rand", code);
	        
	        return false;
	    }

	    @PostMapping("phoneAuthOk")
	    @ResponseBody
	    public Boolean phoneAuthOk(HttpServletRequest request) {
	        String rand = (String) request.getSession().getAttribute("rand");
	        String code = (String) request.getParameter("code");

	        System.out.println(rand + " : " + code);

	        if (rand.equals(code)) {
	        	request.getSession().removeAttribute("rand");
	            return false;
	        } 

	        return true;
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