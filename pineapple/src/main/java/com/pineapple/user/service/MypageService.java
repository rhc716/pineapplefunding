package com.pineapple.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageService implements MypageServiceInterface {
	
	@Autowired
	private MypageDaoInterface mypagedao;

	@Override
	public int updateUserDetail(UserDetail userdetail) {
		System.out.println("MypageService updateUserDetail 호출 : "+userdetail);
		return mypagedao.modifyUserDetail(userdetail);
	}
	
	//회원상세정보조회를 위한 메서드 호출
	@Override
	public UserDetail selectUserDetail(String userDetailId) {
		System.out.println("MypageService getUserDetail 호출 : "+userDetailId);
		return mypagedao.getUserDetail(userDetailId);
	}
	
	//투자자 마이페이지 첫화면 구성을 위한 투자자 기본 정보와 계좌 정보 조회 메서드
	@Override
	public User selectInvestorBasic(String userId) {
		System.out.println("MypageService selectInvestorBasic 메서드 호출 "+userId);
		return mypagedao.getInvestorBasic(userId);
	}

	
	

}
