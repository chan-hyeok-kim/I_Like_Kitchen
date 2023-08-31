package com.ham.main.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ham.main.util.Page;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	
 @RequestMapping(value = "list", method = RequestMethod.GET)
 public String getList(Model model) throws Exception {
  
	  
	  List<QuestionDTO> list = questionService.list();
	  model.addAttribute("list", list);
	  
	  return "question/list";
 }
 

//게시물 작성 폼
@RequestMapping(value = "add", method = RequestMethod.GET)
public void Add() throws Exception {
 
}
//게시물 작성
	@RequestMapping(value="add",method = RequestMethod.POST)
	public String Add(QuestionDTO questionDTO)throws Exception{
		System.out.println(questionDTO.getId());
		questionDTO.setProductNum(1L);
		questionService.add(questionDTO);

		return "redirect:/question/list";
		
	}
	// 게시물 조회
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void getView(@RequestParam("questionNum") Long questionNum, Model model) throws Exception {

		QuestionDTO questionDTO = questionService.view(questionNum);
		
		model.addAttribute("view",questionDTO);
	}
	// 게시물 수정 폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("questionNum") long questionNum, Model model) throws Exception {

	 QuestionDTO questionDTO = questionService.view(questionNum);
	   
	 model.addAttribute("view", questionDTO);
	}
	// 게시물 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String postUpdate(QuestionDTO questionDTO) throws Exception {

	 questionService.update(questionDTO);
	   
	 return "redirect:/question/list";
	 		//view?questionNum=" + questionDTO.getQuestionNum();
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("questionNum") long questionNum) throws Exception {
	  
	 questionService.delete(questionNum);
	
	 return "redirect:/question/list";
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listpage", method = RequestMethod.GET)
	public void getListPage(Model model) throws Exception {
	  
	 List<QuestionDTO> list = null; 
	 list = questionService.list();
	 model.addAttribute("list", list);   
	}
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
	 
		Page page= new Page();
		
		page.setNum(num);
		page.setCount(questionService.count());  

		List<QuestionDTO> list = null; 
		list = questionService.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
//		model.addAttribute("pageNum", page.getPageNum());
//
//		model.addAttribute("startPageNum", page.getStartPageNum());
//		model.addAttribute("endPageNum", page.getEndPageNum());
//		 
//		  model.addAttribute("prev", page.isPrev());
//		model.addAttribute("next", page.isNext());  
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	 // 게시물 총 갯수
	 int count = questionService.count();
	  
	 // 한 페이지에 출력할 게시물 갯수
	 int postNum = 10;
	  
	 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	 int pageNum = (int)Math.ceil((double)count/postNum);
	  
	 // 출력할 게시물
	 int displayPost = (num - 1) * postNum;
	    
	// 한번에 표시할 페이징 번호의 갯수
	 int pageNum_cnt = 10;

	 // 표시되는 페이지 번호 중 마지막 번호
	 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);

	 // 표시되는 페이지 번호 중 첫번째 번호
	 int startPageNum = endPageNum - (pageNum_cnt - 1);
	 
	// 마지막 번호 재계산
	 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
	  
	 if(endPageNum > endPageNum_tmp) {
	  endPageNum = endPageNum_tmp;
	 }
	 
	 boolean prev = startPageNum == 1 ? false : true;
	 boolean next = endPageNum * pageNum_cnt >= count ? false : true;
	 
	 List<QuestionDTO> list1 = null; 
	 list1 = questionService.listPage(displayPost, postNum);
	 model.addAttribute("list", list1);   
	 model.addAttribute("pageNum", pageNum);
	
	// 시작 및 끝 번호
	model.addAttribute("startPageNum", startPageNum);
	model.addAttribute("endPageNum", endPageNum);

	// 이전 및 다음 
	model.addAttribute("prev", prev);
	model.addAttribute("next", next);
	
	// 현재 페이지
	model.addAttribute("select", num);
	}
}