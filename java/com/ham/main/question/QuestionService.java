package com.ham.main.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {

 @Autowired
 private QuestionDAO questionDAO;
 
 
 	public List<QuestionDTO> list() throws Exception {

  	return questionDAO.list();
 }
//게시물 작성
	 public int add(QuestionDTO questionDTO)throws Exception{
	 
	 return questionDAO.add(questionDTO);
 }
//게시물 조회

 	public QuestionDTO view(long questionNum) throws Exception {

 	return questionDAO.view(questionNum);
}
 // 게시물 수정
 	
 	public int update(QuestionDTO questionDTO) throws Exception {
 	  
 	 return questionDAO.update(questionDTO);
 	}
 	
 // 게시물 삭제
 	public int delete(long questionNum) throws Exception {
 	 return questionDAO.delete(questionNum);
 	}
 // 게시물 총 갯수
 	
 	public int count() throws Exception {
 	 return questionDAO.count();
 	}
 // 게시물 목록 + 페이징
 	public List<QuestionDTO> listPage(int displayPost, int postNum) throws Exception {
 	 return questionDAO.listPage(displayPost, postNum);
 	}

	
}
