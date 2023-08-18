package com.ham.main.product.book;

import org.springframework.stereotype.Service;

@Service
public class BookService {
	
	private BookDAO bookDAO;
	
	public int setBook(BookDTO bookDTO) throws Exception{
		return bookDAO.setBook(bookDTO);
	}

}
