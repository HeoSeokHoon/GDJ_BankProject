package com.winter.app.interceptors;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.winter.app.member.MemberDTO;
import com.winter.app.member.role.RoleDTO;

@Component
public class AdminCheckInterceptor extends HandlerInterceptorAdapter{
	
	//Controller 진입전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		List<RoleDTO> ar = memberDTO.getRoleDTOs();
		System.out.println("관리자 권한 체크 인터셉터");
		for(RoleDTO r:ar) {
			if(r.getRoleName().equals("ROLE_ADMIN")) {
				System.out.println("관리자 입니다");
				return true;
			}
		}
		System.out.println("관리자가 아닙니다");
		request.setAttribute("msg", "관리자 권한이 필요한 기능입니다");
		request.setAttribute("path", "/");
		RequestDispatcher v = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
		v.forward(request, response);
		return false;
	}
	
	//Controller 나갈 때
	
	//JSP 렌더링 후
	
}
