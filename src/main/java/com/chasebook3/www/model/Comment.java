package com.chasebook3.www.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Comment {

	private int commentID;
	private int boardID;
	private int userID;
	private String comments;
	private int comment_count;
	
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date cegDt;
	
	private String userName;
	private String userProfileURL;
}
