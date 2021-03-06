package com.mycompany.myapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.Exam10Dao3;

@Component
public class Exam10Service6Impl implements Exam10Service6 {

	// @Autowired 는 Type을 기준으로 한다.
	@Resource(name = "exam10Dao3ImplA")
	private Exam10Dao3 exam10Dao;

	@Override
	public void join() {
		exam10Dao.insert();
	}

	@Override
	public void login() {
		exam10Dao.select();
	}

}
