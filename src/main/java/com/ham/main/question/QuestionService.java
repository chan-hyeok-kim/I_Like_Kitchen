package com.ham.main.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.util.Pager;

@Service
public class QuestionService {

 @Autowired
 private QuestionDAO questionDAO;
 
 
 	public List<QuestionDTO> list(Pager pager) throws Exception {
 		pager.makeRowNum();
		pager.makePageNum(questionDAO.getTotal(pager));
  	
		return questionDAO.list(pager);
    }
 	public List<QuestionDTO> myList() throws Exception { 
		  
	 return questionDAO.myList();
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

	
}
