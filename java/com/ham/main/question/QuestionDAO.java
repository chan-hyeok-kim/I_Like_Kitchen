package com.ham.main.question;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSession sql;
 
 	private final String NAMESPACE="com.ham.main.question.QuestionDAO.";


 	// 게시물 목록
 
 	public List<QuestionDTO> list() throws Exception { 
  
	 return sql.selectList(NAMESPACE + "list");
 	}

//게시물 작성
 	public int add(QuestionDTO questionDTO) throws Exception{

	return sql.insert(NAMESPACE+"add",questionDTO);
	}

//게시물 조회
	public QuestionDTO view(long questionNum) throws Exception {

	return sql.selectOne(NAMESPACE + "view", questionNum);

 }
	
	// 게시물 수정
	
	public int update(QuestionDTO questionDTO) throws Exception {
	 return sql.update(NAMESPACE + "update", questionDTO);
	}
	// 게시물 삭제
	public int delete(long questionNum) throws Exception {
	 return sql.delete(NAMESPACE + "delete", questionNum);
	}
	// 게시물 총 갯수
	
	public int count() throws Exception {
	 return sql.selectOne(NAMESPACE + "count"); 
	}
	// 게시물 목록 + 페이징
	
	public List<QuestionDTO> listPage(int displayPost, int postNum) throws Exception {

	 HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sql.selectList(NAMESPACE + "listPage", data);
	}
}
