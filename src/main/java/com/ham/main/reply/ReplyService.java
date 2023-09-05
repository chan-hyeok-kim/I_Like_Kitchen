package com.ham.main.reply;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	private static ReplyDAO dao;
	
	public static ReplyDTO list(Long reviewNum) throws Exception{
		return dao.list(reviewNum);
	}
	
	public void write(ReplyDTO replyDTO)throws Exception{
		dao.write(replyDTO);
	}
	
	public void modify(ReplyDTO replyDTO)throws Exception{
		dao.modify(replyDTO);
	}
	public void delete(ReplyDTO replyDTO)throws Exception{
		dao.delete(replyDTO);
	}
}
