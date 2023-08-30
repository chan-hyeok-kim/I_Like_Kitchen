package com.ham.main.partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner/*")
public class PartnerController {

	@Autowired
	private PartnerService partnerService;
	
	@GetMapping("list")
	public String getList(PartnerDTO partnerDTO,Model model) throws Exception{
		List<PartnerDTO> partnerList = partnerService.getList(partnerDTO);
		model.addAttribute("list", partnerList);
		
		return "admin/partnerList";
	}
}
