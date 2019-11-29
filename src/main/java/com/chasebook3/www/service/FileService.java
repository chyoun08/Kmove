package com.chasebook3.www.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chasebook3.www.dao.BoardDAO;
import com.chasebook3.www.dao.FileDAO;
import com.chasebook3.www.model.FileDB;

@Service
public class FileService {

	@Autowired
	FileDAO fileDAO;
	
	@Autowired
	BoardDAO boardDao;
	
	public int fileInsert(FileDB file) {
		System.out.println("서비스 실행");
		return fileDAO.fileInsert(file);
	}
	
	public boolean insertBoardID(int boardID) {
		List<Integer> nullList = fileDAO.getNullFileList();
		for(int a: nullList) {
			if(!fileDAO.insertBoardID(a,boardID)) {
				System.out.println(a+"에서 문제가 발생했습니다.");
				return false;
			}
		}
		return true;
	}
	
	public boolean fileDelete(int fileID) {
		return (fileDAO.fileDelete(fileID) == 1);
	}
	
	public boolean fileForBoardDelete(int boardID) {
		List<FileDB> fileList = fileDAO.getFileList(boardID);
		
		for(FileDB fileDB:fileList) {
			String realPath = fileDB.getPath()+fileDB.getFileName();
			File file = new File(realPath);
			if(file.exists()) {
				System.out.println("파일 삭제 완료 : "+fileDB.getFileName());
				file.delete();
			}
		}
		
		return false;
	}
	
	public FileDB getFileDB(int fileID) {
		return fileDAO.getFileDB(fileID);
	}
}
