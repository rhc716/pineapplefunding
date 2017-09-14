package com.pineapple.funding.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.pineapple.invest.service.Investment;
import com.pineapple.pms.service.PmsService;
import com.pineapple.user.service.Company;
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
	
	// 펀딩코드로 해당 펀딩 정보 가져오기
	@Override
	public Funding getMyFunding(int fdCode){
		log.debug("FundingService의 getMyFunding호출 성공");
		return fundingdao.selectMyFunding(fdCode);
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
	public List<Employee> getEmployeeForInsertMileStone(int fdCode) {
		log.debug("FundingService의 getemployeeforinsertmilestone호출 성공");
		return fundingdao.selectEmployeeForInsertMileStone(fdCode);
	}
	
	// 마일스톤조회 // 마일스톤 + 펀딩 리스트 가져오기
	@Override
	public List<FundingAndMileStone> getMyMileStoneList(String userId) {
		log.debug("FundingService의 getMyMileStoneList호출 성공");
		return fundingdao.selectMyMileStoneList(userId);
	}
	// 마일스톤 수정
	@Override
	public void modifyMileStone(MileStone mileStone) {
		log.debug("FundingService의 modifyMileStone호출 성공");
		fundingdao.updateMileStone(mileStone);
	}
	// 마일스톤 삭제 // 삭제시 예상WBS와 투입요소들도 같이 삭제해주려(PmsService의 deletewbsplan를 호출)
	@Override
	public void removeMileStone(int delMsCode) {
		log.debug("FundingService의 removeMileStone호출 성공");
		fundingdao.deleteMileStone(delMsCode);
	}
	// 펀딩파일 업로드정보 저장
	@Override
	public void addFundingFile(MultipartFile uploadFile, String result, int fdCode) {
		log.debug("FundingService의 addFundingFile호출 성공");
		int fileFdCode = fdCode;
		String fdFileName = uploadFile.getOriginalFilename();
		String fdFileExtension = fdFileName.substring(fdFileName.lastIndexOf("."));
		int fdFileSize = (int) uploadFile.getSize();
		
		log.debug("fileFdCode : "+ fileFdCode);
		log.debug("fdFileName : "+ fdFileName);
		log.debug("fdFileExtension : "+ fdFileExtension);
		log.debug("fdFileSize : "+ fdFileSize);
		
		FundingAndFdFile file = new FundingAndFdFile();
		file.setFileFdCode(fileFdCode);
		file.setFdFileName(fdFileName);
		file.setFdFileExtension(fdFileExtension);
		file.setFdFileSize(fdFileSize);
		file.setFdFileUploadName(result);
		
		fundingdao.insertFundingFile(file);
	}
	
	// 펀딩파일 업로드 리스트 가져오기 (userId로)
	@Override
	public List<FundingAndFdFile> getFundingFileList(String userId) {
		log.debug("FundingService의 getFundingFileList호출 성공");
		return fundingdao.selectFundingFileList(userId);
	}

	// 펀딩파일 업로드 리스트 가져오기 (fdCode로)
	@Override
	public List<FundingAndFdFile> getFundingFileList(int fdCode) {
		log.debug("FundingService의 getFundingFileList호출 성공");
		return fundingdao.selectFundingFileList(fdCode);
	}
	
	// 펀딩파일 삭제
	@Override
	public void removeFundingFile(int fdFileCode) {
		log.debug("FundingService의 removeFundingFile호출 성공");
		fundingdao.deleteFundingFile(fdFileCode);
	}
	
	// 펀딩배당계획 입력
	@Override
	public void addDividendPlan(FundingDividendPlan fundingdividendplan) {
		log.debug("FundingService의 addDividendPlan호출 성공");
		fundingdao.insertDividendPlan(fundingdividendplan);
	}
	
	// 펀딩배당계획 리스트 가져오기
	@Override
	public List<FundingAndFdDividendPlan> getFundingDividendPalnList(int fdCode) {
		log.debug("FundingService의 getFundingDividendPalnList호출 성공");
		return fundingdao.selectFundingDividendPalnList(fdCode);
	}
	
	// 펀딩배당계획 삭제
	@Override
	public void removeFundingDividendPaln(int divCode) {
		log.debug("FundingService의 removeFundingDividendPaln호출 성공");
		fundingdao.deleteFundingDividendPaln(divCode);
	}
	
	// 펀딩별 투자자 리스트 불러오기
	@Override
	public List<Investment> getFundingInvestorList(int fdCode, int numberOfRequests) {
		log.debug("FundingService의 getFundingInvestorList호출 성공");
		return fundingdao.selectFundingInvestorList(fdCode, numberOfRequests);
	}
	
	// 펀딩생성에서 사용할 회사정보 가져오기
	@Override
	public List<Company> getComList(String userId) {
		log.debug("FundingService의 getComList호출 성공");
		return fundingdao.selectComList(userId);
	}
	
	// 펀딩 포스터 이미지수정
	@Override
	public void modifyFundingImage(Model model) {
		log.debug("FundingService의 modifyFundingImage호출 성공");
		fundingdao.updateFundingImage(model);
	}

	// 펀딩 insert ( 펀딩명 중복검사 )
	@Override
	public Funding fdtitleCheck(String fdTitle) {
		log.debug("FundingService의 fdtitleCheck호출 성공");
		return fundingdao.fdtitleCheck(fdTitle);
	}
	
	// pmsmain.jsp 에서 권한별로 필요한 정보의 리스트를 가져옴
	@Override
	public List<Object> getProjectInfoList(String userId, String level) {
		log.debug("FundingService의 getprojectinfolist호출 성공");
		return fundingdao.selectProjectInfoList(userId, level);
	}
	// pmsmain.jsp 에서 관리자가 펀딩 더보기 버튼을 눌렀을때 추가로 펀딩리스트 10개를 가져옴
	@Override
	public List<Object> getMoreFdList(int numberOfRequests) {
		log.debug("FundingService의 getMoreFdList호출 성공");
		return fundingdao.selectMoreFdList(numberOfRequests);
	}
	
	// 펀딩코드에 따른 마일스톤 리스트 가져오기
	@Override
	public List<Object> getMilestoneListOfFunding(int fdCode) {
		log.debug("FundingService의 getMilestoneListOfFunding호출 성공");
		return fundingdao.selectMilestoneListOfFunding(fdCode);
	}
	// 마일스톤입력에서 사용할 마일스톤 단계 중복검사
	@Override
	public MileStone milestoneStepCheck(int msFdCode, int milestoneStep) {
		log.debug("FundingService의 milestoneStepCheck호출 성공");
		return fundingdao.milestoneStepCheck(msFdCode, milestoneStep);
	}
	
	//관리자권한 프로젝트관리 펀딩보기페이지 요청할때 펀딩코드로 펀딩에 대한 정보들을 가져옴
	@Override
	public void getForfundingTotalViewPage(int fdCode, Model model) {
		log.debug("FundingService의 getForfundingTotalViewPage호출 성공");
		fundingdao.selectForfundingTotalViewPage(fdCode, model);
	}
	
	// 관리자권한의 펀딩보기에서 모든 펀딩리스트를 가져옴
	@Override
	public List<Object> getAllFundingList() {
		log.debug("FundingService의 getAllFundingList호출 성공");
		return fundingdao.selectAllFundingList();
	}
	
	// 관리자권한의 펀딩보기에서 모집실패와 마감된 펀딩리스트를 가져옴
	@Override
	public List<Object> getEndFundingList() {
		log.debug("FundingService의 getEndFundingList호출 성공");
		return fundingdao.selectEndFundingList();
	}
	
	// 바로 위의 마감, 모집실패 상태의 펀딩리스트에서 더보기버튼을 눌렀을때 
	@Override
	public List<Funding> getMoreEndFdList(int numberOfRequests) {
		log.debug("FundingService의 getMoreEndFdList호출 성공");
		return fundingdao.selectMoreEndFundingList(numberOfRequests);
	}
	
	// 모든 투자자들에게 공지보내기
	@Override
	public int sendMessageAllInvestors(MessageAndFd messageandfd) {
		log.debug("FundingService의 sendMessageAllInvestors호출 성공");
		return fundingdao.sendMessageAllInvestors(messageandfd);
	}
	
	// 메인에서 새 메세지가 있을 경우 알림을 위해 ajax 요청
	@Override
	public int getMyNewMessageNum(String userid) {
		log.debug("FundingService의 getMyNewMessageNum호출 성공");
		return fundingdao.selectMyNewMessageNum(userid);
	}
	
	// 메인에서 모집중펀딩순위 랭킹 5를 가져오는 ajax요청
	@Override
	public List<Funding> getCompanyRankingFive() {
		log.debug("FundingService의 getCompanyRankingFive호출 성공");
		return fundingdao.selectCompanyRankingFive();
	}
}
 