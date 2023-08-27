package com.ham.main.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/partner/*")
public class PartnerController {
	
	@Autowired
	private PartnerService partnerService;
	
	//공간등록
	@GetMapping("partnerJoin")
	public ModelAndView setPartnerJoin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/partner/partnerJoin");
		
		return mv;
	}
	
	@PostMapping("partnerJoin")
	public ModelAndView setPartnerJoin(PartnerDTO partnerDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = partnerService.setPartnerJoin(partnerDTO);
		mv.setViewName("redirect:../");
		
		return mv;
	}
}
