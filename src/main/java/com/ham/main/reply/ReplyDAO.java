package com.ham.main.reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	private SqlSession sql;
	
	private static String namespace = "com.ham.main.replyReplyDAO.";
	
	public ReplyDTO list(Long reviewNum)throws Exception{
		return (ReplyDTO) sql.selectList(namespace+"replyList",reviewNum);
	}
	
	public int write(ReplyDTO replyDTO)throws Exception{
		return sql.insert(namespace+"replyWrite",replyDTO);
	}
	
	public int modify(ReplyDTO replyDTO)throws Exception{
		return sql.update(namespace+"replyModify",replyDTO);
	}
	
	public int delete(long replyNum)throws Exception{
		return sql.delete(namespace+"replyDelete",replyNum);
	}

	// 단일 댓글 조회
	public ReplyDTO replySelect(ReplyDTO replyDTO) throws Exception {
	    
	    return sql.selectOne(namespace + "replySelect", replyDTO);
	}
}
