package com.ham.main.product.book;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.ProductDTO;

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
	
	public List<BookDTO> getBookInfo(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBookInfo", map);
	}
	
	public List<BookDTO> getBook(ProductDTO productDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBook", productDTO);
	}
	
	public long getInfoTotal(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getInfoTotal", memberDTO);
	}
	
	public int setBookCheck(BookDTO bookDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setBookCheck", bookDTO);
	}
	
	public List<BookDTO> getBookTime(BookDTO bookDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBookTime", bookDTO);
	}

}
