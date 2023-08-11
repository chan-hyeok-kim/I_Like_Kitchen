package com.iu.main.bankBook.bookAccount;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.main.member.MemberDTO;
import com.iu.main.util.Pager;

@Controller
@RequestMapping("/bookAccount/*")
public class BookAccountController {
	@Autowired
	private BookAccountService bookAccountService;
	
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager,HttpSession session)throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<BookAccountDTO> ar = bookAccountService.getList(memberDTO, pager);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		mv.setViewName("bookAccount/list");
		
		return mv;
		
	}
	
	@GetMapping(value = "add")
	public void setAdd(BookAccountDTO bookAccountDTO, Model model)throws Exception{
		model.addAttribute("dto", bookAccountDTO);
	}
	
	@PostMapping(value = "add")
	public String setAdd(BookAccountDTO bookAccountDTO, HttpSession session, Model model)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		bookAccountDTO.setId(memberDTO.getId());
		int result = bookAccountService.setAdd(bookAccountDTO);
		
//		String message="상품가입이 실패";
//		
//		if(result>0) {
//			message="상품가입이 완료";
//		}
//		
//		model.addAttribute("message", message);
//		model.addAttribute("url", "../");
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
		
		
	}

}
