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
import com.ham.main.util.Page;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
 @RequestMapping(value = "list", method = RequestMethod.GET)
 public String getList(Model model) throws Exception {
  
	
	  List<ReviewDTO> list = reviewService.list();
	  model.addAttribute("list", list);
	  
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
		
		ReplyDTO replyDTO = ReplyService.list(reviewNum);
		model.addAttribute("reply", replyDTO);
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
    System.out.println(reviewDTO.getReviewContents());
	 int result= reviewService.update(reviewDTO);
	   System.out.println(result);
	 return "redirect:/review/list";
	}
	// 게시물 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("reviewNum") long reviewNum) throws Exception {
	  
	 reviewService.delete(reviewNum);  

	 return "redirect:/review/list";
	}
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
	 
		Page page =new Page();
		
		page.setNum(num);
		page.setCount(reviewService.count());  

		List<ReviewDTO> list = null; 
		list = reviewService.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		
		model.addAttribute("select", num);
//	 // 게시물 총 갯수
//	 int count = Integer.parseInt(String.valueOf(reviewService.count()));
//	  
//	 // 한 페이지에 출력할 게시물 갯수
//	 int postNum = 10;
//	  
//	 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
//	 int pageNum = (int)Math.ceil((double)count/postNum);
//	  
//	 // 출력할 게시물
//	 int displayPost = (num - 1) * postNum;
//	    
//	// 한번에 표시할 페이징 번호의 갯수
//	 int pageNum_cnt = 10;
//
//	 // 표시되는 페이지 번호 중 마지막 번호
//	 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
//
//	 // 표시되는 페이지 번호 중 첫번째 번호
//	 int startPageNum = endPageNum - (pageNum_cnt - 1);
//
//	// 마지막 번호 재계산
//	 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
//	  
//	 if(endPageNum > endPageNum_tmp) {
//	  endPageNum = endPageNum_tmp;
//	 }
//	 boolean prev = startPageNum == 1 ? false : true;
//	 boolean next = endPageNum * pageNum_cnt >= count ? false : true;
//	 
//	 
//	 
//	 List<ReviewDTO> list = null; 
//	 list = reviewService.listPage(displayPost, postNum);
//	 model.addAttribute("list", list);   
//	 model.addAttribute("pageNum", pageNum);
//	
//	// 시작 및 끝 번호
//	 model.addAttribute("startPageNum", startPageNum);
//	 model.addAttribute("endPageNum", endPageNum);
//
//	 // 이전 및 다음 
//	 model.addAttribute("prev", prev);
//	 model.addAttribute("next", next);
//	
//	// 현재 페이지
//	 model.addAttribute("select", num);
	}
	

}