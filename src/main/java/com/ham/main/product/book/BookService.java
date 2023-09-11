package com.ham.main.product.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.pay.PayDAO;
import com.ham.main.product.pay.PayDTO;
import com.ham.main.util.Pager;

@Service
public class BookService {
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private PayDAO payDAO;
	
	public int setBook(BookDTO bookDTO) throws Exception{
		return bookDAO.setBook(bookDTO);
	}

	public BookDTO getDetail(BookDTO bookDTO) throws Exception{
		return bookDAO.getDetail(bookDTO);
	}
	
	public List<BookDTO> getBookInfo(MemberDTO memberDTO,Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(bookDAO.getInfoTotal(memberDTO));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", memberDTO);
		map.put("pager", pager);
		
		memberDTO = (MemberDTO) map.get("member");
		System.out.println(memberDTO);
		return bookDAO.getBookInfo(map);
	}
	
	public List<BookDTO> getBook(ProductDTO productDTO) throws Exception{
		return bookDAO.getBook(productDTO);
	}
	
	public int setBookCheck(BookDTO bookDTO) throws Exception{
		return bookDAO.setBookCheck(bookDTO);
	}
	
	public List<BookDTO> getBookTime(BookDTO bookDTO) throws Exception{
		return bookDAO.getBookTime(bookDTO);
	}
	
	/*
	 * public List<BookDTO> getBookInfo(MemberDTO memberDTO,PayDTO payDTO, Pager
	 * pager) throws Exception{ pager.makeRowNum();
	 * pager.makePageNum(payDAO.getPayTotal(payDTO));
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>(); map.put("member",
	 * memberDTO); map.put("pager", pager);
	 * 
	 * memberDTO = (MemberDTO) map.get("member"); System.out.println(memberDTO);
	 * return bookDAO.getBookInfo(map); }
	 */
	
}
