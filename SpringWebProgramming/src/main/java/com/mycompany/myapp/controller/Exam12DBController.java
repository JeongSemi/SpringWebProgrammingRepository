package com.mycompany.myapp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.dto.Exam12Board;
import com.mycompany.myapp.dto.Exam12Member;
import com.mycompany.myapp.service.Exam12Service;

@Controller
public class Exam12DBController {

	@Resource(name = "exam12ServiceImpl3")
	private Exam12Service service;

	@Autowired
	private ServletContext servletContext;

	@RequestMapping("/jdbc/exam01")
	public String exam01() {
		Exam12Board board = new Exam12Board();
		board.setBtitle("제목");
		board.setBcontent("내용");
		board.setBwriter("홍길동");
		board.setBpassword("iot12345");
		board.setBoriginalfilename("a.png");
		board.setBsavedfilename("a.png");
		board.setBfilecontent("image/png");
		service.boardWrite(board);

		return "redirect:/"; // home으로 돌아감
	}

	@RequestMapping(value = "/jdbc/exam02", method = RequestMethod.GET)
	public String exam02Get() {

		return "jdbc/exam02";
	}

	@RequestMapping(value = "/jdbc/exam02", method = RequestMethod.POST)
	public String exam02Post(Exam12Board board) throws Exception { // board ->
																	// 커맨드객체
		// 첨부 파일에 대한 정보를 컬럼값으로 설정
		board.setBoriginalfilename(board.getBattach().getOriginalFilename());
		board.setBfilecontent(board.getBattach().getContentType());
		String fileName = new Date().getTime() + "-" + board.getBoriginalfilename();
		board.setBsavedfilename(fileName);

		// 첨부파일을 서버 로컬 시스템에 저장
		String realPath = servletContext.getRealPath("/WEB-INF/upload/");
		File file = new File(realPath + fileName);
		board.getBattach().transferTo(file);

		// 서비스객체로 요청 처리
		service.boardWrite(board);
		return "redirect:/jdbc/exam05";
	}

	@RequestMapping(value = "/jdbc/exam03", method = RequestMethod.GET)
	public String exam03Get() {

		return "jdbc/exam03";
	}

	@RequestMapping(value = "/jdbc/exam03", method = RequestMethod.POST)
	public String exam03Post(Exam12Member member) throws Exception { // board ->
																		// 커맨드객체
		// 첨부 파일에 대한 정보를 컬럼값으로 설정
		System.out.println("1");
		member.setMoriginalfilename(member.getMattach().getOriginalFilename());
		member.setMfilecontent(member.getMattach().getContentType());
		String fileName = new Date().getTime() + "-" + member.getMoriginalfilename();
		member.setMsavedfilename(fileName);

		// 첨부파일을 서버 로컬 시스템에 저장
		System.out.println("2");
		String realPath = servletContext.getRealPath("/WEB-INF/upload/");
		File file = new File(realPath + fileName);
		member.getMattach().transferTo(file);
		System.out.println("3");
		// 서비스객체로 요청 처리
		service.memberJoin(member);
		System.out.println("4");
		return "redirect:/";
	}

	@RequestMapping("/jdbc/exam04")
	public String exam04(Model model) {
		List<Exam12Board> list = service.boardListAll();
		model.addAttribute("list", list);
		return "jdbc/exam04";
	}

	@RequestMapping("/jdbc/exam05")
	public String exam05(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		// 한 페이지를 구성하는 행 수
		int rowsPerPage = 10;
		// 한 그룹을 구성하는 페이지 수
		int pagesPerGroup = 7;
		// 총 행 수
		int totalRows = service.boardTotalRows();
		// 전체 페이지 수
		int totalPageNo = totalRows / rowsPerPage + ((totalRows % rowsPerPage != 0) ? 1 : 0);
		// 전체 그룹 수
		int totalGroupNo = totalPageNo / pagesPerGroup + ((totalPageNo % pagesPerGroup != 0) ? 1 : 0);
		// 현재 그룹 번호
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;
		// 현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		// 현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if (groupNo == totalGroupNo) {
			endPageNo = totalPageNo;
		}

		// 현재 페이지의 행의 데이터 가져오기
		List<Exam12Board> list = service.boardListPage(pageNo, rowsPerPage);

