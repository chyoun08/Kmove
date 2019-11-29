package com.chasebook3.www.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chasebook3.www.model.Board;

@Repository
public class BoardDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int boardInsert(Board board) {
		String sql = "insert into `board` ( USER_SEQ , TITLE , CONTENT , REG_DT , READ_COUNT , BOARD_ADMIN )"
				+ " values( ? , ? , ? , now() , 0 , ? ) ";
		return jdbcTemplate.update(sql, board.getUserSeq(), board.getTitle(), board.getContent(),
				board.getBoardAdmin());
	}

	public boolean boardUpdate(Board board) {
		String sql = "update `board` set `TITLE` = ? , `CONTENT` = ? where `BOARD_ID` = ? ";
		return (jdbcTemplate.update(sql, board.getTitle(), board.getContent(), board.getBoardID()) == 1);
	}

	public int boardLastID() {
		String sql = "select `BOARD_ID` from `board` order by `BOARD_ID` desc limit 1";

		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public boolean boardDelete(int boardID) {
		String sql = "delete from `board` where BOARD_ID = ? ";

		return (jdbcTemplate.update(sql, boardID) == 1);
	}

	public boolean countComment(int boardID) {
		String sql = "update `board` set `READ_COUNT` = 1 + `READ_COUNT` where `BOARD_ID` = ? ";

		return (jdbcTemplate.update(sql, boardID) >= 1);
	}

	public int boardListTotalCnt() {
		String sql = "SELECT count(*) FROM `board` ";

		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Board> getPublicBoardList(int end, int start) {
		// limit a , b == limit b offset a
		String sql = "SELECT SQL_CALC_FOUND_ROWS A.* FROM " + " ( SELECT * FROM `board` ) "
				+ " A ORDER BY `BOARD_ID` DESC limit ? , ? ";

		return jdbcTemplate.query(sql, new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setBoardID(rs.getInt("BOARD_ID"));
				board.setUserSeq(rs.getInt("USER_SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				Calendar cal = new GregorianCalendar();
				board.setRegDt(rs.getTimestamp("REG_DT", cal));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setBoardAdmin(rs.getString("BOARD_ADMIN"));
				return board;
			}

		}, start, end);
	}

	public List<Board> getPrivateBoardList(int start, int end, int userSeq) {
		String sql = "select * from `board` where `USER_SEQ` = ? order by `BOARD_ID` DESC limit ? , ?";

		return jdbcTemplate.query(sql, new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setBoardID(rs.getInt("BOARD_ID"));
				board.setUserSeq(rs.getInt("USER_SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDt(rs.getDate("REG_DT"));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setBoardAdmin(rs.getString("BOARD_ADMIN"));
				return board;
			}

		}, userSeq, start, end);
	}

	public List<Board> getProtectedBoardList(int start, int end, int userSeq) {

		String sql = " SELECT SQL_CALC_FOUND_ROWS A.* FROM ( "
				+ " select b.BOARD_ID, b.USER_SEQ, b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT, "
				+ " b.BOARD_ADMIN from `board` b, `friend_tb` f " 
				+ " where ? = f.USER_ID and f.FR_USER_ID = b.USER_SEQ union "
				+ " select b.BOARD_ID, b.USER_SEQ, b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT, "
				+ " b.BOARD_ADMIN from `board` b where b.USER_SEQ = ?"
				+ " )  A order by BOARD_ID desc LIMIT ? , ?";

		return jdbcTemplate.query(sql, new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setBoardID(rs.getInt("BOARD_ID"));
				board.setUserSeq(rs.getInt("USER_SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				Calendar cal = new GregorianCalendar();
				board.setRegDt(rs.getTimestamp("REG_DT", cal));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setBoardAdmin(rs.getString("BOARD_ADMIN"));
				return board;
			}

		}, userSeq, userSeq, start, end);
	}

	public List<Board> boardListSearchWord(int limit, int offset, String searchWord) {
		String likeSearchWord = "%" + searchWord + "%";

		String sql = "SELECT SQL_CALC_FOUND_ROWS A.* FROM ( SELECT  b.BOARD_ID, b.USER_SEQ, "
				+ " u.USER_NAME, u.USER_PROFILE_IMAGE_URL, b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT, "
				+ " b.BOARD_ADMIN FROM board b, user u WHERE b.TITLE LIKE ? AND b.USER_SEQ = u.USER_SEQ "
				+ " ORDER BY BOARD_ID DESC ) A LIMIT ? OFFSET ? ";

		return jdbcTemplate.query(sql, new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setBoardID(rs.getInt("BOARD_ID"));
				board.setUserSeq(rs.getInt("USER_SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				Calendar cal = new GregorianCalendar();
				board.setRegDt(rs.getTimestamp("REG_DT", cal));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setBoardAdmin(rs.getString("BOARD_ADMIN"));
				return board;
			}

		}, likeSearchWord, limit, offset);
	}

	public int boardListSearchWordTotalCnt(String searchWord) {

		String likeSearchWord = "%" + searchWord + "%";

		String sql = "SELECT count(*) FROM board WHERE TITLE LIKE ? ";

		return jdbcTemplate.queryForObject(sql, Integer.class, likeSearchWord);
	}

	public Board boardDetail(int boardID) {
		String sql = "select * from `board` where `BOARD_ID` = ? ";

		try {
			return jdbcTemplate.queryForObject(sql, new RowMapper<Board>() {

				@Override
				public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
					Board board = new Board();
					board.setBoardID(rs.getInt("BOARD_ID"));
					board.setUserSeq(rs.getInt("USER_SEQ"));
					board.setTitle(rs.getString("TITLE"));
					board.setContent(rs.getString("CONTENT"));
					board.setRegDt(rs.getDate("REG_DT"));
					board.setReadCount(rs.getInt("READ_COUNT"));
					return board;
				}

			}, boardID);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
}
