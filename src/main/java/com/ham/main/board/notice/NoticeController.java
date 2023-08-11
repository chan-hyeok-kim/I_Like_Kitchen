package com.ham.main.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.board.BoardDTO;
import com.iu.main.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	NoticeService boService;
	
	@ModelAttribute("board")
	public String getBoardName() {
		
		return "Notice";
	}
	
	@PostMapping("setContentsImgDelete")
	public String setContentsImgDelete(String path, HttpSession session, Model model) throws Exception {
		boolean check = boService.setContentsImgDelete(path, session);
		model.addAttribute("result", check);
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile files, HttpSession session, Model model) throws Exception {
		System.out.println(files.getOriginalFilename());
		String path = boService.setContentsImg(files, session);
		
		model.addAttribute("result", path);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("fileDelete")
	public String setFileDelete(NoticeFileDTO noFileDTO, Model model, HttpSession session) throws Exception{
		int result = boService.setFileDelete(noFileDTO, session);
		
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Model model, Pager pager) throws Exception {
		List<BoardDTO> ar = boService.getList(pager);
		
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "/board/list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String setAdd(HttpSession session) throws Exception {
		if(session.getAttribute("member") == null) {
			return "redirect:/member/login";
		}
		
		return "/board/add";
	}
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String setAdd(NoticeDTO noDTO, MultipartFile[] photos, HttpSession session, Model model) throws Exception {
		int result = boService.setAdd(noDTO, photos, session);
		
		String message = "등록 실패";
		
		if(result > 0){
			message = "등록 성공";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("url", "list");
		
		return "redirect:./list";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(NoticeDTO noDTO, Model model) throws Exception {
		BoardDTO boDTO = boService.getDetail(noDTO);
		
		model.addAttribute("dto", boDTO);
		
		return "/board/detail";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String setUpdate(NoticeDTO noDTO, Model model) throws Exception {
		// 1. 가져온 boardNum으로 detail 메서드를 이용하여 그 번호에 해당하는 BoardDTO 가져오기
		// 2. 가져온 dto를 Model 또는 ModelAndView에 저장 
		BoardDTO boDTO = boService.getDetail(noDTO);
		
		model.addAttribute("dto", boDTO);
		
		return "/board/update";
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setUpdate(NoticeDTO noDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		int result = boService.setUpdate(noDTO, photos, session);
		
		return "redirect:./detail?boardNum=" + noDTO.getBoardNum();
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String setDelete(NoticeDTO noDTO) throws Exception {
		int result = boService.setDelete(noDTO);
		
		return "redirect:./list";
	}
	
}
