package com.ham.main.product.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
	
	@Autowired
	private BookDAO bookDAO;
	
	public int setBook(BookDTO bookDTO) throws Exception{
		return bookDAO.setBook(bookDTO);
	}

}
