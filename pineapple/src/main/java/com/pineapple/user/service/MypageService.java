package com.pineapple.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageService implements MypageServiceInterface {
	
	@Autowired
	private MypageDaoInterface mypagedao;

	@Override
	public User selectInvestor(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account selectAccount(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
