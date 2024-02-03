package com.ham.main.partner;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.ProductService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/partner/*")
public class PartnerController {

	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService;
	

	
	
	@GetMapping("partnerPage")
	public void getPartnerPage(HttpSession session,Model model) throws Exception {
		PartnerDTO partnerDTO = (PartnerDTO)session.getAttribute("partner");
		List<ProductDTO> pl = productService.getInfo(partnerDTO);
		model.addAttribute("kto", pl);
	}
	

	@GetMapping("manage")
	public void getPartnerManage(HttpSession session, Model model) throws Exception {
		PartnerDTO partnerDTO = (PartnerDTO)session.getAttribute("partner");
		List<ProductDTO> pl = productService.getInfo(partnerDTO);
		model.addAttribute("kto", pl);
		

	}

	
	//사업자등록
	@GetMapping("partnerRegister")
	public ModelAndView setPartnerJoin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("serviceKey", SERVICE_KEY);
		mv.setViewName("/partner/partnerRegister");
		
		return mv;
	}
	
	@PostMapping("partnerRegister")
	public ModelAndView setPartnerJoin(HttpSession session,PartnerDTO partnerDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		partnerDTO.setId(memberDTO.getId());
		
		int result = partnerService.setPartnerJoin(partnerDTO);
		mv.setViewName("redirect:../");
		
		return mv;
	}


	@PostMapping("permitUpdate")
	public String setPermitUpdate(PartnerDTO partnerDTO,Model model) throws Exception{
		int result = partnerService.setPermitUpdate(partnerDTO);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(partnerDTO.getId());
		if(result>0) {
		    result = memberService.partnerAdd(memberDTO);
		    if(result>0) {
				model.addAttribute("result", result);
				} 
		}
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("deleteUpdate")
	public String setDeleteUpdate(PartnerDTO partnerDTO,Model model) throws Exception{
		int result = partnerService.setDeleteUpdate(partnerDTO);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(partnerDTO.getId());
		if(result>0) {
		    result = memberService.partnerRemove(memberDTO);
		    if(result>0) {
				model.addAttribute("result", result);
				} 
		}
		
		return "commons/ajaxResult";
	}
	
	
	@GetMapping("detail")
	public String getDetail(PartnerDTO partnerDTO,Model model) throws Exception{
		partnerDTO = partnerService.getDetail(partnerDTO);
		model.addAttribute("kto", partnerDTO);
		
		return "admin/partnerDetail";
	}
	
	@GetMapping("update")
	public void setUpdate(HttpSession session,Model model) throws Exception{
	   PartnerDTO partnerDTO = (PartnerDTO) session.getAttribute("partner");
	   partnerDTO =	partnerService.getDetail(partnerDTO);
	   model.addAttribute("kto", partnerDTO);
	   
	}
	
	@PostMapping("update")
	public String setUpdate(HttpSession session, PartnerDTO partnerDTO) throws Exception{
        int result = partnerService.setUpdate(partnerDTO);

		return "redirect:./update";
	}
	
	

}
