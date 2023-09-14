package com.ham.main.member.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/*")
public class MailSendController {
	
	@Autowired
	private MailSendService mailSendService;

	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) throws Exception {
	
		return mailSendService.joinEmail(email);
	}
	
	@GetMapping("/emailPasswordCheck")
	@ResponseBody
	public String mailPasswordCheck(String email) throws Exception {
		
		return mailSendService.passwordCheckEmail(email);
	}
}
