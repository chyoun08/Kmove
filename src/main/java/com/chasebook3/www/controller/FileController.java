package com.chasebook3.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chasebook3.www.model.FileDB;
import com.chasebook3.www.service.FileService;

@Controller
@RequestMapping("/boardFile")
public class FileController {

	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Autowired
	FileService fileService;
	
	@PostMapping(value = "/insert")
	@ResponseBody
	public int boardInsert(FileDB fileDB) {
		logger.debug("/file/insert");
		System.out.println("-----------FileDB저장---------\n"+fileDB.toString());
		
		return fileService.fileInsert(fileDB);
	}
	
	@PostMapping(value = "/delete")
	@ResponseBody
	public void boardDelete(int fileID) {
		logger.debug("/file/delte");
		FileDB file = fileService.getFileDB(fileID);
		System.out.println("--------------------\n"+file.toString());
		if(fileService.fileDelete(fileID)) {
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제 실패");
		}
	}
}
