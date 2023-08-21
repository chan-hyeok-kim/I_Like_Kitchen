package com.ham.main.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.RoleDTO;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noService;
	
	
	@GetMapping("list")
	public String getList(Model model) throws Exception {
		RoleDTO role = new RoleDTO();
		role.setRoleNum(9L);
		
		List<NoticeDTO> ar = noService.getList();
		
		model.addAttribute("list", ar);
		
		if(role.getRoleNum() == 9) {
			return "/admin/notice/list";
		}else {
			return "/notice/list";
		}
		
		
	}
	
	@GetMapping("detail")
	public String getDetail(NoticeDTO noDTO, Model model) throws Exception{
		noDTO = noService.getDetail(noDTO);
		
		model.addAttribute("kto", noDTO);
		
		return "/notice/detail";
	}
	
	@GetMapping("add")
	public String setAdd() throws Exception{
		
		return "/admin/notice/add";
	}
	@PostMapping("add")
	public String setAdd(HttpSession session, NoticeDTO noDTO, Model model) throws Exception{
		MemberDTO memDTO = (MemberDTO)session.getAttribute("member");
		noDTO.setId(memDTO.getId());
		
		return "redirect:/admin/notice/list";
	}
	
}
