package com.pineapple.user.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserServiceInterface {

	//비밀번호 변경을 위한 메서드 선언
	int modifyUserPw(Map map);
	
	//회원상세정보조회를 위한 메서드 선언
	UserDetail getUserDetail(String userDetailId);
	
	//회원상세정보입력 처리를 위한 메서드 선언
	int addUserDetail(UserDetail userdetail);
	
	//로그인 요청 처리를 위한 권한명을 포함한 회원 정보 선언
	UserAndLevelAndEmployeeAndCompanyAndRank gettUserByIdLevelnameRankname(String userId);
	
	//회원가입시 닉네임 중복체크 기능을 위한 dao 메서드 선언
	User getUserByNickname(String nickname);

	//회원가입시 아이디 중복체크 기능,로그인을 위한 dao 메서드 선언
	User getUser(String userId);

	//회원가입시 회원정보 입력하기 위한 dao 메서드 선언
	int addUser(User user);

}