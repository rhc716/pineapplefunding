package com.pineapple.funding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FundingService implements FundingServiceInterface {
	@Autowired
	private FundingDaoInterface fundingdao;
	
	// 펀딩 개설 요청 메서드
	@Override
	public void addFunding(Funding funding){
		System.out.println("FundingService의 addFunding호출 성공");
		fundingdao.insertFunding(funding);
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@Override
	public List<Funding> getMyFundinglist(String userId){
		System.out.println("FundingService의 getMyFundinglist호출 성공");
		return fundingdao.selectMyFundinglist(userId);
	}
	// 펀딩삭제 (경영자)
	@Override
	public int removeFunding(int delfdCode) {
		System.out.println("FundingService의 deleteFunding호출 성공");
		int result = fundingdao.deleteFunding(delfdCode);
		return result;
	}
	// 펀딩수정 (경영자)
	@Override
	public void modifyFunding(Funding funding, int fdCode) {
		System.out.println("FundingService의 modifyFunding호출 성공");
		fundingdao.updateFunding(funding, fdCode);
	}
	// 내가 소속된 회사 펀딩과 상세정보 리스트 불러오기 ( 기업회원 )
	@Override
	public List<FundingAndFdDetail> getMyFundingDetailList(String userId) {
		System.out.println("FundingService의 getMyFundingDetailList호출 성공");
		return fundingdao.selectFundingDetailList(userId);
	}
	// 펀딩상세수정 (경영자)
	@Override 
	public void modifyFundingDetail(FundingDetail fundingdetail) {
		System.out.println("FundingService의 modifyFundingDetail호출 성공");
		fundingdao.updateFundingDetail(fundingdetail);
	}
}
 