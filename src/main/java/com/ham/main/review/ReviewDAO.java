package com.ham.main.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sql;
 
 	private final String NAMESPACE="com.ham.main.review.ReviewDAO.";

 	public ReviewFileDTO getFIleDetail(ReviewFileDTO reviewFileDTO) {
		return sql.selectOne(NAMESPACE+"getFIleDetail",reviewFileDTO);
	}
 	
	public int setFileDelete(ReviewFileDTO reviewFilefileNum) throws Exception{
		return sql.delete(NAMESPACE+"setFileDelete",reviewFilefileNum);
	}
 // 게시물 목록
 
 	public List<ReviewDTO> list() throws Exception { 
  
	 return sql.selectList(NAMESPACE + "list");
 	}

//게시물 작성
 	public int add(ReviewDTO reviewDTO) throws Exception{

	return sql.insert(NAMESPACE+"add",reviewDTO);
	}

//게시물 조회
	public ReviewDTO view(long reviewNum) throws Exception {

	return sql.selectOne(NAMESPACE + "view", reviewNum);

 }
	
	// 게시물 수정
	
	public int update(ReviewDTO reviewDTO) throws Exception {
	return sql.update(NAMESPACE + "update", reviewDTO);
	}
	// 게시물 삭제
	public int delete(long reviewNum) throws Exception {
	return sql.delete(NAMESPACE + "delete", reviewNum);
	}
	// 게시물 총 갯수
	
	public int count() throws Exception {
	 return sql.selectOne(NAMESPACE + "count"); 
	}
	// 게시물 목록 + 페이징
	
	public List<ReviewDTO> listPage(int displayPost, int postNum) throws Exception {

	 HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sql.selectList(NAMESPACE + "listPage", data);
	}
}
