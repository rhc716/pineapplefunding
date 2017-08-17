package com.pineapple.user.service;

public interface MypageDaoInterface {
	
	//회원상세정보 수정을 위한 메서드 선언
	int modifyUserDetail(UserDetail userdetail);
	
	//회원상세정보조회를 위한 메서드 선언
	UserDetail getUserDetail(String userDetailId);
	
	//투자자 권한일 때, 투자자 마이페이지 요청(첫화면-회원정보, 계좌정보)
	User getInvestorBasic(String userId);
}
