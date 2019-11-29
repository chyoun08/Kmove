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

import com.chasebook3.www.model.Board;
import com.chasebook3.www.service.BoardService;
import com.chasebook3.www.service.FileService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;

	@Autowired
	FileService fileService;

	@PostMapping(value = "/insert")
	@ResponseBody
	public boolean boardInsert(Board board) {
		logger.debug("/board/insert");

		if (boardService.boardInsert(board)) {
			int boardID = boardService.boardLastID();
			if (fileService.insertBoardID(boardID)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	@GetMapping(value = "/list")
	public String boardList(int limit, int offset, String searchWord, String admin, int userSeq, Model model) {

		String search;
		if(searchWord!=null) {
			search = searchWord;
		}else {
			search = "";
		}
		logger.debug("/board/list");
		List<Board> boardList = boardService.boardListSearchWord(limit, offset, searchWord, admin, userSeq);
		
		model.addAttribute("search",search);
		model.addAttribute("size", boardList.size());
		model.addAttribute("boardList", boardList);
		
		return "user/home_p";
	}

	@GetMapping(value = "/detail")
	@ResponseBody
	public Board boardDetail(int boardID) {
		if (boardService.countComment(boardID)) {
			return boardService.boardDetail(boardID);
		} else {
			return null;
		}
	}

	@PostMapping(value = "/update")
	@ResponseBody
	public boolean boardUpdate(Board board) {
		return boardService.boardUpdate(board);
	}

	@PostMapping(value = "/delete")
	@ResponseBody
	public boolean boardDelete(int boardID) {
		return boardService.boardDelete(boardID);
	}

	@GetMapping(value = "/list/totalCnt")
	@ResponseBody
	public int boardListCnt(String searchWord) {

		logger.debug("/board/listTotalCnt");

		return boardService.boardListTotalCnt(searchWord);
	}
}
