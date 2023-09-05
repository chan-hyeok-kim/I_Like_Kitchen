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

 	public ReviewFileDTO getFileDetail(ReviewFileDTO reviewFileDTO) throws Exception {
		return sql.selectOne(NAMESPACE+"getFIleDetail",reviewFileDTO);
	}
 	
	public int setFileDelete(ReviewFileDTO reviewFileDTO) throws Exception{
		return sql.delete(NAMESPACE+"setFileDelete",reviewFileDTO);
	}
	public int setFileAdd(ReviewFileDTO reviewFileDTO)throws Exception{
		return sql.insert(NAMESPACE+"setFileAdd", reviewFileDTO);
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
	public ReviewDTO view(Long reviewNum) throws Exception {

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
	
	public int setReplyAdd(ReviewDTO reviewDTO)throws Exception{
		System.out.println("setReplyAdd");
		return sql.insert(NAMESPACE+"setReplyAdd", reviewDTO);
	}
	
	// 게시물 총 갯수
	
	public String count() throws Exception {
	 return String.valueOf(sql.selectOne(NAMESPACE + "count")); 
	}
	// 게시물 목록 + 페이징
	
	public List<ReviewDTO> listPage(int displayPost, int postNum) throws Exception {

	 HashMap data = new HashMap();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sql.selectList(NAMESPACE + "listPage", data);
	}
}
