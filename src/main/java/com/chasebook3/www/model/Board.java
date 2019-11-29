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
public class Board {

	private int boardID;
	private int userSeq;
	private String userName;
	private String userProfileImageUrl;
	
	private String title;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date regDt;
	private int readCount;
	private String boardAdmin = "PUBLIC";
	
	private int fileID;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	
}
