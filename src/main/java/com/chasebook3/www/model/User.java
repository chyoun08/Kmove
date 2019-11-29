package com.chasebook3.www.model;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class User {

	private int userSeq;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String profileImageUrl = "/resources/img/man.png";
	private String userSex = "MAN";
	private int userAge = 0;
	private int userAlarm = 0;
	private String userAdmin = "PUBLIC";
	private Date userRegisterDate;
}
