package com.chasebook3.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.debug("/");
		return "homes";
	}

	@GetMapping(value = "/login")
	public String login() {
		System.out.println("login" + "페이지 이동");
		logger.debug("/login");
		return "loginform";
	}

	@GetMapping(value = "/sign")
	public String sign() {
		return "sign";
	}

	@GetMapping(value = "/help")
	public String help() {
		return "help";
	}
	
	@GetMapping(value="/map")
	public String  boardDropzone(HttpSession session) {
		return "map/map";
	}

}
