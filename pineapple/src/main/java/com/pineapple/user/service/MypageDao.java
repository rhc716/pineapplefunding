package com.pineapple.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDao implements MypageDaoInterface {
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public User getUser(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account getAccount(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
