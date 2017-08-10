package com.pineapple.funding.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundingDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertFunding(Funding funding){
		System.out.println("FundingDao의 insertFunding호출 성공");
		sqlSessionTemplate.insert("com.pineapple.funding.funding.FundingMapper.insertFunding", funding);
	}
} 
