package com.chasebook3.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chasebook3.www.dao.CommentDAO;
import com.chasebook3.www.model.Comment;

@Service
public class CommentService {

	@Autowired
	CommentDAO commentDao;
	
	public List<Comment> commentDetail(int boardID){
		return commentDao.selectCommentList(boardID);
	}
	
	public boolean commentInsert(Comment comment) {
		return commentDao.insertComment(comment);
	}
	
	public boolean commentDelete(int commentID) {
		return commentDao.deleteComment(commentID);
	}
	
	public boolean commentPlus(int commentID) {
		return commentDao.plusComment(commentID);
	}
}
