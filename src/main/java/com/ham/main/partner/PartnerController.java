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
	
	private final String SERVICE_KEY = "bJ6kMWyyBbwha2z3sjC5XeliD%2F%2FTMdJcXmr9veQc%2BIKmwfUs0IYcoRmG0F7qXaxYkf61qRvzBy67J30mnS64Mg%3D%3D";
	
	
	
	//로그인
//	@GetMapping("partnerLogin")
//	public void getMemberLogin() throws Exception {
//		
//	}
//	
//	@PostMapping("partnerLogin")
//	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		System.out.println(memberDTO);
//		memberDTO = memberService.getMemberLogin(memberDTO);
//		
//		PartnerDTO partnerDTO = partnerService.getPartnerInfo(memberDTO.getId());
//		if(memberDTO != null) {
//			session.setAttribute("member", memberDTO);
//			//session.setAttribute("partner", partnerDTO);
//			if(partnerDTO != null) {
//				session.setAttribute("partner", partnerDTO);
//			}else {
//				mv.addObject("errormessage", "파트너로그인에 실패했습니다.");
//			}
//			mv.setViewName("redirect:../");
//		}else {
//			mv.addObject("errorMessage", "로그인에 실패했습니다.");
//			mv.setViewName("/partner/partnerLogin");
//		}
//	
//		return mv;
//	}
	
	//파트너페이지
	@GetMapping("partnerPage")
	public void getPartnerPage() throws Exception {
		
	
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
	public ModelAndView setPartnerJoin(PartnerDTO partnerDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = partnerService.setPartnerJoin(partnerDTO);
		mv.setViewName("redirect:../");
		
		return mv;
	}



	@GetMapping("list")
	public String getList(PartnerDTO partnerDTO,Model model) throws Exception{
		List<PartnerDTO> partnerList = partnerService.getList(partnerDTO);
		model.addAttribute("list", partnerList);
		
		return "admin/partnerList";
	}
	
	@PostMapping("update")
	public String setPermitUpdate(PartnerDTO partnerDTO,Model model) throws Exception{
		int result = partnerService.setPermitUpdate(partnerDTO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("detail")
	public String getDetail(PartnerDTO partnerDTO,Model model) throws Exception{
		partnerDTO = partnerService.getDetail(partnerDTO);
		model.addAttribute("kto", partnerDTO);
		
		return "admin/partnerDetail";
	}
	
	
	

}
