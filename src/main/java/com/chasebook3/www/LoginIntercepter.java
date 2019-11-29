package com.chasebook3.www;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chasebook3.www.model.User;

public class LoginIntercepter extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginIntercepter.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("LoginIntercepter");
		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			logger.info("You already login!!");
			System.out.println("You already login!!");
			response.sendRedirect("/board/list?offset=0&limit=3&userSeq="
					+((User)session.getAttribute("user")).getUserSeq()+
					"&admin=PUBLIC&searchWord=");
			return false;
		}

		return true;
	}

}
