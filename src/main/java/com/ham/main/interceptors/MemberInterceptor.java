package com.ham.main.interceptors;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ham.main.member.MemberDTO;
import com.ham.main.member.RoleDTO;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		List<RoleDTO> roles = memberDTO.getRoles();
		for(RoleDTO role: roles) {
			if(role.getRoleName().equals("MEMBER")){
				return true;
			}
		}
		
		request.setAttribute("message", "로그인해주세요");
		request.setAttribute("url", "/");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
		view.forward(request, response);
		return false;
		
	}
	
	
}
