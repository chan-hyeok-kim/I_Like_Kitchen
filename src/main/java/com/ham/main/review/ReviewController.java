package com.ham.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.reply.ReplyDTO;
import com.ham.main.reply.ReplyService;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
 @RequestMapping(value = "list", method = RequestMethod.GET)
 public String getList(Model model,Pager pager) throws Exception {
  
	
	  List<ReviewDTO> list = reviewService.list(pager);
	  model.addAttribute("list", list);
	  model.addAttribute("Pager",pager);
	  
	  
	  return "review/list";
 }


	
	@GetMapping("fileDelete")
	public String setFileDelete(ReviewFileDTO reviewFileDTO, HttpSession session ,Model model)throws Exception{
		int result = reviewService.setFileDelete(reviewFileDTO, session);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
		
	}
//게시물 작성 폼
@RequestMapping(value = "add", method = RequestMethod.GET)
public void getAdd() throws Exception {
 
}
//게시물 작성
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String postAdd(ReviewDTO reviewDTO, MultipartFile[] photos, HttpSession session, Model model)throws Exception{
		reviewDTO.setProductNum(2L);
		reviewService.add(reviewDTO,photos,session,model);
		
		return "redirect:/review/list";
		
	}
	// 게시물 조회
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void getView(@RequestParam("reviewNum") Long reviewNum, Model model) throws Exception {

		ReviewDTO reviewDTO = reviewService.view(reviewNum);
		
		model.addAttribute("view",reviewDTO);
		
		
		// 댓글 조회
		
	
		
	  List<ReviewDTO> replyDTO = reviewService.list(reviewNum);
	  model.addAttribute("reply",replyDTO);
	 
		 
	}
	// 게시물 수정 폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("reviewNum") long reviewNum, Model model) throws Exception {

	 ReviewDTO reviewDTO = reviewService.view(reviewNum);
	   
	 model.addAttribute("view", reviewDTO);
	}
	// 게시물 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String postUpdate(ReviewDTO reviewDTO) throws Exception {
    
	 int result= reviewService.update(reviewDTO);
	   
	 return "redirect:/review/list";
	}
	// 게시물 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("reviewNum") long reviewNum) throws Exception {
	  
	 reviewService.delete(reviewNum);  

	 return "redirect:/review/list";
	}
	
	

}