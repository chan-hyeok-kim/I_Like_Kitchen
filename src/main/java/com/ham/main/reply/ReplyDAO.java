package com.ham.main.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	private SqlSession sql;
	
	private static String namespace = "com.ham.main.reply";
	
	public ReplyDTO list(Long reviewNum)throws Exception{
		return (ReplyDTO) sql.selectList(namespace+".replyList",reviewNum);
	}
	
	public void write(ReplyDTO replyDTO)throws Exception{
		sql.insert(namespace+".replyWrite",replyDTO);
	}
	
	public void modify(ReplyDTO replyDTO)throws Exception{
		sql.update(namespace+".replyModify",replyDTO);
	}
	
	public void delete(ReplyDTO replyDTO)throws Exception{
		sql.delete(namespace+".replyDelete",replyDTO);
	}
}
