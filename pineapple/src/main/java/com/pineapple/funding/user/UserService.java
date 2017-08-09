package com.pineapple.funding.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDao dao;
	
	//회원가입시 아이디 중복체크 기능을 위한 dao 메서드 호출
	public String getUser(String userId){
		System.out.println("service getUser 호출 : "+dao.selectUserById(userId).getUserId());
		if(userId != dao.selectUserById(userId).getUserId()){
			return userId;
		}else{
			return "아이디중복";
		}
	}
	
	//회원가입시 회원정보 입력하기 위한 dao 메서드 호출
	public int addUser(User user) {
		System.out.println("service addUser 호출");
		return dao.insertUser(user);
	}
}
