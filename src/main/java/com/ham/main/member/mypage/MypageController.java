package com.ham.main.member.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;
import com.ham.main.question.QuestionDTO;
import com.ham.main.question.QuestionService;
import com.ham.main.review.ReviewDTO;
import com.ham.main.review.ReviewService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private QuestionService questionService;
	
	
	// My활동
	@GetMapping("reviewList")
	public String getReviewList(Model model, HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");		
		List<ReviewDTO> ar = reviewService.myList();
		
		model.addAttribute("list", ar);
		
		return "/mypage/reviewList";
	}
	
	@GetMapping("questionList")
	public String getQuestionList(Model model, HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");		
		List<QuestionDTO> ar = questionService.myList();
		
		model.addAttribute("list", ar);
		
		return "/mypage/questionList";
	}
	
	
	// 예약정보
  	@GetMapping("onGoing")
	public String getOnGoing(MemberDTO memberDTO, HttpSession session) throws Exception{
  		memberDTO = (MemberDTO) session.getAttribute("member");
  		
  		if(memberDTO != null) {
  			return "/mypage/onGoing";
  		} else {
  			return "redirect:/member/memberLogin";
  		}
	}
	
	@GetMapping("complete")
	public String getComplete(MemberDTO memberDTO, HttpSession session) throws Exception{
		memberDTO = (MemberDTO) session.getAttribute("member");
  		
  		if(memberDTO != null) {
  			return "/mypage/complete";
  		} else {
  			return "redirect:/member/memberLogin";
  		}
	}
	
	@GetMapping("cancle")
	public String getCancle(MemberDTO memberDTO, HttpSession session) throws Exception{
		memberDTO = (MemberDTO) session.getAttribute("member");
  		
  		if(memberDTO != null) {
  			return "/mypage/cancle";
  		} else {
  			return "redirect:/member/memberLogin";
  		}
	}
	
	@GetMapping("productDetail")
	public String getProductDetail() throws Exception {
		
		return "/mypage/productDetail";
	}
	
	// My정보
	@GetMapping("info")
	public String getInfo(MemberDTO memberDTO, HttpSession session) throws Exception{
		memberDTO = (MemberDTO) session.getAttribute("member");
		
		if(memberDTO != null) {
			memberDTO = memberService.getCheckInfo(memberDTO);
			
			session.setAttribute("member", memberDTO);
			
  			return "/mypage/info";
  		} else {
  			return "redirect:/member/memberLogin";
  		}
	}
	
	@GetMapping("checkInfo")
	public String checkInfo(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		memberDTO = memberService.getCheckInfo(memberDTO);
		
		model.addAttribute("member	", memberDTO);
		
		return "/mypage/checkInfo";
	}
	
	@GetMapping("memberUpdate")
	public String setUpdate() throws Exception {
		
		return "/mypage/memberUpdate";
	}
	@PostMapping("memberUpdate")
	public String setUpdate(MemberDTO memDTO) throws Exception {
		int result = memberService.setUpdate(memDTO);
		
		return "redirect:/mypage/info";
	}
	
	@PostMapping("delete")
	public String setDelete(MemberDTO memDTO, HttpSession session) throws Exception{
		memberService.setDelete(memDTO);
		session.invalidate();
		System.out.println(memDTO.getId());
		
		return "redirect:/";
	}
	
}
