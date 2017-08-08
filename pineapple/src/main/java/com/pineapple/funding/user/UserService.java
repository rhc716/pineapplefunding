package com.pineapple.funding.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDao dao;
	
	public int addUser(User user) {
		System.out.println("service addUser 호출");
		return dao.insertUser(user);
	}
}
