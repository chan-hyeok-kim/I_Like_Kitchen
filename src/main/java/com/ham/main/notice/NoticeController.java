package com.ham.main.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.RoleDTO;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noService;
	
	
	@GetMapping("list")
	public String getList(Model model, Pager pager, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		
		
		List<NoticeDTO> ar = noService.getList(pager);
		
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
//		if(role.getRoleNum() == 3) {
			return "/admin/notice/list";
//		}else {
//			return "/notice/list";
//		}
		
	}
	
	@GetMapping("detail")
	public String getDetail(NoticeDTO noDTO, Model model) throws Exception{
		noDTO = noService.getDetail(noDTO);
		RoleDTO role = new RoleDTO();
		role.setRoleNum(9L);
		
		model.addAttribute("kto", noDTO);
		
		if(role.getRoleNum() == 9) {
			return "/admin/notice/detail";
		}else {
			return "/notice/detail";
		}
		
	}
	
	@GetMapping("add")
	public String setAdd(HttpSession session) throws Exception{
//		if(session.getAttribute("kto") == null) {
//			return "/home";
//		}
		
		return "/admin/notice/add";
	}
	@PostMapping("add")
	public String setAdd(NoticeDTO noDTO, HttpSession session, MultipartFile[] files) throws Exception{
//		MemberDTO memDTO = (MemberDTO)session.getAttribute("member");
//		noDTO.setId(memDTO.getId());
		noDTO.setId("qwe");
		
		noService.setAdd(noDTO, files, session);
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("update")
	public String setUpdate(NoticeDTO noDTO, Model model) throws Exception {
		noDTO = noService.getDetail(noDTO);
		
		model.addAttribute("kto", noDTO);
		
		return "/admin/notice/update";
	}
	@PostMapping("update")
	public String setUpdate(NoticeDTO noDTO, MultipartFile[] files, HttpSession session) throws Exception{
		noService.setUpdate(noDTO, files, session);
		
		return "redirect:/notice/detail?noticeNum=" + noDTO.getNoticeNum();
	}
	
	@PostMapping("delete")
	public String setDelete(NoticeDTO noDTO) throws Exception{
		noService.setDelete(noDTO);
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("fileDelete")
	public void setFileDelete(NoticeFileDTO noFileDTO, HttpSession session) throws Exception {
		noService.setFileDelete(noFileDTO, session);
	}

	
}
