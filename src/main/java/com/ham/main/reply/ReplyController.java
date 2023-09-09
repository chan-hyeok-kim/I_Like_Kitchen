package com.ham.main.reply;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	private ReplyService replyService;
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWirte(ReplyDTO replyDTO) throws Exception {
		
		replyDTO.setReviewNum(24L);
		replyService.write(replyDTO);

	    return "redirect:/review/view?reviewNUm=" + replyDTO.getReviewNum();
	}
	// 댓글 단일 조회 (수정 페이지)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getMofidy(@RequestParam("replyNum") long replyNum, @RequestParam("reviewNum") long reviewNum, Model model) throws Exception {
	    
	    ReplyDTO replyDTO = new ReplyDTO();
	    replyDTO.setReplyNum(replyNum);
	    replyDTO.setReviewNum(reviewNum);
	    
	    ReplyDTO reply = replyService.replySelect(replyDTO);
	         
	    model.addAttribute("reply", reply);
	}
	// 댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(ReplyDTO replyDTO) throws Exception {
		replyDTO.setReviewNum(20L);
	    replyService.modify(replyDTO);

	    return "redirect:/board/view?bno=" + replyDTO.getReplyNum();
	}
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("replyNum") long replyNum) throws Exception {
	  
	 replyService.delete(replyNum);
	
	 return "redirect:/question/list";
	}
}
