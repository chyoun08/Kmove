package com.chasebook3.www.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chasebook3.www.model.FileDB;

@Repository
public class FileDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int fileInsert(FileDB file) {
		System.out.println("DBÀúÀå");
		String sql = "insert into `file_db` ( boardID, FILE_NAME , FILE_PATH )" + " values( ? , ? , ?  ) ";
		return jdbcTemplate.update(sql, file.getBoardID() , file.getFileName(), file.getPath());
	}

	public boolean insertBoardID(int fileID, int boardID) {
		String sql = "update `file_db` set boardID = ? where `FILE_ID` = ? ";
		
		return (jdbcTemplate.update(sql, boardID, fileID)>=1);
	}
	
	public FileDB getFileDB(int fileID) {
		String sql = "select * from `file_db`";

		return jdbcTemplate.queryForObject(sql, new RowMapper<FileDB>() {

			@Override
			public FileDB mapRow(ResultSet rs, int rowNum) throws SQLException {
				FileDB file = new FileDB();
				file.setFileID(rs.getInt("FILE_ID"));
				file.setFileName(rs.getString("FILE_NAME"));
				file.setPath(rs.getString("FILE_PATH"));
				return file;
			}
		}, fileID);
	}
	
	public List<FileDB> getFileList(int boardID){
		String sql = "select * from `file_db` where `boardID` = ?";
		
		return jdbcTemplate.query(sql,new RowMapper<FileDB>() {

			@Override
			public FileDB mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				FileDB file = new FileDB();
				
				file.setFileID(rs.getInt("FILE_ID"));
				file.setBoardID(rs.getInt("boardID"));
				file.setFileName(rs.getString("FILE_NAME"));
				file.setPath(rs.getString("FILE_PATH"));
				
				return file;
			}
			
		},boardID);
	}

	public List<Integer> getNullFileList(){
		String sql = "select `FILE_ID` from `file_db` where `boardID` = 1";
		
		return jdbcTemplate.queryForList(sql,Integer.class);
	}
	
	public int fileDelete(int fileID) {
		String sql = "delete from `file_db` where FILE_ID = ?";

		return jdbcTemplate.update(sql, fileID);
	}
}
