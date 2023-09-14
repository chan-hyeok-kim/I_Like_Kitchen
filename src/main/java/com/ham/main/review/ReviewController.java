package com.ham.main.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.member.MemberDTO;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.product.book.BookDTO;
import com.ham.main.product.book.BookService;
import com.ham.main.question.QuestionDTO;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Model model, Pager pager,ReviewDTO reviewDTO) throws Exception {

		List<ReviewDTO> list = reviewService.list(pager, reviewDTO);
		model.addAttribute("list", list);
		model.addAttribute("rPager", pager);

		
		return "review/list";
	}

//게시물 작성 폼
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void getAdd(ReviewDTO reviewDTO,Model model) throws Exception {
              model.addAttribute("kto", reviewDTO);
	}

//게시물 작성
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String postAdd(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		reviewDTO.setId(memberDTO.getId());	
		reviewService.setAdd(reviewDTO, files, session);

		return "redirect:/product/detail?productNum="+reviewDTO.getProductNum();

	}

	// 게시물 조회
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void getView(@RequestParam("reviewNum") Long reviewNum, Model model) throws Exception {

		ReviewDTO reviewDTO = reviewService.view(reviewNum);

		model.addAttribute("kto", reviewDTO);

	
	}

	// 게시물 수정 폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String getUpdate(@RequestParam("reviewNum") Long reviewNum, Model model) throws Exception {

		ReviewDTO reviewDTO = reviewService.view(reviewNum);

		model.addAttribute("kto", reviewDTO);

		return "/review/update";
	}

	// 게시물 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		
		reviewService.update(reviewDTO, files, session);
		
		return "redirect:/product/detail?productNum=" + reviewDTO.getProductNum();	
	}

	// 게시물 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("reviewNum") long reviewNum) throws Exception {
       ReviewDTO reviewDTO = new ReviewDTO();
       reviewDTO.setReviewNum(reviewNum);
       reviewDTO = reviewService.view(reviewNum);
       
       reviewService.delete(reviewNum);
       
       return "redirect:/product/detail?productNum="+reviewDTO.getProductNum();

	}

	@GetMapping("fileDelete")
	public String setFileDelete(ReviewFileDTO reviewFileDTO, HttpSession session,Model model) throws Exception {
		int result= reviewService.setFileDelete(reviewFileDTO, session);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	  
	}
	
	@ResponseBody
	@GetMapping("reviewPermit")
	public Long getReviewPermit(HttpSession session, BookDTO bookDTO) throws Exception{
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		bookDTO.setId(memberDTO.getId());
		return reviewService.getReviewPermit(bookDTO);
	}

}