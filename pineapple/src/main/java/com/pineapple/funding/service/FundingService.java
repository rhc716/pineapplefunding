package com.pineapple.funding.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.user.service.Employee;


@Service
public class FundingService implements FundingServiceInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private FundingDaoInterface fundingdao;
	
	// 펀딩 개설 요청 메서드 // 펀딩상세 같이 만들어지는 트랜젝션
	@Override
	public void addFunding(Funding funding){
		log.debug("FundingService의 addFunding호출 성공");
		fundingdao.insertFunding(funding);
		//오토인크리먼트된 펀딩코드를 가져와서 펀딩상세코드로 넣어서 펀딩상세를 insert해줌
		int pk = funding.getFdCode();
		fundingdao.insertFundingDetail(pk);
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@Override
	public List<Funding> getMyFundinglist(String userId){
		log.debug("FundingService의 getMyFundinglist호출 성공");
		return fundingdao.selectMyFundinglist(userId);
	}
	// 펀딩삭제 (경영자) // 펀딩상세 같이 지워지는 트랜젝션
	@Override
	public int removeFunding(int delfdCode) {
		log.debug("FundingService의 deleteFunding호출 성공");
		int result = fundingdao.deleteFunding(delfdCode);
		fundingdao.deleteFundingDetail(delfdCode);
		return result;
	}
	// 펀딩수정 (경영자)
	@Override
	public void modifyFunding(Funding funding, int fdCode) {
		log.debug("FundingService의 modifyFunding호출 성공");
		fundingdao.updateFunding(funding, fdCode);
	}
	// 내가 소속된 회사 펀딩과 상세정보 리스트 불러오기 ( 기업회원 )
	@Override
	public List<FundingAndFdDetail> getMyFundingDetailList(String userId) {
		log.debug("FundingService의 getMyFundingDetailList호출 성공");
		return fundingdao.selectFundingDetailList(userId);
	}
	// 펀딩상세수정 (경영자)
	@Override 
	public void modifyFundingDetail(FundingDetail fundingdetail) {
		log.debug("FundingService의 modifyFundingDetail호출 성공");
		fundingdao.updateFundingDetail(fundingdetail);
	}
	
	// 마일스톤 입력을 위한 조회 (회사코드,펀딩코드,펀딩명)
	@Override
	public List<Funding> getFundingForInsertMileStone(String userId) {
		log.debug("FundingService의 getForInsertMileStone호출 성공");
		return fundingdao.selectFundingForInsertMileStone(userId);
	}
	
	// 마일스톤 입력
	@Override
	public void addMileStone(MileStone milestone) {
		log.debug("FundingService의 addMileStone호출 성공");
		fundingdao.insertMileStone(milestone);
	}
	
	// 마일스톤 입력을 위한 사원조회
	@Override
	public List<Employee> getemployeeforinsertmilestone(int fdCode) {
		log.debug("FundingService의 getemployeeforinsertmilestone호출 성공");
		return fundingdao.selectemployeeforinsertmilestone(fdCode);
	}

}
 