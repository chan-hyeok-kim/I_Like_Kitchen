package com.ham.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.util.Pager;



@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Pager pager, Model model)throws Exception{
		List<ProductDTO> ar = productService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		return "product/list";
	}
	
	@RequestMapping(value = "detail")
	public ModelAndView getDetail(ProductDTO productDTO, ModelAndView mv)throws Exception{
		productDTO = productService.getDetail(productDTO);
		
		List<ProductFileDTO> fileList = productDTO.getProductFileDTOs();
		
		for(ProductFileDTO f: fileList) {
			System.out.println(f.getFileName());
			System.out.println(f.getOriginalName());
			System.out.println(f.getFileNum());
			System.out.println(f.getProductNum());
		}
			
		
		mv.addObject("dto", productDTO);
		mv.setViewName("product/detail");
		return mv;
	}
	@RequestMapping(value = "add" , method = RequestMethod.GET)
	public void setAdd()throws Exception{
		
	}
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String setAdd(ProductDTO productDTO, HttpSession session, MultipartFile[] files)throws Exception{
		
		int result = productService.setAdd(productDTO, files, session);
		return "redirect:./list";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String setDelete(@RequestParam(name = "productNum") Long num)throws Exception{
		int result = productService.setDelete(num);
		return "redirect:./list";
	}

}
