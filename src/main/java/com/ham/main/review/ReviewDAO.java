package com.ham.main.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.product.book.BookDTO;
import com.ham.main.util.Pager;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sql;

	private final String NAMESPACE = "com.ham.main.review.ReviewDAO.";

	// 게시물 목록

	public List<ReviewDTO> myList(Map<String, Object> map) throws Exception {

		return sql.selectList(NAMESPACE + "myList", map);
	}

	public List<ReviewDTO> list(Map<String, Object> map) throws Exception {

		return sql.selectList(NAMESPACE + "list", map);
	}

//게시물 작성
	public int add(ReviewDTO reviewDTO) throws Exception {

		return sql.insert(NAMESPACE + "add", reviewDTO);
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



	public Long getTotal(ReviewDTO reviewDTO) {
		return sql.selectOne(NAMESPACE + "getTotal", reviewDTO);
	}

	// file(파일)
	public int setFileAdd(ReviewFileDTO reviewFileDTO) throws Exception {

		return sql.insert(NAMESPACE + "setFileAdd", reviewFileDTO);
	}

	public ReviewFileDTO getFileDetail(ReviewFileDTO reviewFileDTO) {

		return sql.selectOne(NAMESPACE + "getFileDetail", reviewFileDTO);
	}

	public int setFileDelete(ReviewFileDTO reviewFileDTO) throws Exception {

		return sql.delete(NAMESPACE + "setFileDelete", reviewFileDTO);
	}

	public Long getMyReviewTotal(ReviewDTO reviewDTO) throws Exception {
		return sql.selectOne(NAMESPACE + "getMyReviewTotal", reviewDTO);
	}
	
	public Long getReviewPermit(BookDTO bookDTO) throws Exception{
		return sql.selectOne(NAMESPACE + "getReviewPermit", bookDTO);
	}

}
