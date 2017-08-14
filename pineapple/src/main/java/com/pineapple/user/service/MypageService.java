package com.pineapple.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageService implements MypageServiceInterface {
	
	@Autowired
	private MypageDaoInterface mypagedao;

	//투자자 마이페이지 첫화면 구성을 위한 투자자 기본 정보와 계좌 정보 조회 메서드
	@Override
	public User selectInvestorBasic(String userId) {
		System.out.println("MypageService selectInvestorBasic 메서드 호출"+userId);
		return mypagedao.getInvestorBasic(userId);
	}

}
