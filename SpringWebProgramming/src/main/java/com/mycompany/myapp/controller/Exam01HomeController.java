package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Exam01HomeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(Exam01HomeController.class);

	@RequestMapping("/") // 요청 메세지(/home일경우
							// ->localhost:8080/WebApplication/home)
	public String home() {
		LOGGER.info("/ 요청 처리함");
		System.out.println("home");
		return "home";
	}

}
