
package com.ham.main.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.Map;

import java.util.UUID;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.Post;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.github.scribejava.core.model.OAuth2AccessToken;


import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.mail.MailSendController;
import com.ham.main.member.mail.MailSendService;

import com.ham.main.partner.PartnerDTO;
import com.ham.main.partner.PartnerService;

import com.ham.main.util.auth.KakaoLogin;
import com.ham.main.util.auth.SNSLogin;
import com.ham.main.util.auth.SnsUrls;
import com.ham.main.util.auth.SnsValue;


@Controller
@RequestMapping("/member/*")
public class MemberController {


	@Autowired
	private MemberService memberService;

	@Autowired
	private MailSendController mailSendController;
	
	@Autowired
	private MailSendService mailSendService;

  @Autowired
  private PartnerService partnerService;
      
  @Inject
	private SnsValue naverSns;
    
  @Autowired
  private KakaoLogin kakaoSns;
    
  
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    

	
	@GetMapping(value = "idCheck")
	public String getMemberIdCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.getMemberIdCheck(memberDTO);
		
		int result = 0;  //중복
		if(memberDTO == null) {
			result = 1; //중복x
		}
		
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("memberEmailCheck")
	public String getMemberEmailCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.getMemberEmailCheck(memberDTO);

		int result = 0;  //중복
		if(memberDTO == null) {
			result = 1; //중복x
		}

		model.addAttribute("result", result);

		return "commons/ajaxResult";
	}
	
	//이용약관
	@GetMapping("memberAgree")
	public void setMemberAgree() throws Exception {

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
		int result = memberService.setMemberJoin(memberDTO);
		
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	@GetMapping("snsJoin")
	public ModelAndView setSnsAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/snsJoin");
		
		return mv;
	}
	
	@PostMapping("snsJoin")
	public ModelAndView setSnsAdd(HttpSession session, MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		SnsMemberDTO snsMemberDTO = (SnsMemberDTO)session.getAttribute("member");
		
		memberDTO.setId(snsMemberDTO.getSnsEmail());
		memberDTO.setName(snsMemberDTO.getSnsName());
		memberDTO.setEmail(snsMemberDTO.getSnsEmail());
		
		int result = memberService.setMemberJoin(memberDTO);
		
		mv.setViewName("redirect:../");
		return mv;
	}
	
	//로그인
	@GetMapping("memberLogin")
	public void getMemberLogin(HttpSession session,Model model) throws Exception {
		
		
        SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naverUrl", snsLogin.getNaverAuthURL("test"));
		model.addAttribute("kakaoUrl", kakaoSns.getKakaoAuth());
		
	}

	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(memberDTO);
		memberDTO = memberService.getMemberLogin(memberDTO);
		System.out.println(memberDTO);
		
		PartnerDTO partnerDTO = partnerService.getPartnerInfo(memberDTO.getId());
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			if(partnerDTO != null) {
				if(memberDTO.getRoles().get(1).getRoleName().equals("PARTNER")) {
					System.out.println(memberDTO.getRoles().get(1));
				    session.setAttribute("partner", partnerDTO);
				}else if(memberDTO.getRoles().get(2).getRoleName().equals("ADMIN")) {
					session.setAttribute("partner", partnerDTO);
				}
			}
			mv.setViewName("redirect:../");
		}else{
			mv.addObject("errorMessage", "로그인에 실패했습니다.");
			mv.setViewName("/member/memberLogin");
		}
		
		return mv;
	}
	
	//로그아웃
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	//회원정보(Mypage)
	@GetMapping("memberPage")
	public ModelAndView getMemberPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		memberDTO = memberService.getMemberPage(memberDTO);
		mv.addObject("kto", memberDTO);
		mv.setViewName("member/memberPage");
		
		return mv;
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
	      SnsMemberDTO snsMemberDTO = snsLogin.getUserProfile(code); //1,2번 동시
	      System.out.println("Profile>>" + snsMemberDTO);
		      
//	      3.DB에 해당 유저가 존재하는지 체크 ->호스트 가입시에 넣어야할듯
//	      반드시 memberDTO로 실행해야함
//	     MemberDTO = memberService.getBySns(MemberDTO);  
//          if(MemberDTO == null) {
//        	  model.addAttribute("result","존재하지 않는 사용자입니다 가입해주세요");
//          }else {
//        	  model.addAttribute("result",snsMemberDTO.getSnsName() + "님 반갑습니다.");
        	  //4. 존재 시 강제 로그인, 미존재시 가입페이지로
	      if(!(snsMemberDTO == null)) {
	    	  memberService.setSnsJoin(snsMemberDTO);
	    	  session.setAttribute("member", snsMemberDTO);
          }
          

          memberService.setSnsJoin(snsMemberDTO);
         
	      return "/home";
	}
	
	
	@RequestMapping("kakaoLogin")
	public String kakaoLogin() throws Exception {
		
		return kakaoSns.getKakaoAuth();
	}
	
	@RequestMapping("/callbackKakao")
	public ModelAndView kakao_redirect(@RequestParam("code") String code, HttpSession session) throws Exception  {
	
	ModelAndView mav = new ModelAndView();
	String accessToken = kakaoSns.getAccessToken(code);
    // 2번 인증코드로 토큰 전달
    HashMap<String, Object> userInfo = kakaoSns.getUserInfo(accessToken);

    System.out.println("login info : " + userInfo.toString());

    if(userInfo.get("account_email") != null) {
        session.setAttribute("userId", userInfo.get("account_email"));
        session.setAttribute("accessToken", accessToken);
    }
    mav.addObject("userId", userInfo.get("account_email"));
    SnsMemberDTO snsMemberDTO = new SnsMemberDTO();
    snsMemberDTO.setPlatForm("kakao");
    snsMemberDTO.setSnsEmail(userInfo.get("account_email").toString());
    snsMemberDTO.setSnsId(userInfo.get("id").toString());
    snsMemberDTO.setSnsName(userInfo.get("profile_nickname").toString());
    System.out.println(snsMemberDTO);
    
    session.setAttribute("member", snsMemberDTO);
    mav.setViewName("/home");
    return mav;
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
	    

  
  

  
  
  
}	   
	

