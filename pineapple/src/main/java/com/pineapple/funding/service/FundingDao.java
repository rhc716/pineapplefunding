package com.pineapple.funding.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.user.service.Employee;

@Repository
public class FundingDao implements FundingDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 펀딩 개설 요청 메서드
	@Override
	public void insertFunding(Funding funding){
		log.debug("FundingDao의 insertFunding호출 성공");
		sqlSessionTemplate.insert("com.pineapple.funding.service.FundingMapper.insertFunding", funding);
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@Override
	public List<Funding> selectMyFundinglist(String userId){
		log.debug("FundingDao의 selectMyFundinglist호출 성공");
		log.debug("selectMyFundinglist 결과 : " + sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyFundingList", userId));
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyFundingList", userId);
	}
	// 펀딩삭제 (경영자)
	@Override
	public int deleteFunding(int delfdCode) {
		log.debug("FundingDao의 deleteFunding호출 성공");
		
		return sqlSessionTemplate.delete("com.pineapple.funding.service.FundingMapper.deleteFunding", delfdCode);
	}
	// 펀딩수정 (경영자)
	@Override
	public void updateFunding(Funding funding, int fdCode) {
		log.debug("FundingDao의 updateFunding호출 성공");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("funding", funding);
		map.put("fdCode", fdCode);
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.updateFunding", map);
	}
	
	// 펀딩상세조회 (경영자)
	@Override
	public List<FundingAndFdDetail> selectFundingDetailList(String userId) {
		log.debug("FundingDao의 selectFundingDetailList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectFundingDetailList", userId);
	}
	
	// 펀딩상세입력 (트렌젝션 처리)
	@Override
	public void insertFundingDetail(int pk) {
		log.debug("FundingDao의 insertFundingDetail호출 성공");		
		sqlSessionTemplate.insert("com.pineapple.funding.service.FundingMapper.insertFundingDetail", pk);
	}
	
	// 펀딩상세수정 (경영자)
	@Override
	public void updateFundingDetail(FundingDetail fundingdetail) {
		log.debug("FundingDao의 updateFundingDetail호출 성공");
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.updateFundingDetail", fundingdetail);
	}
	
	// 펀딩상세삭제 (트렌젝션 처리)
	@Override
	public void deleteFundingDetail(int delfdCode) {
		log.debug("FundingDao의 deleteFundingDetail호출 성공");
		sqlSessionTemplate.delete("com.pineapple.funding.service.FundingMapper.deleteFundingDetail", delfdCode);
	}
	
	// 마일스톤 입력을 위한 조회 (회사코드,펀딩코드,펀딩명)
	@Override
	public List<Funding> selectFundingForInsertMileStone(String userId) {
		log.debug("FundingDao의 selectFundingForInsertMileStone호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectForInsertMileStone", userId);
	}
	
	// 마일스톤 입력
	@Override
	public void insertMileStone(MileStone milestone) {
		log.debug("FundingDao의 insertMileStone호출 성공");
		sqlSessionTemplate.insert("com.pineapple.funding.service.FundingMapper.insertMileStone", milestone);
	}
	
	// 마일스톤 입력을 위한 사원조회
	@Override
	public List<Employee> selectEmployeeForInsertMileStone(int fdCode) {
		log.debug("FundingDao의 insertMileStone호출 성공");
		log.debug("리턴값 ----------->>>>"+ sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectemployeeforinsertmilestone", fdCode ));
		
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectemployeeforinsertmilestone", fdCode );
	}
	
	// 마일스톤조회 // 마일스톤 + 펀딩 리스트 가져오기
	@Override
	public List<FundingAndMileStone> selectMyMileStoneList(String userId) {
		log.debug("FundingDao의 selectMyMileStoneList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMyMileStoneList", userId );
	}
	
	// 마일스톤 수정
	@Override
	public void updateMileStone(MileStone mileStone) {
		log.debug("FundingDao의 updateMileStone호출 성공");
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.updateMileStone", mileStone );
	}
	
	// 마일스톤 삭제 
	@Override
	public void deleteMileStone(int delMsCode) {
		log.debug("FundingDao의 deleteMileStone호출 성공");
		sqlSessionTemplate.delete("com.pineapple.funding.service.FundingMapper.deleteMileStone", delMsCode );
	}
	
}
