package com.ham.main.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.ham.main.member.mail.MailSendController;
import com.ham.main.member.mail.MailSendService;
import com.ham.main.util.auth.KakaoLoginBO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	private String apiResult = null;
	
	@Autowired
	private MailSendController mailSendController;
	
	@Autowired
	private MailSendService mailSendService;
	
//	@PostMapping("memberIdCheck")
//	public ModelAndView getMemberIdCheck(MemberDTO memberDTO)throws Exception{
//		boolean check = memberService.getMemberIdCheck(memberDTO);
//		ModelAndView mv = new ModelAndView();
//		
//		mv.addObject("result", check);
//		mv.setViewName("commons/ajaxResult");
//		return mv;
//	}
	
	@GetMapping(value = "idCheck")
	public String getIdCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.getIdCheck(memberDTO);
		
		int result = 0;  //중복
		if(memberDTO == null) {
			result = 1; //중복x
		}
		
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("memberEmailCheck")
	public ModelAndView getMemberEmailCheck(MemberDTO memberDTO)throws Exception {
	    boolean check = memberService.getMemberEmailCheck(memberDTO);
	    ModelAndView mv = new ModelAndView();

	    mv.addObject("result", check);
	    mv.setViewName("commons/ajaxResult");
	    return mv;
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
	
	//로그인
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin(Model model, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		//System.out.println("카카오:" + kakaoAuthUrl);
		model.addAttribute("urlKakao", kakaoAuthUrl);
		mv.setViewName("/member/memberLogin");
		
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberLogin(memberDTO);
		
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
	
	//회원정보수정
	@GetMapping("memberUpdate")
	public ModelAndView setMemberUpdate(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		memberDTO = memberService.getMemberPage(memberDTO);
		mv.addObject("kto", memberDTO);
		mv.setViewName("member/memberUpdate");
		
		return mv;
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(sessionMemberDTO.getId());
		int result = memberService.setMemberUpdate(memberDTO);
		
		mv.setViewName("redirect:./memberPage");
		return mv;
	}

	
	// 카카오 로그인 성공시 callback
	@RequestMapping(value = "/callbackKakao.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		System.out.println("로그인 성공 callbackKakao");
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다
		apiResult = kakaoLoginBO.getUserProfile(oauthToken);
			
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
			
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");	
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
		System.out.println(jsonObj);
		Long response_obj3 = (Long) jsonObj.get("id");
		
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj2.get("nickname");
		System.out.println(response_obj3);
		String id = response_obj3.toString();
		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setEmail(email);
		session.setAttribute("signIn", apiResult);
		System.out.println(apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		
		session.setAttribute("member", memberDTO);
		KakaoDTO kakaoDTO = new KakaoDTO();
		System.out.println(id);
		kakaoDTO.setId(id);
		kakaoDTO.setKakaoName(name);
		kakaoDTO.setKakaoEmail(email);
		
		
		
		memberService.setKakaoJoin(kakaoDTO);
		
		
	
		return "/home";
	}
	
	
	    
//	// 소셜 로그인 성공 페이지
//	@RequestMapping("/loginSuccess")
//	public String loginSuccess() {
//		return "member/loginSuccess";
//	}
	
}
