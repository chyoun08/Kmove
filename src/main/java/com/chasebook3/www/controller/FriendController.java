package com.chasebook3.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chasebook3.www.model.User;
import com.chasebook3.www.service.FriendService;

@Controller
@RequestMapping("/friend")
public class FriendController {

	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	FriendService friendService;
	
	@GetMapping(value = "")
	public String friend() {
		logger.debug("/friend");
		return "friend/friend_page";
	}
	
	@GetMapping(value = "/list")
	public String boardList(int limit, int offset, int userSeq, String searchWord, Model model) {

		String search = "";
		if(searchWord!=null) {
			search = searchWord;
		}
		logger.debug("/friend/list");
		System.out.println("list '"+search+"' : 출력");
		List<User> friendList = friendService.friendListFind(limit, offset, searchWord);
		List<User> requestList = friendService.requestFriendList(4, offset, userSeq);
		model.addAttribute("size", friendList.size());
		model.addAttribute("requestList",requestList);
		model.addAttribute("friendList", friendList);
		
		return "friend/friend_page";
	}
	
	@GetMapping(value="/myfriends")
	public String myFriendList(int limit, int offset, int userSeq, String searchWord, Model model) {
		List<User> friendList = friendService.searchMyFriendList(limit, offset, userSeq, searchWord);
		model.addAttribute("friendList",friendList);
		return "friend/my_friend";
	}

	@PostMapping(value="/apply")
	@ResponseBody
	public boolean friendApply(int userID, int fuserID) {
		System.out.println("Okay!!");
		return friendService.friendApply(userID, fuserID);
	}
	
	@PostMapping(value="/reject")
	@ResponseBody
	public boolean friendReject(int userID, int fuserID) {
		System.out.println("Reject!!");
		return friendService.friendReject(userID, fuserID);
	}
	
	@GetMapping(value="/rejects")
	public String freindRejectList(int limit, int offset, int userSeq, Model model) {
		System.out.println("freindRejectList!!");
		model.addAttribute("friendList",friendService.rejectFriendList(limit, offset, userSeq));
		return "friend/rejectList";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public boolean friendInsert() {
		logger.info("firendInsert 호출");
		return false;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public boolean friendDelete() {
		logger.info("friendDelete 호출");
		return false;
	}

	@GetMapping(value = "/my_friend")
	public String myFriend() {
		return "friend/my_friend";
	}
	
	@GetMapping(value="/list/totalCnt")
	@ResponseBody
	public int friendListCnt(String searchWord) {
		return friendService.friendTotalCnt(searchWord);
	}
}
