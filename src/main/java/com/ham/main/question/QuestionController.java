package com.ham.main.question;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.ProductService;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/question/*")
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, Pager pager, QuestionDTO questionDTO) throws Exception {

		List<QuestionDTO> list = questionService.list(pager,questionDTO);
	
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);

	}



//게시물 작성 폼
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void Add(QuestionDTO questionDTO, Model model) throws Exception {
		model.addAttribute("kto", questionDTO);
	}

//게시물 작성
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String Add(QuestionDTO questionDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		questionDTO.setId(memberDTO.getId());
		System.out.println(questionDTO);
		questionService.add(questionDTO);

		return "redirect:/product/detail?productNum=" + questionDTO.getProductNum();

	}

	// 게시물 조회
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void getDetail(QuestionDTO questionDTO, Model model) throws Exception {

		questionDTO = questionService.getDetail(questionDTO);
		model.addAttribute("kto", questionDTO);
	}

	// 게시물 수정 폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void getUpdate(QuestionDTO questionDTO, Model model) throws Exception {

		questionDTO = questionService.getDetail(questionDTO);
		model.addAttribute("kto", questionDTO);
	}

	// 게시물 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String postUpdate(QuestionDTO questionDTO) throws Exception {
		questionService.update(questionDTO);
		System.out.println(questionDTO);
		questionDTO = questionService.getDetail(questionDTO);
		System.out.println(questionDTO);
		return "redirect:/product/detail?productNum=" + questionDTO.getProductNum();

	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(QuestionDTO questionDTO) throws Exception {
		questionDTO = questionService.getDetail(questionDTO);
		long productNum = questionDTO.getProductNum();
		questionService.delete(questionDTO);

		return "redirect:/product/detail?productNum=" + productNum;

	}

}
