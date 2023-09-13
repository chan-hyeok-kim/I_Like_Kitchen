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

import com.ham.main.member.MemberDTO;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Model model, Pager pager) throws Exception {

		List<ReviewDTO> list = reviewService.list(pager);
		model.addAttribute("list", list);
		model.addAttribute("Pager", pager);

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

		model.addAttribute("view", reviewDTO);

		// 댓글 조회

		List<ReviewDTO> replyDTO = reviewService.list(reviewNum);
		model.addAttribute("reply", replyDTO);

	}

	// 게시물 수정 폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String getUpdate(@RequestParam("reviewNum") Long reviewNum, Model model) throws Exception {

		ReviewDTO reviewDTO = reviewService.view(reviewNum);

		model.addAttribute("view", reviewDTO);

		return "/review/update";
	}

	// 게시물 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		reviewDTO.setId(memberDTO.getId());
		reviewService.update(reviewDTO, files, session);

		return "redirect:/review/view?reviewNum=" + reviewDTO.getReviewNum();
	}

	// 게시물 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("reviewNum") long reviewNum) throws Exception {

		reviewService.delete(reviewNum);
        ReviewDTO reviewDTO = reviewService.view(reviewNum);
        
        return "redirect:/product/detail?productNum="+reviewDTO.getProductNum();
	}

	@GetMapping("fileDelete")
	public void setFileDelete(ReviewFileDTO reviewFileDTO, HttpSession session) throws Exception {
		reviewService.setFileDelete(reviewFileDTO, session);
	}

}