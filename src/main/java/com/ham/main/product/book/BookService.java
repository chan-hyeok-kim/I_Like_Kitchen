package com.ham.main.product.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
	
	@Autowired
	private BookDAO bookDAO;
	
	public int setBook(BookDTO bookDTO) throws Exception{
		return bookDAO.setBook(bookDTO);
	}

	public BookDTO getDetail(BookDTO bookDTO) throws Exception{
		return bookDAO.getDetail(bookDTO);
	}
	
	public List<BookDTO> getList(BookDTO bookDTO) throws Exception{
		return bookDAO.getList(bookDTO);
	}
}
