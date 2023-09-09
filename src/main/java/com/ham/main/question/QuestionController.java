package com.ham.main.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	
 @RequestMapping(value = "list", method = RequestMethod.GET)
 public String getList(Model model,Pager pager) throws Exception {
  
	  
	  List<QuestionDTO> list = questionService.list(pager);
	  model.addAttribute("list", list);
	  model.addAttribute("Pager",pager);
	  
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
		questionDTO.setProductNum(2L);
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
	

}
