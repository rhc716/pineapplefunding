package com.pineapple.user.service;

public interface MypageServiceInterface {
	
	//첫페이지 구성을 위한 회원정보와 계좌정보 호출
	User selectInvestor(String userId);

	Account selectAccount(String userId);
	
	//첫페이지 구성을 위한 회원정보와 계좌정보 호출
	
	
}
