package com.mycompany.myapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Exam14AopController {
	private static final Logger LOGGER = LoggerFactory.getLogger(Exam14AopController.class);

	@RequestMapping("/aop/exam01")
	public String exam01(HttpSession session) {
		session.setAttribute("mid", "wjdtpa2");
		return "aop/exam01";
	}

	@RequestMapping("/aop/exam02Write")
	public String exam02Write(HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		LOGGER.info(mid);
		return "aop/exam02";
	}

	@RequestMapping("/aop/exam02Update")
	public String exam02Update() {
		return "aop/exam02";
	}

}
