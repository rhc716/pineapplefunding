package com.pineapple.funding.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundingDao implements FundingDaoInterface {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 펀딩 개설 요청 메서드
	@Override
	public void insertFunding(Funding funding){
		System.out.println("FundingDao의 insertFunding호출 성공");
		sqlSessionTemplate.insert("com.pineapple.funding.service.FundingMapper.insertFunding", funding);
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	public List<Funding> selectMyFundinglist(String userId){
		System.out.println("FundingDao의 selectMyFundinglist호출 성공");
		System.out.println("selectMyFundinglist 결과 : " + sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyFundinglist", userId));
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyFundinglist", userId);
	}
} 
