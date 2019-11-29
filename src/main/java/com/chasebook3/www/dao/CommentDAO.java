package com.chasebook3.www.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chasebook3.www.model.Comment;

@Repository
public class CommentDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public boolean insertComment(Comment comment) {
		String sql = "insert into `comment` ( BOARD_ID , USER_ID , COMMENTS , COMMENT_COUNT , CEG_DT)"
				+ " values( ? , ? , ? , 0 , now() ) ";
		return (jdbcTemplate.update(sql, comment.getBoardID(), comment.getUserID(), comment.getComments()) >=1);
	}
	
	public boolean deleteComment(int commentID) {
		String sql = "delete from `comment` where COMMENT_ID = ? ";
		
		return (jdbcTemplate.update(sql, commentID) >= 1);
	}
	
	public boolean plusComment(int commentID) {
		String sql = "update `comment` set `comment_count` = 1 + `comment_count` where comment_id = ?";
		
		return (jdbcTemplate.update(sql, commentID ) >=1 );
	}
	
	public List<Comment> selectCommentList(int boardID){
		String sql = "select c.COMMENT_ID , c.BOARD_ID, c.USER_ID, c.COMMENTS, "
				+ "c.COMMENT_COUNT, c.CEG_DT , u.USER_NAME , u.USER_PROFILE_IMAGE_URL " + 
				" from `comment` c, `user` u where c.BOARD_ID = ? and u.USER_SEQ = c.USER_ID";
		
		return jdbcTemplate.query(sql, new RowMapper<Comment>() {

			@Override
			public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Comment comment = new Comment();
				
				comment.setCommentID(rs.getInt("COMMENT_ID"));
				comment.setBoardID(rs.getInt("BOARD_ID"));
				comment.setUserID(rs.getInt("USER_ID"));
				comment.setComments(rs.getString("COMMENTS"));
				comment.setComment_count(rs.getInt("COMMENT_COUNT"));
				Calendar cal = new GregorianCalendar();
				comment.setCegDt(rs.getTimestamp("CEG_DT",cal));
				comment.setUserName(rs.getString("USER_NAME"));
				comment.setUserProfileURL(rs.getString("USER_PROFILE_IMAGE_URL"));
				
				return comment;
			}

		}, boardID);
	}
}
