package com.ham.main.member.mypage;

import java.util.ArrayList;
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
import com.ham.main.product.book.BookDTO;
import com.ham.main.product.book.BookService;
import com.ham.main.product.pay.PayDTO;
import com.ham.main.product.pay.PayService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private PayService payService;
	
  	@GetMapping("onGoing")
	public String getOnGoing(HttpSession session,Model model) throws Exception{
  		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
  		BookDTO bookDTO = new BookDTO();
		bookDTO.setId(memberDTO.getId()); 
		
  		List<BookDTO> bl = bookService.getBookInfo(bookDTO);
		
        if(bl.size()!=0) {
        	model.addAttribute("list", bl);
        }
        
		return "/mypage/onGoing";
	}
	
  	@GetMapping("complete")
	public String getComplete(HttpSession session,Model model) throws Exception{
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		BookDTO bookDTO = new BookDTO();
		bookDTO.setId(memberDTO.getId()); 
		
		List<BookDTO> bl = bookService.getBookInfo(bookDTO);
		
		List<PayDTO> pl = new ArrayList<PayDTO>();
		for(BookDTO b: bl) {
			PayDTO payDTO = new PayDTO();
			payDTO.setBookNum(b.getBookNum()); 
			payDTO = payService.getPayInfo(payDTO);	
			if(payDTO!=null) {
				System.out.println(payDTO);
				pl.add(payDTO);
			}
		}
		
		if(pl.size()!=0) {
			model.addAttribute("payList", pl);
		}
		
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
	public String getInfo(MemberDTO memberDTO, HttpSession session) throws Exception{
		memberDTO = (MemberDTO) session.getAttribute("member");

		memberDTO = memberService.getCheckInfo(memberDTO);
		
		session.setAttribute("member", memberDTO);
		
		return "/mypage/info";
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
