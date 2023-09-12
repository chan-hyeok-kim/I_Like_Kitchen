package com.ham.main.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errors/*")
public class FrontErrorController {
	
	@GetMapping("notFound")
	public void front() throws Exception{
		
	}
}
