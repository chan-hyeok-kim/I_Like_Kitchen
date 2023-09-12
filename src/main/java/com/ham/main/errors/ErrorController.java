//package com.ham.main.errors;
//
//import org.springframework.beans.TypeMismatchException;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//@ControllerAdvice
//@RequestMapping("/errors/*")
//public class ErrorController {
//	
//	@GetMapping("notFound")
//	public void notFound() throws Exception{
//		
//	}
//	
//	
//	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	public String frontError() throws Exception{
//		return "errors/notFound";
//	}
//	
//	@ExceptionHandler(NullPointerException.class)
//	public String error1(Exception ex){
//		System.out.println("NullPointerException 발생");
//		System.out.println(ex.getMessage());
//		return "errors/notFound";
//	}
//	
//	@ExceptionHandler(TypeMismatchException.class)
//	public void error2(){
//		System.out.println("TypeMismatchException 발생");
//	}
//	
//	@ExceptionHandler(Exception.class)
//	public String error3(Exception ex){
//		System.out.println(ex.getMessage());
//		return "errors/notFound";
//		
//	}
//
//}
