package com.pineapple.user.service;

public interface MypageDaoInterface {
	
	//투자자 권한일 때, 투자자 마이페이지 요청(첫화면-회원정보, 계좌정보)
	User getUser(String userId);
	
	Account getAccount(String userId);
	
}
