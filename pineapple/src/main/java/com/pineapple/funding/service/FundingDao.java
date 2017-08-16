package com.pineapple.funding.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.bcel.internal.generic.ObjectType;

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
	@Override
	public List<Funding> selectMyFundinglist(String userId){
		System.out.println("FundingDao의 selectMyFundinglist호출 성공");
		System.out.println("selectMyFundinglist 결과 : " + sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyFundingList", userId));
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyFundingList", userId);
	}
	// 펀딩삭제 (경영자)
	@Override
	public int deleteFunding(int delfdCode) {
		System.out.println("FundingDao의 deleteFunding호출 성공");
		
		return sqlSessionTemplate.delete("com.pineapple.funding.service.FundingMapper.deleteFunding", delfdCode);
	}
	// 펀딩수정 (경영자)
	@Override
	public void updateFunding(Funding funding, int fdCode) {
		System.out.println("FundingDao의 updateFunding호출 성공");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("funding", funding);
		map.put("fdCode", fdCode);
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.updateFunding", map);
	}
	
	// 펀딩상세조회 (경영자)
	@Override
	public List<FundingAndFdDetail> selectFundingDetailList(String userId) {
		System.out.println("FundingDao의 selectFundingDetailList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectFundingDetailList", userId);
	}
	
	// 펀딩상세수정 (경영자)
	@Override
	public void updateFundingDetail(FundingDetail fundingdetail) {
		System.out.println("FundingDao의 updateFundingDetail호출 성공");
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.updateFundingDetail", fundingdetail);
	}
} 
