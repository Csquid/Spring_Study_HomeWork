package com.monkey.coffee.commonInterCeptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.monkey.coffee.vo.UserVO;

public class CommonInterCeptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserVO object = (UserVO) session.getAttribute("userInfo");
		System.out.println("·Î±× ÂïÇô¶ó");

		if (request.getRequestURL().indexOf("/admin") >= 0) {
			if (object != null && object.getId().equals("admin")) {
				System.out.println("Hello? Admin");
				System.out.println("FuckYou!!");

				return true;
			} else {
				System.out.println("You'r Not Admin");
				System.out.println("Get Out");
				System.out.println("userInfo: " + object);
				response.sendRedirect("/sub2_Tab/?authority_admin=no");
				return false;
			}
		} else if (object == null) {
			response.sendRedirect("/sub1_Tab/?authority=no");
			return false;
		} else {
			return true;
		}
	}

}