package com.ham.main.product.book;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;
import java.time.LocalTime;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.ProductService;


@Controller
@RequestMapping("/book/*")
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private ProductService productService;
	
	@GetMapping("add")
	public void setBook(ProductDTO productDTO, Model model) throws Exception {
            model.addAttribute("kto",productDTO);
	}

	@PostMapping("add")
	public String setBook(BookDTO bookDTO,HttpSession session,Model model, String start, String end) throws Exception {
            MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		   
            bookDTO.setId(memberDTO.getId());
            
            Date date=bookDTO.getBookDate();
            SimpleDateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
            
            String str=dfm.format(date);
            System.out.println(str);
            
            start=str+" "+start;
            end=str+" "+end;
            SimpleDateFormat sfm = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date startHour = sfm.parse(start);
            Date endHour = sfm.parse(end);
            System.out.println(startHour);
            System.out.println(endHour);
           
            java.sql.Date startHour2=new java.sql.Date(startHour.getTime());
            java.sql.Date endHour2=new java.sql.Date(endHour.getTime());
            bookDTO.setStartTime(startHour2);
            bookDTO.setEndTime(endHour2);
            
            int result = bookService.setBook(bookDTO);
            
            model.addAttribute("result", result);
            System.out.println(result);
            return "commons/ajaxResult";
	}
	
	@GetMapping("detail")
	public void getDetail(Model model, HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		BookDTO bookDTO = new BookDTO();
		bookDTO.setId(memberDTO.getId());
		bookDTO = bookService.getDetail(bookDTO);
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(bookDTO.getProductNum());
		productDTO = productService.getDetail(productDTO);
		model.addAttribute("kto",bookDTO);
		model.addAttribute("product", productDTO);
		
//		model.addAttribute("member", memberDTO);
	
	}
	
	@GetMapping("list")
	public void getList(BookDTO bookDTO,Model model) throws Exception{
		 List<BookDTO> bl = bookService.getList(bookDTO);
//		 상품조회추가
		 model.addAttribute("list", bl);
		 
	}
	

}
