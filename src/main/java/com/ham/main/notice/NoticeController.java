package com.ham.main.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noService;
	
	
	@GetMapping("list")
	public String getList(Model model) throws Exception {
		List<NoticeDTO> ar = noService.getList();
		
		model.addAttribute("list", ar);
		
		return "/notice/list";
	}
	
	@GetMapping("detail")
	public String getDetail(NoticeDTO noDTO, Model model) throws Exception{
		noDTO = noService.getDetail(noDTO);
		
		model.addAttribute("kto", noDTO);
		
		return "/notice/detail";
	}
	
}
