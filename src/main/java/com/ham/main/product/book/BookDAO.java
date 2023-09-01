package com.ham.main.product.book;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.ham.main.product.book.BookDAO.";
	
	public int setBook(BookDTO bookDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setBook",bookDTO);
	}
	
	public BookDTO getDetail(BookDTO bookDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", bookDTO);
	}

}
