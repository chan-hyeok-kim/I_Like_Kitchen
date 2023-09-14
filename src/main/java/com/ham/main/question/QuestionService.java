package com.ham.main.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.util.Pager;

@Service
public class QuestionService {

 @Autowired
 private QuestionDAO questionDAO;
 
 
 	public List<QuestionDTO> list(Pager pager,QuestionDTO questionDTO) throws Exception {
 		pager.makeRowNum();
		pager.makePageNum(questionDAO.getTotal(questionDTO));
  	     
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("kto", questionDTO);
		
		return questionDAO.list(map);
    }
 	
 	public List<QuestionDTO> myList(QuestionDTO questionDTO, Pager pager) throws Exception { 
 		pager.makeRowNum();
 		System.out.println(questionDTO.getId());
		pager.makePageNum(questionDAO.getMyQuestionTotal(questionDTO));
  	    
		System.out.println(questionDTO.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("kto", questionDTO);
	    return questionDAO.myList(map);
 	}
//게시물 작성
	 public int add(QuestionDTO questionDTO)throws Exception{
	 
	 return questionDAO.add(questionDTO);
 }
//게시물 조회

 	public QuestionDTO getDetail(QuestionDTO questionDTO) throws Exception {
 	       return questionDAO.getDetail(questionDTO);
    }
 // 게시물 수정
 	
 	public int update(QuestionDTO questionDTO) throws Exception {
 	  
 	 return questionDAO.update(questionDTO);
 	}
 	
 // 게시물 삭제
 	public int delete(QuestionDTO questionDTO) throws Exception {
 	   return questionDAO.delete(questionDTO);
 	}

	
}
