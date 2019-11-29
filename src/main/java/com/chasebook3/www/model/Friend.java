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
public class Friend {

	private int firendID;
	private int userID;
	private int fuserID;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date applyDt;
	private String sort = "WAIT";
	//sort = wait, reject, accept
}
