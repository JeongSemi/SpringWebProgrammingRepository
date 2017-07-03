package com.mycompany.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Exam12Board;
import com.mycompany.myapp.dto.Exam12Member;

@Component
public class Exam12DaoImpl3 implements Exam12Dao {
	private static final Logger LOGGER = LoggerFactory.getLogger(Exam12DaoImpl3.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int boardInsert(Exam12Board board) {

		sqlSessionTemplate.insert("board.insert", board); // 삽입된 행의 갯수를 리턴(무조건
															// 1이라고 보면됨)
		int bno = board.getBno();

		LOGGER.info("행 추가 성공");
		return bno;
	}

	@Override
	public List<Exam12Board> boardSelectAll() {
		List<Exam12Board> list = sqlSessionTemplate.selectList("board.selectAll");
		LOGGER.info("SELECT 성공");

		return list;
	}

	@Override
	public List<Exam12Board> boardSelectPage(int pageNo, int rowsPerPage) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", (pageNo - 1) * rowsPerPage + 1);
		map.put("endNum", pageNo * rowsPerPage);
		List<Exam12Board> list = sqlSessionTemplate.selectList("board.selectByPage", map);
		LOGGER.info("SELECT 성공");

		return list;
	}

	@Override
	public int boardCountAll() {
		int count = sqlSessionTemplate.selectOne("board.countAll");

		return count;
	}

	@Override
	public Exam12Board boardSelectByBno(int bno) {

		Exam12Board board = sqlSessionTemplate.selectOne("board.selectByBno", bno);
		LOGGER.info("SELECT 성공");

		return board;
	}

	@Override
	public void boardUpdateBhitcount(int bno, int bhitcount) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bhitcount", bhitcount);
		map.put("bno", bno);

		sqlSessionTemplate.update("board.updateBhitcount", map);
		LOGGER.info("UPDATE 성공");
	}

	@Override
	public void boardUpdate(Exam12Board board) {

		sqlSessionTemplate.update("board.update", board);
		LOGGER.info("UPDATE 성공");
	}

	@Override
	public void boardDelete(int bno) {

		sqlSessionTemplate.delete("board.delete", bno);
		LOGGER.info("DELETE 성공");

	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public String memberInsert(Exam12Member member) {

		sqlSessionTemplate.update("member.insert");
		LOGGER.info("행 추가 성공");

		return member.getMid();
	}

	@Override
	public List<Exam12Member> memberSelectAll() {

		List<Exam12Member> list = sqlSessionTemplate.selectList("member.selectAll");
		LOGGER.info("SELECT 성공");
		return list;
	}

	@Override
	public List<Exam12Member> memberSelectPage(int pageNo, int rowsPerPage) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", (pageNo - 1) * rowsPerPage + 1);
		map.put("endNum", pageNo * rowsPerPage);

		List<Exam12Member> list = sqlSessionTemplate.selectList("member.selectPage", map);
		LOGGER.info("SELECT 성공");
		return list;
	}

	@Override
	public int memberCountAll() {

		int count = sqlSessionTemplate.selectOne("member.countAll");
		LOGGER.info("SELECT 성공");

		return count;
	}

	@Override
	public Exam12Member memberSelectByMid(String mid) {

		Exam12Member member = sqlSessionTemplate.selectOne("member.selectByMid", mid);
		LOGGER.info("SELECT 성공");

		return member;
	}

	@Override
	public void memberUpdate(Exam12Member member) {

		sqlSessionTemplate.update("member.update", member);
		LOGGER.info("UPDATE 성공");

	}

	@Override
	public void memberDelete(String mid) {

		sqlSessionTemplate.delete("member.delete", mid);

		LOGGER.info("UPDATE 성공");
	}

}
