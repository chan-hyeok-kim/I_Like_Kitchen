package com.ham.main.product.book;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;
import com.ham.main.partner.PartnerDTO;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.ProductService;
import com.ham.main.util.Pager;


@Controller
@RequestMapping("/book/*")
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
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
	public void getBookInfo(MemberDTO memberDTO,Model model, Pager pager) throws Exception{
		 System.out.println(pager);
		 pager.setStartRow(1L);
		 pager.setLastRow(2L);
		 List<BookDTO> bl = bookService.getBookInfo(memberDTO, pager);

		 List<ProductDTO> pl = new ArrayList<ProductDTO>();
		
		 for(BookDTO b: bl) {
			
			if(Integer.parseInt(b.getBookCheck())>0) {
				b.setBookCheck("승인");
			}else {
				b.setBookCheck("미승인");
			}
				
			 ProductDTO productDTO = new ProductDTO();
			 productDTO.setProductNum(b.getProductNum());
			 
			 productDTO = productService.getDetail(productDTO);
			 if(productDTO!=null) {
			    pl.add(productDTO);
			 }
		 }
		 System.out.println(pl);
		 System.out.println(pl.size());
		 model.addAttribute("list", bl);
		 model.addAttribute("productList", pl);
		 model.addAttribute("pager", pager);
	}
	
	
	@GetMapping("manage")
    public void bookManage(HttpSession session,Model model) throws Exception{
		PartnerDTO partnerDTO = (PartnerDTO)session.getAttribute("partner");
		
		
		List<ProductDTO> pl = productService.getInfo(partnerDTO);
		List<BookDTO> newBl = new ArrayList<BookDTO>();
		for(ProductDTO p: pl) {
			List<BookDTO> bl = bookService.getBook(p);
            for(BookDTO b: bl) {
            	newBl.add(b);
            }
		 
			model.addAttribute("list",newBl);
			
		}
		
		
		

		
	}
	
	@PostMapping("checklist")
	public void getChecklist(String clickDay,HttpSession session,Model model) throws Exception{
        PartnerDTO partnerDTO = (PartnerDTO)session.getAttribute("partner");
		
		
		List<ProductDTO> pl = productService.getInfo(partnerDTO);
//		가져온 자료 담아둘 애들 객체 생성 
		List<ProductDTO> newPl = new ArrayList<ProductDTO>();
		List<BookDTO> newBl = new ArrayList<BookDTO>();
		for(ProductDTO p: pl) {
			List<BookDTO> bl = bookService.getBook(p);
		  
		    for(BookDTO b: bl) {
			if(Integer.parseInt(b.getBookCheck())>0) {
				b.setBookCheck("승인");
			}else {
				b.setBookCheck("미승인");
			}
			newBl.add(b);
                ProductDTO productDTO = new ProductDTO();
                productDTO.setProductNum(b.getProductNum());
                newPl.add(productService.getDetail(productDTO));
			}
			
			if(bl.size()!=0) {
	        	model.addAttribute("bookList", newBl);
	        	model.addAttribute("productList", newPl);
		}
		  
        
        }
       
	}
	
	@ResponseBody
	@PostMapping("getAjaxEvent")
	public Object getAjaxEvent(HttpSession session,Model model) throws Exception{
        PartnerDTO partnerDTO = (PartnerDTO)session.getAttribute("partner");
		
        
		List<ProductDTO> pl = productService.getInfo(partnerDTO);
//		가져온 자료 담아둘 애들 객체 생성 
		List<ProductDTO> newPl = new ArrayList<ProductDTO>();
		List<BookDTO> newBl = new ArrayList<BookDTO>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map> eventList = new ArrayList<Map>(); 
		for(ProductDTO p: pl) {
			List<BookDTO> bl = bookService.getBook(p);
		  

		    for(BookDTO b: bl) {
			    if(Integer.parseInt(b.getBookCheck())>0) {
			     	b.setBookCheck("승인");
		     	}else {
			     	b.setBookCheck("미승인");
			    }
			    newBl.add(b);
                    ProductDTO productDTO = new ProductDTO();
                    productDTO.setProductNum(b.getProductNum());
                    newPl.add(productService.getDetail(productDTO));
                    
                map.put("id",b.getId());
                map.put("start",b.getStartTime());
                map.put("end", b.getEndTime());
//                map.put("color", "#778899");
                eventList.add(map);
                System.out.println(eventList);
//                model.addAttribute("result", eventList);     
			}
		
//			if(bl.size()!=0) {
//	        	model.addAttribute("bookList", newBl);
//	        	model.addAttribute("productList", newPl);
//		    }  
		    System.out.println(eventList);
        }
       
        return eventList;
	}
	
	
	@PostMapping("bookCheck")
	public void setBookCheck(BookDTO bookDTO) throws Exception{
		  bookService.setBookCheck(bookDTO);
	}
    
}
