package com.ham.main.reply;

import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	private static ReplyDAO dao;
	
	public static  ReplyDTO list(Long reviewNum) throws Exception{
	 return dao.list(reviewNum);
	}

	public int write(ReplyDTO replyDTO)throws Exception{
		return dao.write(replyDTO);
	}
	
	public int modify(ReplyDTO replyDTO)throws Exception{
		return dao.modify(replyDTO);
	}
	public int delete(long replyNum)throws Exception{
		return dao.delete(replyNum);
	}
	// 단일 댓글 조회
	
	public ReplyDTO replySelect(ReplyDTO replyDTO) throws Exception {
	    return dao.replySelect(replyDTO);
	}
}
