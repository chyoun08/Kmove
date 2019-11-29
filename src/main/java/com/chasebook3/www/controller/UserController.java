package com.chasebook3.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chasebook3.www.model.User;
import com.chasebook3.www.service.BoardService;
import com.chasebook3.www.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;
	
	@GetMapping(value = "/signform")
	public String userReigister() {
		return "user/signform";
	}
	
	@PostMapping(value="/register")
	@ResponseBody
	public int userRegister(User user) { 
		System.out.println("-------------------회원가입 완료------------------------\n");
		System.out.println(user.toString());
		return userService.userRegister(user);
	}
	
	@PostMapping(value="/login")
	@ResponseBody
	public int userLogin(HttpSession session, String email, String password) {
		System.out.println("---------------------------------------------\n"+email+" : "+password);
		if(userService.userLogin(email, password)) {
			session.setAttribute("user", userService.getUserByEmail(email));
			return userService.getUserByEmail(email).getUserSeq();
		}else {
			System.out.println("false로그인 오류");
			return 0;
		}
	}
	
	@GetMapping(value="/logout")
	public String userLogout(HttpSession session) {
		System.out.println("로그아웃 합니다.");
		System.out.println("---------- : "+session.getAttribute("userName")+" : ----------");
		session.removeAttribute("user");
		return "homes";
	}
	//, MultipartFile file
	@PostMapping(value = "/updateProfile")
	@ResponseBody
	public boolean updateProfile(int userSeq, Model model) throws Exception {
		System.out.println("-------------updateProfile----------");
		model.addAttribute("userSeq",userSeq);
		model.addAttribute("nowUser",userService.getUserInfo(userSeq));
		return true;

	}
	
	@GetMapping(value="/updateProfile")
	public String updateProfiles(int userSeq, Model model) {
		System.out.println("-----------updateProfile출력");
		model.addAttribute("userSeq",userSeq);
		model.addAttribute("nowUser",userService.getUserInfo(userSeq));
		return "user/user_Profile";
	}
	
	@PostMapping(value = "/updateImage")
	@ResponseBody
	public boolean updateImage(String userSeqs, MultipartFile file) throws Exception {
		System.out.println("-------------updateImage----------");
		System.out.println("----------userSeq = "+userSeqs+"----------");
		return userService.updateProfile(Integer.parseInt(userSeqs), file);

	}
	
	@GetMapping(value="/profile")
	public String userProfile(Model model, int userSeq) {
		model.addAttribute("user",userService.getUserInfo(userSeq));
		return "user/user_Profile";
	}
}
