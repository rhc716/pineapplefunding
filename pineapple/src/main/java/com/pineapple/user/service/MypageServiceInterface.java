package com.pineapple.user.service;

public interface MypageServiceInterface {
	//회원상세정보 수정을 위한 메서드 선언
	int updateUserDetail(UserDetail userdetail);
	
	//회원상세정보 조회를 위한 메서드 선언
	UserDetail selectUserDetail(String userDetailId);
	
	//첫페이지 구성을 위한 회원정보와 계좌정보 호출
	User selectInvestorBasic(String id);
}
