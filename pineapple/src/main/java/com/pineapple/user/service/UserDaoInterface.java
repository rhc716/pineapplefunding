package com.pineapple.user.service;

public interface UserDaoInterface {
	
	//로그인 요청 처리를 위한 권한명을 포함한 회원 정보 호출
	UserAndLevel selectUserByIdWithLevelname(String userId);
	
	//회원가입 닉네임 중복체크 ajax를 위한 닉네임 데이터 호출
	User selectUserByNickname(String nickname);

	//회원가입 이메일아이디 중복체크 ajax, 로그인을 위한 회원아이디 데이터 호출
	User selectUserById(String userId);

	//회원가입하기 회원기본정보 입력
	int insertUser(User user);

}