package com.chasebook3.www.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chasebook3.www.dao.BoardDAO;
import com.chasebook3.www.dao.FileDAO;
import com.chasebook3.www.dao.UserDAO;
import com.chasebook3.www.model.Board;
import com.chasebook3.www.model.FileDB;
import com.chasebook3.www.model.User;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDao;

	@Autowired
	UserDAO userDao;

	@Autowired
	FileDAO fileDao;

	public boolean countComment(int boardID) {
		return boardDao.countComment(boardID);
	}

	public boolean boardInsert(Board board) {
		if (boardDao.boardInsert(board) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean boardDelete(int boardID) {

		List<FileDB> fileList = fileDao.getFileList(boardID);
		if (fileList != null) {
			for (FileDB fileDB : fileList) {
				String fileUrl = fileDB.getPath() + "/" + fileDB.getFileName();
				System.out.println("fileURL : " + fileUrl);
				File file = new File(fileUrl);
				System.out.println("file : " + file.getName());
				if (file.exists()) {
					file.delete();
				}
			}
			return boardDao.boardDelete(boardID);
		} else {
			return boardDao.boardDelete(boardID);
		}
	}

	public int boardLastID() {
		return boardDao.boardLastID();
	}

	public int boardListTotalCnt() {
		int cnt = boardDao.boardListTotalCnt();
		System.out.println(cnt);
		return cnt;
	}

	public List<Board> getPublicBoardList(int start, int end) {
		List<Board> boardList = boardDao.getPublicBoardList(start, end);
		for (Board board : boardList) {
			User user = userDao.getUserInfo(board.getUserSeq());
			board.setUserName(user.getUserName());
			board.setUserProfileImageUrl(user.getProfileImageUrl());
		}
		return boardList;
	}

	public List<Board> boardListSearchWord(int limit, int offset, String searchWord, String admin, int userSeq) {
		
		if ("".equals(searchWord) && admin.equals("PUBLIC")) {
			return boardDao.getPublicBoardList(limit, offset);
		} else if("".equals(searchWord) && admin.equals("PRIVATE")){
			System.out.println("search private~!!");
			return boardDao.getPrivateBoardList(offset, limit, userSeq);
		} else if("".equals(searchWord) && admin.equals("PROTECT")) {
			return boardDao.getProtectedBoardList(offset, limit, userSeq);
		} else if(admin.equals("PUBLIC")) {
			return boardDao.boardListSearchWord(limit, offset, searchWord);
		} else if(admin.equals("PRIVATE")) {
			return boardDao.getPrivateBoardList(offset, limit, userSeq);
		} else if(admin.equals("PROTECT")){
			return boardDao.getProtectedBoardList(offset, limit, userSeq);
		} else {
			return null;
		}
	}

	public int boardListTotalCnt(String searchWord) {
		if ("".equals(searchWord)) {
			return boardDao.boardListTotalCnt();
		} else {
			return boardDao.boardListSearchWordTotalCnt(searchWord);
		}
	}

	public Board boardDetail(int boardID) {

		Board board = boardDao.boardDetail(boardID);
		User user = userDao.getUserInfo(board.getUserSeq());
		board.setUserName(user.getUserName());
		board.setUserProfileImageUrl(user.getProfileImageUrl());

		return board;
	}

	public boolean boardUpdate(Board board) {
		return boardDao.boardUpdate(board);
	}

}
