package com.chasebook3.www.service;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.chasebook3.www.dao.UserDAO;
import com.chasebook3.www.model.User;

@Service
public class UserService {
	
	String userUploadRealPath = "D:" + File.separator + "kaka" + File.separator + "projectspace" + File.separator
			+ "chasebook3" + File.separator + "src" + File.separator + "main" 
			+ File.separator + "webapp" + File.separator + "resources" + File.separator + "profile";
	String userFileFolder = "/resources/profile";

	@Autowired
	UserDAO userDao;

	public int userRegister(User user) {
		return userDao.userRegiter(user);
	}

	@Transactional("txManager")
	public boolean updateProfile(int userSeq, MultipartFile file) throws Exception {
		System.out.println("updateProfileService");
		System.out.println("\n"+file+"\n");
		if (file != null) {
			// Random Fild Id
			UUID uuid = UUID.randomUUID();

			// file extention
			String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // vs FilenameUtils.getBaseName()

			String savingFileName = uuid + "." + extension;

			File saveFile = new File(userUploadRealPath, savingFileName);
			file.transferTo(saveFile);

			String userFileUrl = userFileFolder + "/" + savingFileName;
			System.out.println(userFileUrl+"--------------");
			userDao.updateProfile(userSeq, userFileUrl);

			return true;
		} else {
			return false;
		}

	}

	public boolean userLogin(String email, String password) {
		User user = userDao.getUserByEmail(email);
		if (user != null) {
			if (user.getUserPassword().equals(password)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public User getUserInfo(int userSeq) {
		return userDao.getUserInfo(userSeq);
	}

	public User getUserByEmail(String email) {
		User user = userDao.getUserByEmail(email);
		return user;
	}

	public boolean userAdmin(String email) {
		User user = userDao.getUserByEmail(email);
		if (user.getUserAdmin().equals("ADMIN"))
			return true;
		else
			return false;
	}
}
