package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Exam12Board;
import com.mycompany.myapp.dto.Exam12Member;

@Component
public class Exam12DaoImpl implements Exam12Dao {
	private static final Logger LOGGER = LoggerFactory.getLogger(Exam12DaoImpl.class);

	@Autowired
	private DataSource dataSource;

	@Override
	public int boardInsert(Exam12Board board) {
		int bno = -1;
		Connection conn = null;
		try {
			// JDBC Driver 클래스 로딩
//			Class.forName("oracle.jdbc.OracleDriver");
			// 연결 문자열 작성
//			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			// 연결 객체 얻기

//			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			conn = dataSource.getConnection();
			
			LOGGER.info("연결 성공");
			// 매개변수화 된 SQL문 작성
			String sql = "insert into board ";
			sql += "(bno, btitle, bcontent, bwriter, bdate, bpassword, bhitcount, boriginalfilename, bsavedfilename, bfilecontent) ";
			sql += "values ";
			sql += "(board_bno_seq.nextval, ?, ?, ?, sysdate, ?, 0, ?, ?, ?) ";
			// SQL문을 전송해서 실행
			// 테이블 정의시 컬럼의 속성으로 자동 증가를 지정할 수 있는 DB일 경우(MySQL, MS SQL)
			// PreparedStatement pstmt = conn.prepareStatement(sql,
			// Statement.RETURN_GENERATED_KEYS);
			// 오라클일 경우 Sequence 외부 객체로 자동 증가값을 얻기 떄문에 다음과 같이 지정
			PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "bno" });
			pstmt.setString(1, board.getBtitle());
			pstmt.setString(2, board.getBcontent());
			pstmt.setString(3, board.getBwriter());
			pstmt.setString(4, board.getBpassword());
			pstmt.setString(5, board.getBoriginalfilename());
			pstmt.setString(6, board.getBsavedfilename());
			pstmt.setString(7, board.getBfilecontent());
			pstmt.executeUpdate(); // 수정X, DB의 상태를 변경시켜라
			ResultSet rs = pstmt.getGeneratedKeys();
			rs.next();
			bno = rs.getInt(1);
			pstmt.close();
			LOGGER.info("행 추가 성공");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 연결 끊기
			try {
				conn.close();
				LOGGER.info("연결 끊김");
			} catch (SQLException e) {
			}
		}
		return bno;
	}

	@Override
	public List<Exam12Board> boardSelectAll() {
		List<Exam12Board> list = new ArrayList<>();
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select bno, btitle, bwriter, bdate, bhitcount ";
			sql += "from board ";
			sql += "order by bno desc";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 수정X, DB의 상태를 변경시켜라
			while (rs.next()) {
				Exam12Board board = new Exam12Board();
				board.setBno(rs.getInt("bno"));
				board.setBtitle(rs.getString("btitle"));
				board.setBwriter(rs.getString(3));
				board.setBdate(rs.getDate("bdate"));
				board.setBhitcount(rs.getInt("bhitcount"));
				list.add(board);
			}
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public List<Exam12Board> boardSelectPage(int pageNo, int rowsPerPage) {
		List<Exam12Board> list = new ArrayList<>();
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select * ";
			sql += "from ( ";
			sql += "  select rownum as r, bno, btitle, bwriter, bdate, bhitcount ";
			sql += "  from ( ";
			sql += "  select bno, btitle, bwriter, bdate, bhitcount from board order by bno desc ";
			sql += "  ) ";
			sql += "  where rownum<=? ";
			sql += ") ";
			sql += "where r>=? ";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNo * rowsPerPage);
			pstmt.setInt(2, (pageNo - 1) * rowsPerPage + 1);
			ResultSet rs = pstmt.executeQuery(); // 수정X, DB의 상태를 변경시켜라
			while (rs.next()) {
				Exam12Board board = new Exam12Board();
				board.setBno(rs.getInt("bno"));
				board.setBtitle(rs.getString("btitle"));
				board.setBwriter(rs.getString(4));
				board.setBdate(rs.getDate("bdate"));
				board.setBhitcount(rs.getInt("bhitcount"));
				list.add(board);
			}
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public int boardCountAll() {
		int count = 0;
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select count(*) from board";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 수정X, DB의 상태를 변경시켜라
			rs.next();
			count = rs.getInt(1);
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return count;
	}

	@Override
	public Exam12Board boardSelectByBno(int bno) {
		Exam12Board board = null;
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select * from board where bno=?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery(); // 수정X, DB의 상태를 변경시켜라
			if (rs.next()) {
				board = new Exam12Board();
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
			}
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return board;
	}

	@Override
	public void boardUpdateBhitcount(int bno, int bhitcount) {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "update board set bhitcount=? where bno=?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bhitcount);
			pstmt.setInt(2, bno);
			pstmt.executeUpdate(); // 수정X, DB의 상태를 변경시켜라
			pstmt.close();
			LOGGER.info("UPDATE 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void boardUpdate(Exam12Board board) {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql;
			if (board.getBoriginalfilename() != null) {
				sql = "update board set btitle=?, bcontent=?, bpassword=?, boriginalfilename=?, bdate=sysdate, bsavedfilename=?, bfilecontent=? where bno=?";
			} else {
				sql = "update board set btitle=?, bcontent=?, bpassword=?, bdate=sysdate where bno=?";
			}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBtitle());
			pstmt.setString(2, board.getBcontent());
			pstmt.setString(3, board.getBpassword());
			if (board.getBoriginalfilename() != null) {
				pstmt.setString(4, board.getBoriginalfilename());
				pstmt.setString(5, board.getBsavedfilename());
				pstmt.setString(6, board.getBfilecontent());
				pstmt.setInt(7, board.getBno());
			} else {
				pstmt.setInt(4, board.getBno());
			}
			pstmt.executeUpdate();
			pstmt.close();
			LOGGER.info("UPDATE 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void boardDelete(int bno) {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "delete from board where bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate(); // insert, update, delete
			pstmt.close();
			LOGGER.info("UPDATE 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public String memberInsert(Exam12Member member) {
		String mid = null;
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "insert into member ";
			sql += "(mid, mname, mpassword, mdate, mtel, memail, mage, maddress, moriginalfilename, msavedfilename, mfilecontent) ";
			sql += "values ";
			sql += "(?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?) ";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMname());
			pstmt.setString(3, member.getMpassword());
			pstmt.setString(4, member.getMtel());
			pstmt.setString(5, member.getMemail());
			pstmt.setInt(6, member.getMage());
			pstmt.setString(7, member.getMaddress());
			pstmt.setString(8, member.getMoriginalfilename());
			pstmt.setString(9, member.getMsavedfilename());
			pstmt.setString(10, member.getMfilecontent());
			pstmt.executeUpdate(); // 수정X, DB의 상태를 변경시켜라
			// 리턴값 설정(primary key)
			mid = member.getMid();
			pstmt.close();
			LOGGER.info("행 추가 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mid;
	}

	@Override
	public List<Exam12Member> memberSelectAll() {

		List<Exam12Member> list = new ArrayList<>();
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select mid, mname, mtel, memail, mage, maddress ";
			sql += "from member ";
			sql += "order by mid asc";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Exam12Member member = new Exam12Member();
				member.setMid(rs.getString("mid"));
				member.setMname(rs.getString("mname"));
				member.setMdate(rs.getDate("mdate"));
				member.setMtel(rs.getString("mtel"));
				member.setMemail(rs.getString("memail"));
				member.setMage(rs.getInt("mage"));
				member.setMaddress(rs.getString("maddress"));
				list.add(member);
			}
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public List<Exam12Member> memberSelectPage(int pageNo, int rowsPerPage) {
		List<Exam12Member> list = new ArrayList<>();
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select * ";
			sql += "from ( ";
			sql += "  select rownum as r, mid, mname, mdate, mtel, memail, mage, maddress ";
			sql += "  from ( ";
			sql += "  select mid, mname, mdate, mtel, memail, mage, maddress from member order by mid asc ";
			sql += "  ) ";
			sql += "  where rownum<=? ";
			sql += ") ";
			sql += "where r>=? ";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNo * rowsPerPage);
			pstmt.setInt(2, (pageNo - 1) * rowsPerPage + 1);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Exam12Member member = new Exam12Member();
				member.setMid(rs.getString("mid"));
				member.setMname(rs.getString("mname"));
				member.setMdate(rs.getDate("mdate"));
				member.setMtel(rs.getString("mtel"));
				member.setMemail(rs.getString("memail"));
				member.setMage(rs.getInt("mage"));
				member.setMaddress(rs.getString("maddress"));
				list.add(member);
			}
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public int memberCountAll() {
		int count = 0;
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select count(*) from member";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 수정X, DB의 상태를 변경시켜라
			rs.next();
			count = rs.getInt(1);
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return count;
	}

	@Override
	public Exam12Member memberSelectByMid(String mid) {
		Exam12Member member = null;
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "select * from member where mid=?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new Exam12Member();
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
			}
			rs.close();
			pstmt.close();
			LOGGER.info("SELECT 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}

	@Override
	public void memberUpdate(Exam12Member member) {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql;
			if (member.getMoriginalfilename() != null) {
				sql = "update member set mname=?, mpassword=?, mdate=sysdate, mtel=?, memail=?, mage=?, maddress=?, moriginalfilename=?, msavedfilename=?, mfilecontent=? where mid=?";
			} else {
				sql = "update member set mname=?, mpassword=?, mdate=sysdate, mtel=?, memail=?, mage=?, maddress=? where mid=?";
			}

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMname());
			pstmt.setString(2, member.getMpassword());
			pstmt.setString(3, member.getMtel());
			pstmt.setString(4, member.getMemail());
			pstmt.setInt(5, member.getMage());
			pstmt.setString(6, member.getMaddress());
			if (member.getMoriginalfilename() != null) {
				pstmt.setString(7, member.getMoriginalfilename());
				pstmt.setString(8, member.getMsavedfilename());
				pstmt.setString(9, member.getMfilecontent());
				pstmt.setString(10, member.getMid());
			} else {
				pstmt.setString(7, member.getMid());
			}
			pstmt.executeUpdate();
			pstmt.close();
			LOGGER.info("UPDATE 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void memberDelete(String mid) {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url, "iotuser", "iot12345");
			LOGGER.info("연결 성공");

			String sql = "delete from member where mid=?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			LOGGER.info("UPDATE 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
