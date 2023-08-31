package com.ham.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.question.QuestionService;
import com.ham.main.util.Page;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
 @RequestMapping(value = "list", method = RequestMethod.GET)
 public String getList(Model model) throws Exception {
  
	
	  List<ReviewDTO> list = reviewService.list();
	  model.addAttribute("list", list);
	  
	  return "review/list";
 }

	@GetMapping("fileDown")
	public String getFileDown(ReviewFileDTO reviewFileDTO, Model model)throws Exception{
		reviewFileDTO = reviewService.getFileDown(reviewFileDTO);
		model.addAttribute("file", reviewFileDTO);
		
		return "fileManager";
	}
	
	@PostMapping("setContentsImgDelete")
	public String setContentsImgDelete(String path,HttpSession session,Model model) throws Exception{
		boolean check=reviewService.setContentsImgDelete(path, session);
		model.addAttribute("result", check);
		return "commons/ajaxResult";
	}
	
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile files,HttpSession session,Model model) throws Exception{
		System.out.println("setContentsImg");
		System.out.println(files.getOriginalFilename());
		String path=reviewService.setContentsImg(files, session);
		model.addAttribute("result",path);
		return "commons/ajaxResult";
	}
//게시물 작성 폼
@RequestMapping(value = "add", method = RequestMethod.GET)
public void getAdd() throws Exception {
 
}
//게시물 작성
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String postAdd(ReviewDTO reviewDTO, MultipartFile[] photos, HttpSession session, Model model)throws Exception{
		reviewDTO.setProductNum(1L);
		reviewService.add(reviewDTO,photos,session,model);
		
		return "redirect:/review/list";
		
	}
	// 게시물 조회
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void getView(@RequestParam("reviewNum") Long reviewNum, Model model) throws Exception {

		ReviewDTO reviewDTO = reviewService.view(reviewNum);
		
		model.addAttribute("view",reviewDTO);
	}
	// 게시물 수정 폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("reviewNum") long reviewNum, Model model) throws Exception {

	 ReviewDTO reviewDTO = reviewService.view(reviewNum);
	   
	 model.addAttribute("view", reviewDTO);
	}
	// 게시물 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String postUpdate(ReviewDTO reviewDTO) throws Exception {
    System.out.println(reviewDTO.getReviewContents());
	 int result= reviewService.update(reviewDTO);
	   System.out.println(result);
	 return "redirect:/review/list";
	}
	// 게시물 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("reviewNum") long reviewNum) throws Exception {
	  
	 reviewService.delete(reviewNum);  

	 return "redirect:/review/list";
	}
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "listpage", method = RequestMethod.GET)
	public void getListPage(Model model) throws Exception {
	  
	 List<ReviewDTO> list = null; 
	 list = reviewService.list();
	 model.addAttribute("list", list);   
	}
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();
		page.setNum(num);
		page.setCount(reviewService.count());  

		List<ReviewDTO> list = null; 
		list = reviewService.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
	

		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}	
}