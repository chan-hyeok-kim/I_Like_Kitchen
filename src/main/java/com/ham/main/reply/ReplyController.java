package com.ham.main.reply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	private ReplyService replyService;
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(ReplyDTO replyDTO) throws Exception {
	    
	    replyService.write(replyDTO);
	    
	    return "redirect:/board/view?bno=" + replyDTO.getReviewNum();
	}
}
