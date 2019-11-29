package com.chasebook3.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chasebook3.www.model.Comment;
import com.chasebook3.www.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentContoller {

	@Autowired
	CommentService commentService;
	
	@PostMapping(value="/insert")
	@ResponseBody
	public List<Comment> commentInsert(Comment comment) {
		System.out.println("��� �ۼ�");
		if(commentService.commentInsert(comment)) {
			return commentService.commentDetail(comment.getBoardID());
		}else {
			return null;
		}
	}
	
	@PostMapping(value="/delete")
	@ResponseBody
	public boolean commentDelte(int commentID) {
		System.out.println("Comment 삭제 완료");
		return commentService.commentDelete(commentID);
	}
	
	@GetMapping(value = "/detail")
	@ResponseBody
	public List<Comment> commentDetail(int boardID){
		System.out.println(boardID+"의 Detail 출력");
		return commentService.commentDetail(boardID);
	}
	
	@PostMapping(value="/plus")
	@ResponseBody
	public boolean commentPlus(int commentID) {
		System.out.println(commentID+"오홍 좋아요! 추가 완료");
		return commentService.commentPlus(commentID);
	}
}
