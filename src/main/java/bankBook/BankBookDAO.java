package com.iu.main.bankBook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.main.bankBook.comment.CommentDTO;
import com.iu.main.util.Pager;

@Repository //해당 클래스의 객체 생성
public class BankBookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.iu.main.bankBook.BankBookDAO.";
	//------- Comment
	public long getCommentTotal(CommentDTO commentDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCommentTotal", commentDTO);
	}
	public List<CommentDTO> getCommentList(Map<String, Object> map)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCommentList", map);
	}
	
	public int setCommentAdd(CommentDTO commentDTO)throws Exception{
		return 0;
	}
	
	//------- BankBook
	//total
	public Long getTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	} 
	
	//List
	public List<BankBookDTO> getList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}
	
	//detail
	public BankBookDTO getDetail(BankBookDTO bankBookDTO)throws Exception{
				
		return sqlSession.selectOne(NAMESPACE+"getDetail", bankBookDTO);
	}
	
	public long getSequence()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSequence");
	}
	
	//add
	public int setAdd(BankBookDTO bankBookDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdd", bankBookDTO);
	}
	
	public int setFileAdd(BankBookFileDTO bankBookFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileAdd", bankBookFileDTO);
	}
	
	//update
	public int setUpdate(BankBookDTO bankBookDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", bankBookDTO);
	}
	
	//delete
	public int setDelete(Long num)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}

}
