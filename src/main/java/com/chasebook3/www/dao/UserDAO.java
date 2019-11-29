package com.chasebook3.www.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.chasebook3.www.model.User;

@Repository
public class UserDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int userRegiter(User user) {
		
		if(user.getUserSex().equals("WOMAN")) {
			user.setProfileImageUrl("/resources/img/woman.png");
		}
		String sql = "insert into `user` ( `USER_NAME` , `USER_EMAIL` , `USER_PASSWORD` , `USER_PROFILE_IMAGE_URL` , `USER_SEX` , `USER_AGE` ,"
				+ " `USER_ALARM` , `USER_ADMIN` , `USER_REGISTER_DATE` ) "
				+ "values( ? , ? , ? , ? , ? , ? , ? , ? , now() )";

		return jdbcTemplate.update(sql, user.getUserName(), user.getUserEmail(), user.getUserPassword(),
				user.getProfileImageUrl(), user.getUserSex(), user.getUserAge(), user.getUserAlarm(),
				user.getUserAdmin());
	}

	public int updateProfile(int userSeq, String profile) {
		System.out.println("DAO 진입완료");
		String sql = "UPDATE user SET `USER_PROFILE_IMAGE_URL` = ? WHERE (`USER_SEQ` = ?);";
		return jdbcTemplate.update(sql, profile, userSeq);
	}

	public User getUserByEmail(String email) {
		String sql = "select * from `user` where `USER_EMAIL` = ? ";

		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { email }, new RowMapper<User>() {
				@Override
				public User mapRow(ResultSet rs, int count) throws SQLException {
					User user = new User();
					user.setUserSeq(rs.getInt("USER_SEQ"));
					user.setUserName(rs.getString("USER_NAME"));
					user.setUserEmail(rs.getString("USER_EMAIL"));
					user.setUserPassword(rs.getString("USER_PASSWORD"));
					user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
					user.setUserSex(rs.getString("USER_SEX"));
					user.setUserAge(rs.getInt("USER_AGE"));
					user.setUserAlarm(rs.getInt("USER_ALARM"));
					user.setUserRegisterDate(rs.getDate("USER_REGISTER_DATE"));
					user.setUserAdmin(rs.getString("USER_ADMIN"));
					return user;
				}
			});
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public String userAdmin(int userSeq) {

		String sql = "select USER_ADMIN from `user`	where `USER_SEQ` = ?";

		return jdbcTemplate.queryForObject(sql, String.class, userSeq);
	}

	public User getUserInfo(int userSeq) {
		String sql = "select * from `user` where `USER_SEQ` = ? ";

		return jdbcTemplate.queryForObject(sql, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int count) throws SQLException {
				User user = new User();
				user.setUserSeq(rs.getInt("USER_SEQ"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserEmail(rs.getString("USER_EMAIL"));
				user.setUserPassword(rs.getString("USER_PASSWORD"));
				user.setProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				user.setUserSex(rs.getString("USER_SEX"));
				user.setUserAge(rs.getInt("USER_AGE"));
				user.setUserAlarm(rs.getInt("USER_ALARM"));
				user.setUserRegisterDate(rs.getDate("USER_REGISTER_DATE"));
				return user;
			}
		}, userSeq);
	}
}
