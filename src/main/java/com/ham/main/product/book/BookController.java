package com.ham.main.product.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book/*")
public class BookController {

	private BookService bookService;

	@GetMapping("add")
	public void setBook() throws Exception {

	}

//	@PostMapping("add")
//	public int setBook(BookDTO bookDTO) throws Exception {
//
//	}

}
