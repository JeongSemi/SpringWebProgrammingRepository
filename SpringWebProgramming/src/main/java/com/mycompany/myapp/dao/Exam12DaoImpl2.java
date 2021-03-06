package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Exam12Board;
import com.mycompany.myapp.dto.Exam12Member;

@Component
public class Exam12DaoImpl2 implements Exam12Dao {
	private static final Logger LOGGER = LoggerFactory.getLogger(Exam12DaoImpl2.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int boardInsert(Exam12Board board) {

		// 매개변수화 된 SQL문 작성
		final String sql = "insert into board "
				+ "(bno, btitle, bcontent, bwriter, bdate, bpassword, bhitcount, boriginalfilename, bsavedfilename, bfilecontent) "
				+ "values " + "(board_bno_seq.nextval, ?, ?, ?, sysdate, ?, 0, ?, ?, ?) ";
		// jdbcTemplate.update(sql, board.getBtitle(), board.getBcontent(),
		// board.getBwriter(), board.getBpassword(),
		// board.getBoriginalfilename(), board.getBsavedfilename(),
		// board.getBfilecontent());
		PreparedStatementCreator psc = new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "bno" });
				pstmt.setString(1, board.getBtitle());
				pstmt.setString(2, board.getBcontent());
				pstmt.setString(3, board.getBwriter());
				pstmt.setString(4, board.getBpassword());
				pstmt.setString(5, board.getBoriginalfilename());
				pstmt.setString(6, board.getBsavedfilename());
				pstmt.setString(7, board.getBfilecontent());
				return pstmt;
			}
		};
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(psc, keyHolder);
		int bno = keyHolder.getKey().intValue();
		LOGGER.info(String.valueOf(bno));
		LOGGER.info("행 추가 성공");
		return bno;
	}

	@Override
	public List<Exam12Board> boardSelectAll() {
		String sql = "select bno, btitle, bwriter, bdate, bhitcount ";
		sql += "from board ";
		sql += "order by bno desc";

		RowMapper<Exam12Board> rowMapper = new RowMapper<Exam12Board>() {
			@Override
			public Exam12Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Exam12Board board = new Exam12Board();
				board.setBno(rs.getInt("bno"));
				board.setBtitle(rs.getString("btitle"));
				board.setBwriter(rs.getString(3));
				board.setBdate(rs.getDate("bdate"));
				board.setBhitcount(rs.getInt("bhitcount"));
				return board;
			}
		};
		List<Exam12Board> list = jdbcTemplate.query(sql, rowMapper);

		LOGGER.info("SELECT 성공");

		return list;
	}

	@Override
	public List<Exam12Board> boardSelectPage(int pageNo, int rowsPerPage) {

		String sql = "select * ";
		sql += "from ( ";
		sql += "  select rownum as r, bno, btitle, bwriter, bdate, bhitcount ";
		sql += "  from ( ";
		sql += "  select bno, btitle, bwriter, bdate, bhitcount from board order by bno desc ";
		sql += "  ) ";
		sql += "  where rownum<=? ";
		sql += ") ";
		sql += "where r>=? ";

		Object[] args = { (pageNo * rowsPerPage), ((pageNo - 1) * rowsPerPage + 1) };
		RowMapper<Exam12Board> rowMapper = new RowMapper<Exam12Board>() {
			@Override
			public Exam12Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Exam12Board board = new Exam12Board();
				board.setBno(rs.getInt("bno"));
				board.setBtitle(rs.getString("btitle"));
				board.setBwriter(rs.getString(4));
				board.setBdate(rs.getDate("bdate"));
				board.setBhitcount(rs.getInt("bhitcount"));
				return board;
			}
		};
		List<Exam12Board> list = jdbcTemplate.query(sql, args, rowMapper);
		LOGGER.info("SELECT 성공");

		return list;
	}

	@Override
	public int boardCountAll() {

		String sql = "select count(*) from board";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);

		return count;
	}

	@Override
	public Exam12Board boardSelectByBno(int bno) {

		String sql = "select * from board where bno=?";

		RowMapper<Exam12Board> rowMapper = new RowMapper<Exam12Board>() {
			@Override
			public Exam12Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Exam12Board board = new Exam12Board();
				board.setBno(rs.getInt("bno"));
				board.setBtitle(rs.getString("btitle"));
				board.setBcontent(rs.getString("bcontent"));
				board.setBdate(rs.getDate("bdate"));
				board.setBwriter(rs.getString("bwriter"));
				board.setBpassword(rs.getString("bpassword"));
				board.setBhitcount(rs.getInt("bhitcount"));
				board.setBoriginalfilename(rs.getString("boriginalfilename"));
				board.setBsavedfilename(rs.getString("bsavedfilename"));
				board.setBfilecontent(rs.getString("bfilecontent"));
				return board;
			}
		};
		Exam12Board board = jdbcTemplate.queryForObject(sql, rowMapper, bno);
		LOGGER.info("SELECT 성공");

		return board;
	}

	@Override
	public void boardUpdateBhitcount(int bno, int bhitcount) {

		String sql = "update board set bhitcount=? where bno=?";

		jdbcTemplate.update(sql, bhitcount, bno); // 리턴값 : 업데이트 된 행의 개수
		LOGGER.info("UPDATE 성공");
	}

	@Override
	public void boardUpdate(Exam12Board board) {

		String sql;
		if (board.getBoriginalfilename() != null) {
			sql = "update board set btitle=?, bcontent=?, bpassword=?, boriginalfilename=?, bdate=sysdate, bsavedfilename=?, bfilecontent=? where bno=?";
			jdbcTemplate.update(sql, board.getBtitle(), board.getBcontent(), board.getBpassword(),
					board.getBoriginalfilename(), board.getBsavedfilename(), board.getBfilecontent(), board.getBno());
		} else {
			sql = "update board set btitle=?, bcontent=?, bpassword=?, bdate=sysdate where bno=?";
			jdbcTemplate.update(sql, board.getBtitle(), board.getBcontent(), board.getBpassword(), board.getBno());
		}
		LOGGER.info("UPDATE 성공");
	}

	@Override
	public void boardDelete(int bno) {

		String sql = "delete from board where bno=?";

		jdbcTemplate.update(sql, bno);
		LOGGER.info("UPDATE 성공");

	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public String memberInsert(Exam12Member member) {

		String sql = "insert into member ";
		sql += "(mid, mname, mpassword, mdate, mtel, memail, mage, maddress, moriginalfilename, msavedfilename, mfilecontent) ";
		sql += "values ";
		sql += "(?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?) ";

		jdbcTemplate.update(sql, member.getMid(), member.getMname(), member.getMpassword(), member.getMtel(),
				member.getMemail(), member.getMage(), member.getMaddress(), member.getMoriginalfilename(),
				member.getMsavedfilename(), member.getMfilecontent());
		LOGGER.info("행 추가 성공");

		return member.getMid();
	}

	@Override
	public List<Exam12Member> memberSelectAll() {

		String sql = "select mid, mname, mtel, memail, mage, maddress ";
		sql += "from member ";
		sql += "order by mid asc";

		RowMapper<Exam12Member> rowMapper = new RowMapper<Exam12Member>() {
			@Override
			public Exam12Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Exam12Member member = new Exam12Member();
				member.setMid(rs.getString("mid"));
				member.setMname(rs.getString("mname"));
				member.setMdate(rs.getDate("mdate"));
				member.setMtel(rs.getString("mtel"));
				member.setMemail(rs.getString("memail"));
				member.setMage(rs.getInt("mage"));
				member.setMaddress(rs.getString("maddress"));
				return member;
			}
		};

		List<Exam12Member> list = jdbcTemplate.query(sql, rowMapper);

		return list;
	}

	@Override
	public List<Exam12Member> memberSelectPage(int pageNo, int rowsPerPage) {

		String sql = "select * ";
		sql += "from ( ";
		sql += "  select rownum as r, mid, mname, mdate, mtel, memail, mage, maddress ";
		sql += "  from ( ";
		sql += "  select mid, mname, mdate, mtel, memail, mage, maddress from member order by mid asc ";
		sql += "  ) ";
		sql += "  where rownum<=? ";
		sql += ") ";
		sql += "where r>=? ";

		Object[] args = { (pageNo * rowsPerPage), ((pageNo - 1) * rowsPerPage + 1) };
		RowMapper<Exam12Member> rowMapper = new RowMapper<Exam12Member>() {
			@Override
			public Exam12Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Exam12Member member = new Exam12Member();
				member.setMid(rs.getString("mid"));
				member.setMname(rs.getString("mname"));
				member.setMdate(rs.getDate("mdate"));
				member.setMtel(rs.getString("mtel"));
				member.setMemail(rs.getString("memail"));
				member.setMage(rs.getInt("mage"));
				member.setMaddress(rs.getString("maddress"));
				return member;
			}
		};

		List<Exam12Member> list = jdbcTemplate.query(sql, args, rowMapper);
		return list;
	}

	@Override
	public int memberCountAll() {

		String sql = "select count(*) from member";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);

		LOGGER.info("SELECT 성공");

		return count;
	}

	@Override
	public Exam12Member memberSelectByMid(String mid) {

		String sql = "select * from member where mid=?";

		RowMapper<Exam12Member> rowMapper = new RowMapper<Exam12Member>() {
			@Override
			public Exam12Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Exam12Member member = new Exam12Member();
				member.setMid(rs.getString("mid"));
				member.setMpassword(rs.getString("mpassword"));
				member.setMname(rs.getString("mname"));
				member.setMdate(rs.getDate("mdate"));
				member.setMtel(rs.getString("mtel"));
				member.setMemail(rs.getString("memail"));
				member.setMage(rs.getInt("mage"));
				member.setMaddress(rs.getString("maddress"));
				member.setMoriginalfilename(rs.getString("moriginalfilename"));
				member.setMsavedfilename(rs.getString("msavedfilename"));
				member.setMfilecontent(rs.getString("mfilecontent"));
				return member;
			}
		};
		Exam12Member member = jdbcTemplate.queryForObject(sql, rowMapper, mid);
		LOGGER.info("SELECT 성공");

		return member;
	}

	@Override
	public void memberUpdate(Exam12Member member) {

		String sql;
		if (member.getMoriginalfilename() != null) {
			sql = "update member set mname=?, mpassword=?, mdate=sysdate, mtel=?, memail=?, mage=?, maddress=?, moriginalfilename=?, msavedfilename=?, mfilecontent=? where mid=?";
			jdbcTemplate.update(sql, member.getMname(), member.getMpassword(), member.getMtel(), member.getMemail(),
					member.getMage(), member.getMaddress(), member.getMoriginalfilename(), member.getMsavedfilename(),
					member.getMfilecontent(), member.getMid());
		} else {
			sql = "update member set mname=?, mpassword=?, mdate=sysdate, mtel=?, memail=?, mage=?, maddress=? where mid=?";
			jdbcTemplate.update(sql, member.getMname(), member.getMpassword(), member.getMtel(), member.getMemail(),
					member.getMage(), member.getMaddress(), member.getMid());
		}

		LOGGER.info("UPDATE 성공");

	}

	@Override
	public void memberDelete(String mid) {

		String sql = "delete from member where mid=?";
		jdbcTemplate.update(sql, mid);
		LOGGER.info("UPDATE 성공");
	}

}
