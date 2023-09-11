package com.ham.main.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;
import com.ham.main.partner.PartnerDTO;
import com.ham.main.partner.PartnerService;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PartnerService partnerService;
	
	@GetMapping("home")
	public void goHome() throws Exception{
		
	}
	
	@GetMapping("adminAuth")
	public void getAuth()throws Exception{
		
	}
	
	@PostMapping("adminAdd")
	public String adminAdd(MemberDTO memberDTO) throws Exception{
		int result = memberService.adminAdd(memberDTO);
		
		return "admin/home";
	}
	
	@PostMapping("adminRemove")
	public String adminRemove(MemberDTO memberDTO) throws Exception{
	    int result = memberService.adminRemove(memberDTO);
		return "admin/adminAuth";
	}
	
	@GetMapping("partnerList")
	public String getList(Model model,Pager pager) throws Exception{
		List<PartnerDTO> partnerList = partnerService.getList(pager);
		model.addAttribute("list", partnerList);
		
		return "admin/partnerList";
	}
	
	@GetMapping("partnerPermitList")
	public String getPermitList(Model model,Pager pager) throws Exception{
		List<PartnerDTO> partnerList = partnerService.getPermitList(pager);
		model.addAttribute("list", partnerList);
		
		return "admin/partnerPermitList";
	}
	
	
	
}
