package com.ham.main.question;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.util.Pager;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSession sql;
 
 	private final String NAMESPACE="com.ham.main.question.QuestionDAO.";


 	// 게시물 목록
 
 	public List<QuestionDTO> list(Pager pager) throws Exception { 
  
	 return sql.selectList(NAMESPACE + "list",pager);
 	}
 	public List<QuestionDTO> myList() throws Exception { 
 		  
	 return sql.selectList(NAMESPACE + "myList");
 	}

//게시물 작성
 	public int add(QuestionDTO questionDTO) throws Exception{

	return sql.insert(NAMESPACE+"add",questionDTO);
	}

//게시물 조회
	public QuestionDTO getDetail(QuestionDTO questionDTO) throws Exception {

	return sql.selectOne(NAMESPACE + "getDetail", questionDTO);

 }
	
	// 게시물 수정
	
	public int update(QuestionDTO questionDTO) throws Exception {
	 return sql.update(NAMESPACE + "update", questionDTO);
	}
	// 게시물 삭제
	public int delete(QuestionDTO questionDTO) throws Exception {
	 return sql.delete(NAMESPACE + "delete", questionDTO);
	}
	
	
	

		public Long getTotal(Pager pager) {
		
		return sql.selectOne(NAMESPACE + "getTotal");
	}

}
