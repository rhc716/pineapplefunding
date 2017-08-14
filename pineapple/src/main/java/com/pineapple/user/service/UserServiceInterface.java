package com.pineapple.user.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserServiceInterface {
	//로그인시 로그인 처리
	User getUserByIdPw(String userId, String pw);
	
	//회원가입시 닉네임 중복체크 기능을 위한 dao 메서드 호출
	User getUserByNickname(String nickname);

	//회원가입시 아이디 중복체크 기능을 위한 dao 메서드 호출
	User getUser(String userId);

	//회원가입시 회원정보 입력하기 위한 dao 메서드 호출
	int addUser(User user);

}