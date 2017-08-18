package com.pineapple.user.service;

import java.util.Map;

public interface UserDaoInterface {
	
	//투자자, 사이트관리자의 계좌삭제 메서드 선언
	int deleteAccountByAccountNumber(String accountNumber);
	
	//투자자, 사이트관리자의 계좌조회 메서드 선언
	Account selectAccountByAccountNumber(String accountNumber);
	
	//투자자, 사이트관리자의 새로운 계좌등록 메서드 선언
	int insertAccount(Account account);
	
	//비밀번호 변경을 위한 메서드 선언
	int updateUserPw(Map map);
	
	//회원상세정보조회를 위한 메서드 선언
	UserDetail selectUserDetail(String userDetailId);
	
	//회원상세정보입력 처리를 위한 메서드 선언
	int insertUserDetail(UserDetail userdetail);
	
	//로그인 요청 처리를 위한 권한명을 포함한 회원 정보 호출
	UserAndLevelAndEmployeeAndCompanyAndRank selectUserByIdWithLevelnameRankname(String userId);
	
	//회원가입 닉네임 중복체크 ajax를 위한 닉네임 데이터 호출
	User selectUserByNickname(String nickname);

	//회원가입 이메일아이디 중복체크 ajax, 로그인을 위한 회원아이디 데이터 호출
	User selectUserById(String userId);

	//회원가입하기 회원기본정보 입력
	int insertUser(User user);

}