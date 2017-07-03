package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.exception.NoAccountException;
import com.mycompany.myapp.service.Exam15Service;

@Controller
public class Exam15TransactionController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Exam15TransactionController.class);
	
	@Autowired
	private Exam15Service service;

	@RequestMapping(value = "/transaction/exam01", method = RequestMethod.GET)
	public String exam01Get() {
		return "transaction/exam01";
	}

	// 예외처리는 controller에서 한다.
	// 방법1: 해당 컨트롤러에서 처리 @ExceptionHandler
	// 방법2: 컨트롤러 전체를 대상으로 처리 @ControllerAdvice
	@RequestMapping(value = "/transaction/exam01", method = RequestMethod.POST)
	public String exam01Post(String fromAno, String toAno, int amount) {
		service.transfer(fromAno, toAno, amount);
		return "redirect:/";
	}

	@ExceptionHandler
	public String handleNoAccountException(NoAccountException e, Model model) {
		LOGGER.info("실행");
		model.addAttribute("reason", e.getMessage());
		return "transaction/exam02";
	}
}