		// View로 넘겨줄 데이터
		model.addAttribute("list", list);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);

		// View 이름 리턴
		return "jdbc/exam05";
	}

	@RequestMapping("/jdbc/exam05Detail")
	public String exam05Detail(int bno, Model model) {
		Exam12Board board = service.getBoard(bno);
		model.addAttribute("board", board);

		return "jdbc/exam05Detail";
	}

	@RequestMapping("/jdbc/exam05CheckBpassword")
	public String exam05CheckBpassword(int bno, String bpassword, Model model) {
		String result = service.boardCheckBpassword(bno, bpassword);
		model.addAttribute("result", result);
		return "jdbc/exam05CheckBpassword";
	}

	@RequestMapping(value = "/jdbc/exam05Update", method = RequestMethod.GET)
	public String exam05UpdateGet(int bno, Model model) {
		Exam12Board board = service.getBoard(bno);
		model.addAttribute("board", board);
		return "jdbc/exam05Update";
	}

	@RequestMapping(value = "/jdbc/exam05Update", method = RequestMethod.POST)
	public String exam05UpdatePost(Exam12Board board) throws Exception {
		// 첨부파일이 변경되었는지 검사
		if (!board.getBattach().isEmpty()) {
			board.setBoriginalfilename(board.getBattach().getOriginalFilename());
			board.setBfilecontent(board.getBattach().getContentType());
			String fileName = new Date().getTime() + "-" + board.getBoriginalfilename();
			board.setBsavedfilename(fileName);

			// 첨부파일을 서버 로컬 시스템에 저장
			String realPath = servletContext.getRealPath("/WEB-INF/upload/");
			File file = new File(realPath + fileName);
			board.getBattach().transferTo(file);
		}
		// 게시물 수정처리
		service.boardUpdate(board);
		return "redirect:/jdbc/exam05Detail?bno=" + board.getBno();
	}

	@RequestMapping("/jdbc/exam05Delete")
	public String exam05Delete(int bno) {
		service.boardDelete(bno);
		return "redirect:/jdbc/exam05";
	}

	@RequestMapping("/jdbc/exam06")
	public String exam06(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		// 한 페이지를 구성하는 행 수
		int rowsPerPage = 10;
		// 한 그룹을 구성하는 페이지 수
		int pagesPerGroup = 5;
		// 총 행 수
		int totalRows = service.memberTotalRows();
		// 전체 페이지 수
		int totalPageNo = totalRows / rowsPerPage + ((totalRows % rowsPerPage != 0) ? 1 : 0);
		// 전체 그룹 수
		int totalGroupNo = totalPageNo / pagesPerGroup + ((totalPageNo % pagesPerGroup != 0) ? 1 : 0);
		// 현재 그룹 번호
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;
		// 현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		// 현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if (groupNo == totalGroupNo) {
			endPageNo = totalPageNo;
		}

		// 현재 페이지의 행의 데이터 가져오기
		List<Exam12Member> list = service.memberListPage(pageNo, rowsPerPage);

		// View로 넘겨줄 데이터
		model.addAttribute("list", list);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);

		// View 이름 리턴
		return "jdbc/exam06";
	}

	@RequestMapping("/jdbc/exam06Detail")
	public String exam06(String mid, Model model) {
		Exam12Member member = service.getMember(mid);
		model.addAttribute("member", member);
		return "jdbc/exam06Detail";
	}

	@RequestMapping("/jdbc/exam06CheckMpassword")
	public String exam06CheckMpassword(String mid, String mpassword, Model model) {
		String result = service.memberCheckMpassword(mid, mpassword);
		model.addAttribute("result", result);
		return "jdbc/exam06CheckMpassword";
	}

	@RequestMapping(value = "/jdbc/exam06Update", method = RequestMethod.GET)
	public String exam06UpdateGet(String mid, Model model) {
		Exam12Member member = service.getMember(mid);
		model.addAttribute("member", member);
		return "jdbc/exam06Update";
	}

	@RequestMapping(value = "/jdbc/exam06Update", method = RequestMethod.POST)
	public String exam06UpdatePost(Exam12Member member) throws Exception {
		if (!member.getMattach().isEmpty()) {
			member.setMoriginalfilename(member.getMattach().getOriginalFilename());
			member.setMfilecontent(member.getMattach().getContentType());
			String fileName = new Date().getTime() + "-" + member.getMoriginalfilename();
			member.setMsavedfilename(fileName);

			// 첨부파일을 서버 로컬 시스템에 저장
			String realPath = servletContext.getRealPath("/WEB-INF/upload/");
			File file = new File(realPath + fileName);
			member.getMattach().transferTo(file);
		}
		// 게시물 수정처리
		service.memberUpdate(member);
		System.out.println(member.getMid());
		return "redirect:/jdbc/exam06Detail?mid=" + member.getMid();
	}

	@RequestMapping("/jdbc/exam06Delete")
	public String exam06Delete(String mid) {
		service.memberDelete(mid);
		return "redirect:/jdbc/exam06";
	}

}
