package com.mycompany.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.myapp.dao.Exam15Dao;
import com.mycompany.myapp.dto.Exam15Account;
import com.mycompany.myapp.exception.NoAccountException;

@Component
public class Exam15ServiceImpl implements Exam15Service {

	@Autowired
	Exam15Dao dao;

	@Override
	public Exam15Account getAccount(String ano) {
		return dao.selectByAno(ano);
	}

	@Override
	public void deposit(String ano, int amount) {
		Exam15Account account = dao.selectByAno(ano);
		account.setAbalance(account.getAbalance() + amount);

		dao.update(account);
	}

	@Override
	public void withdraw(String ano, int amount) {
		Exam15Account account = dao.selectByAno(ano);
		account.setAbalance(account.getAbalance() - amount);

		dao.update(account);
	}

	// 트랜잭션처리는 서비스에서만 한다. (dao, controller X)
	// 반드시 RuntimeException발생
	// Spring설정파일에서 TransactionManager설정
	// 트랜잭션 처리가 필요한 메소드에 @Transactional 어노테이션을 붙인다.
	@Override
	@Transactional
	public void transfer(String fromAno, String toAno, int amount) throws NoAccountException {
		Exam15Account fromAccount, toAccount;
		fromAccount = dao.selectByAno(fromAno);
		if (fromAccount != null) {
			fromAccount.setAbalance(fromAccount.getAbalance() - amount);
			dao.update(fromAccount);
		} else {
			throw new NoAccountException("출금 계좌가 존재하지 않음");
		}

		toAccount = dao.selectByAno(toAno);
		if (toAccount != null) {
			toAccount.setAbalance(toAccount.getAbalance() + amount);
			dao.update(toAccount);
		} else {
			throw new NoAccountException("입금 계좌가 존재하지 않음");
		}

	}

}
