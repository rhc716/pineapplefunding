package com.pineapple.user.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserServiceInterface {
	
	//로그인 요청 처리를 위한 권한명을 포함한 회원 정보 호출
	UserAndLevelAndEmployeeAndCompanyAndRank gettUserByIdLevelnameRankname(String userId);
	
	//회원가입시 닉네임 중복체크 기능을 위한 dao 메서드 호출
	User getUserByNickname(String nickname);

	//회원가입시 아이디 중복체크 기능,로그인을 위한 dao 메서드 호출
	User getUser(String userId);

	//회원가입시 회원정보 입력하기 위한 dao 메서드 호출
	int addUser(User user);

}