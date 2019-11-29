package com.chasebook3.www.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chasebook3.www.model.Friend;
import com.chasebook3.www.model.User;

@Repository
public class FriendDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<User> myFriendList(int limit, int offset, int userSeq){
		
		String sql = "SELECT u.USER_SEQ, u.USER_NAME, u.USER_PROFILE_IMAGE_URL, u.USER_AGE, u.USER_SEX "
				+ " FROM `friend_tb` f, `user` u "
				+ " WHERE  f.USER_ID = ? AND f.FRIEND_STATE = 'ACCEPT' AND f.FR_USER_ID = u.USER_SEQ"
				+ " limit ? , ? ";

		return jdbcTemplate.query(sql, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				return user;
			}
		}, userSeq, offset, limit);
	}
	
	public List<User> rejectFriendList(int limit, int offset, int userSeq){
		
		String rejectWord = "REJECT";
		
		String sql="SELECT u.USER_SEQ, u.USER_NAME, u.USER_PROFILE_IMAGE_URL, u.USER_AGE, u.USER_SEX "
				+ " FROM `friend_tb` f, `user` u "
				+ " WHERE  f.FR_USER_ID = ? AND f.FRIEND_STATE = ? AND f.USER_ID = u.USER_SEQ"
				+ " limit ? , ? ";
		
		return jdbcTemplate.query(sql, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				return user;
			}
		}, userSeq, rejectWord, offset, limit);
	}
	
	public List<User> requestFriendList(int limit, int offset, int userSeq){
		
		String waitWord = "WAIT";
		String sql="SELECT u.USER_SEQ, u.USER_NAME, u.USER_PROFILE_IMAGE_URL, u.USER_AGE, u.USER_SEX "
				+ " FROM `friend_tb` f, `user` u "
				+ " WHERE  f.FR_USER_ID = ? AND f.FRIEND_STATE = ? AND f.USER_ID = u.USER_SEQ"
				+ " limit ? , ? ";
		
		return jdbcTemplate.query(sql, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				return user;
			}
		}, userSeq, waitWord, offset, limit);
	}
	
	public List<User> searchMyFriendList(int limit, int offset, int userSeq, String searchWord){
		String search = "%"+searchWord+"%";
		String sql = "SELECT u.USER_ID, u.USER_NAME, u.USER_AGE, u.USER_SEX FROM `friend_tb` f, `user` u "
				+ " WHERE  f.USER_ID = ? AND f.FRIEND_STATE = 'ACCEPT' AND f.FR_USER_ID = u.USER_SEQ"
				+ " AND u.userName LIKE ?  limit ? , ?";

		return jdbcTemplate.query(sql, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				return user;
			}
		}, userSeq, search, offset, limit);
	}
	
	public List<User> friendListALL(int limit, int offset){
		String sql = "select * from `user` limit ? , ?";
		
		return jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				return user;
			}
			
		}, offset, limit);
	}
	
	public List<User> friendListFind(int limit, int offset, String search){
		String searchWord = "%"+search+"%";
		String sql = "select * from `user` where userName like ? limit ?, ?";
		
		return jdbcTemplate.query(sql,new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				return user;
			}
			
		},searchWord, offset, limit);
	}
	public int friendInsert(Friend friend) {
		String sql = "insert into `friend_tb` ( USER_ID , FR_USER_ID , FRIEND_STATE , FRI_DT)"
				+ " values( ? , ? , ? , now() ) ";
		return jdbcTemplate.update(sql, friend.getFuserID(), friend.getFuserID(), friend.getSort() );
	}
	
	public boolean friendApply(int userID, int fuserID) {
		String goodState = "ACCEPT";
		String sql = "update `friend_tb` set `FRIEND_STATE` = ? where `USER_ID` = ? and `FR_USER_ID` = ?";
		
		return (jdbcTemplate.update(sql, goodState, fuserID, userID)>=1);
	}
	
	public int frienApplyFriend(int userID, int fuserID) {
		String goodState = "ACCEPT";
		String sql = "insert into `friend_tb` ( USER_ID , FR_USER_ID , FRIEND_STATE , FRI_DT )" 
				+" values( ? , ? , ? , now() ) ";
		return jdbcTemplate.update(sql, userID, fuserID, goodState );
	}
	
	public boolean friendReject(int userID, int fuserID) {
		String badState = "REJECT";
		String sql = "update `friend_tb` set `FRIEND_STATE` = ? where `USER_ID`= ? and `FR_USER_ID` = ?";
		
		return (jdbcTemplate.update(sql, badState, fuserID, userID)==1);
	}
	
	public int friendListTotalCnt() {
		String sql = "SELECT count(*) FROM `friend` ";

		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int friendListSearchWordTotalCnt(String searchWord) {

		String likeSearchWord = "%" + searchWord + "%";

		String sql = "SELECT count(*) FROM `friend` WHERE TITLE LIKE ? ";

		return jdbcTemplate.queryForObject(sql, Integer.class, likeSearchWord);
	}
	
}
