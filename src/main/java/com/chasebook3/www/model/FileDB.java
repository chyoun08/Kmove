package com.chasebook3.www.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class FileDB {

	private int fileID;
	private int boardID = 0;
	private String fileName;
	private String path;
}
