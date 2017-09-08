package com.pineapple.funding.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.pineapple.invest.service.Investment;
import com.pineapple.user.service.Company;
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
	
	// 펀딩파일 업로드정보 저장
	@Override
	public void insertFundingFile(FundingAndFdFile file) {
		log.debug("FundingDao의 insertFundingFile호출 성공");
		sqlSessionTemplate.insert("com.pineapple.funding.service.FundingMapper.insertFundingFile", file);
		
	}
	
	// 펀딩파일 업로드 리스트 가져오기
	@Override
	public List<FundingAndFdFile> selectFundingFileList(String userId) {
		log.debug("FundingDao의 selectFundingFileList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectFundingFileList", userId);
	}
	
	// 펀딩파일 삭제
	@Override
	public void deleteFundingFile(int fdFileCode) {
		log.debug("FundingDao의 deleteFundingFile호출 성공");
		sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.deleteFundingFile", fdFileCode);
	}
	
	// 펀딩배당계획 입력
	@Override
	public void insertDividendPlan(FundingDividendPlan fundingdividendplan) {
		log.debug("FundingDao의 insertDividendPlan호출 성공");
		sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.insertDividendPlan", fundingdividendplan);
	}
	
	// 펀딩배당계획 리스트 가져오기	
	@Override
	public List<FundingAndFdDividendPlan> selectFundingDividendPalnList(int fdCode) {
		log.debug("FundingDao의 selectFundingDividendPalnList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectFundingDividendPalnList", fdCode);
	}
	
	// 펀딩배당계획 삭제
	@Override
	public void deleteFundingDividendPaln(int divCode) {
		log.debug("FundingDao의 deleteFundingDividendPaln호출 성공");
		sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.deleteFundingDividendPaln", divCode);
	}
	
	// 펀딩별 투자자 리스트 불러오기
	@Override
	public List<Investment> selectFundingInvestorList(int fdCode) {
		log.debug("FundingDao의 selectFundingInvestorList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectFundingInvestorList", fdCode);
	}
	
	// 펀딩생성에서 사용할 회사정보 가져오기
	@Override
	public List<Company> selectComList(String userId) {
		log.debug("FundingDao의 selectComList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectComList", userId);
	}
	
	// 펀딩 포스터 이미지 수정
	@Override
	public void updateFundingImage(Model model) {
		log.debug("FundingDao의 updateFundingImage호출 성공");
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.updateFundingImage", model);
	}
	
	// 펀딩 insert ( 펀딩명 중복검사 )fdtitleCheck
	@Override
	public Funding fdtitleCheck(String fdTitle) {
		log.debug("FundingDao의 fdtitleCheck호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.funding.service.FundingMapper.fdtitleCheck", fdTitle);
	}
	
	// 펀딩코드로 펀딩정보한개 가져오기
	@Override
	public Funding selectMyFunding(int fdCode) {
		log.debug("FundingDao의 selectMyFunding호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.funding.service.FundingMapper.selectMyFunding", fdCode);
	}
	
	// pmsmain.jsp 에서 권한별로 필요한 정보의 리스트를 가져옴
	@Override
	public List<Object> selectProjectInfoList(String userId, String level) {
		log.debug("FundingDao의 selectProjectInfoList호출 성공");
		List<Object> list = new ArrayList<Object>();
		if(level.equals("관리자")){
			// 총회원수, 총기업회원수, 총투자자회원수, 총회사수를 가져옴
			list.add(sqlSessionTemplate.selectOne("com.pineapple.funding.service.FundingMapper.selectProjectInfoListAdminFirst"));
			// 총펀딩수, 모집중인 펀딩수, 개설요청중인 펀딩수, 진행중인 펀딩수를 가져옴
			list.add(sqlSessionTemplate.selectOne("com.pineapple.funding.service.FundingMapper.selectProjectInfoListAdminSecond"));
			// 마감, 모집실패로 끝난 펀딩을 제외한 모든 펀딩 목록을 가져옴
			list.add(sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListAdminThird"));
		} else if(level.equals("기업회원")){
			// 자신이 속한 회사의 총 펀딩수, 모집중인 펀딩수, 진행중인 펀딩수를 가져옴
			list.add(sqlSessionTemplate.selectOne("com.pineapple.funding.service.FundingMapper.selectProjectInfoListComUserFirst", userId));
			// 기업회원이 소속된 회사명과 직급 리스트를 가져옴
			list.add(sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListComUserSecond", userId));
			// 펀딩상태가 모집중 or 결제모집중 or 진행중 펀딩과 펀딩내 권한을 세트로 가져옴
			list.add(sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListComUserThird", userId));
		} else {//투자자
			// 투자한 펀딩리스트중 마감이 아닌 펀딩리스트를 가져옴
			list.add(sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListInvestorFirst", userId));
			// 투자한 투자총액, 총투자건수, 진행중인 투자수, 진행중인 펀딩의 투자금액을 가져옴
			list.add(sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListInvestorSecond", userId));
			// 배당총액, 진행중인 펀딩의 현재까지 배당금액총액 가져옴
			//list.add(sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListInvestorThird", userId));
		}
		return list;
	}
	
	// pmsmain.jsp 에서 관리자가 펀딩 더보기 버튼을 눌렀을때 추가로 펀딩리스트 10개를 가져옴
	@Override
	public List<Object> selectMoreFdList(int numberOfRequests) {
		log.debug("FundingDao의 selectMoreFdList호출 성공");
		log.debug("DAO 에서 받은 numberOfRequests : "+ numberOfRequests);
		// 1페이지당 10개씩이니 numberOfRequests에 10을 곱해서 넘겨줌
		numberOfRequests = numberOfRequests*10;
		//log.debug("selectMoreFdList 쿼리 실행 결과 : "+ sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListAdminThird", numberOfRequests));
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectProjectInfoListAdminThird", numberOfRequests);
	}
	
	
	// 펀딩코드에 따른 마일스톤 리스트 가져오기
	@Override
	public List<Object> selectMilestoneListOfFunding(int fdCode) {
		log.debug("FundingDao의 selectMoreFdList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.funding.service.FundingMapper.selectMilestoneListOfFunding", fdCode);
	}
	
	// 마일스톤입력에서 사용할 마일스톤 단계 중복검사
	@Override
	public MileStone milestoneStepCheck(int msFdCode, int milestoneStep) {
		log.debug("FundingDao의 milestoneStepCheck호출 성공");
		Map<String, Object> map = new HashMap<>();
		map.put("msFdCode", msFdCode);
		map.put("milestoneStep", milestoneStep);
		return sqlSessionTemplate.selectOne("com.pineapple.funding.service.FundingMapper.milestoneStepCheck", map);
	}
}
