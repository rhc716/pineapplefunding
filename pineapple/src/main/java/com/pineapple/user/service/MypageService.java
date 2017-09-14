package com.pineapple.user.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pineapple.invest.service.InvestorInvestList;

@Service
public class MypageService implements MypageServiceInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageDaoInterface mypagedao;
	
	//관리자 마이페이지 전체투자내역과 투자에 대한 배당지급내역 조회
	@Override
	public List<InvestmentAndDividendpay> getInvestInfoAndDividendInfo() {
		log.debug("MypageService getInvestInfoAndDividendInfo 호출 결과: "+mypagedao.selectInvestInfoAndDividendInfo());
		return mypagedao.selectInvestInfoAndDividendInfo();
	}
	
	//관리자 마이페이지 전체펀딩의 프로젝트관리시스템 조회
	@Override
	public List<FundingAndCompanyAndMilestoneAndWbsAndMargin> getPmsInfoByAdmin() {
		log.debug("MypageService getPmsInfoByAdmin 호출 결과: "+mypagedao.selectPmsInfoByAdmin());
		return mypagedao.selectPmsInfoByAdmin();
	}
	
	//펀딩내 권한부여 삭제
	@Override
	public int removeFundingAuth(int authCode) {
		log.debug("MypageService removeFundingAuth 호출 결과: "+mypagedao.deleteFundingAuth(authCode));
		return mypagedao.deleteFundingAuth(authCode);
	}
	
	//펀딩내 권한부여 입력요청
	@Override
	public int addFundingAuth(Fundingauth fundingauth) {
		log.debug("MypageService addFundingAuth 호출 결과: "+fundingauth);
		return mypagedao.insertFundingAuth(fundingauth);
	}
	
	//소속 기업의 펀딩리스트 조회(ID로)
	@Override
	public List<FundingAndCompany> getFundingListOfMyCompany(String userId) {
		log.debug("MypageService getFundingListOfMyCompany 호출 결과: "+mypagedao.selectFundingListOfMyCompany(userId));
		return mypagedao.selectFundingListOfMyCompany(userId);
	}
	
	//일반사원으로 속한 기업이름을 조회(ID로)
	@Override
	public List<Employee> getEmployeeComNameById(String emUserId) {
		log.debug("MypageService getEmployeeComNameById 호출 결과: "+mypagedao.selectEmployeeComNameById(emUserId));
		return mypagedao.selectEmployeeComNameById(emUserId);
	}
	
	//하나의 기업에 소속된 사원목록 조회(comCode 입력값)
	@Override
	public List<Employee> getEmployeeByComCode(int comCode) {
		log.debug("MypageService getEmployeeByComCode 호출 결과: "+mypagedao.selectEmployeeByComCode(comCode));
		return mypagedao.selectEmployeeByComCode(comCode);
	}
	
	//펀딩권한명 옵션선택용 조회
	@Override
	public List<Fundingauthlevel> getFundingauthlevel() {
		log.debug("MypageService getFundingauthlevel 호출 결과: "+mypagedao.selectFundingauthlevel());
		return mypagedao.selectFundingauthlevel();
	}
	
	//사업분야 등록
	@Override
	public int addBizArea(Businessarea bizarea) {
		log.debug("MypageService addBizArea 호출 결과: "+bizarea);
		return mypagedao.insertBizArea(bizarea);
	}
	
	//사업분야 삭제 
	@Override
	public int removeBizAreaByAreaCode(int areaCode) {
		log.debug("MypageService removeBizAreaByAreaCode 호출 결과: "+areaCode);
		return mypagedao.deleteBizAreaByAreaCode(areaCode);
	}
	
	//기업별 사업분야 조회
	@Override
	public List<BizareaAndFundingAndCompany> getBizareaList(Map<String, Object> map) {
		log.debug("MypageService getBizareaList 호출 결과: "+mypagedao.selectBizareaList(map));
		return mypagedao.selectBizareaList(map);
	}
	
	//펀딩승인요청 처리
	@Override
	public int modifyFundingApproval(Map<String, Object> map) {
		log.debug("MypageService modifyFundingApproval 호출 결과: "+mypagedao.updateFundingApproval(map));
		return mypagedao.updateFundingApproval(map);
	}
	
	//관리자 펀딩리스트 전체 조회
	@Override
	public List<FundingAndCompany> getAllFundingList() {
		log.debug("MypageService getAllFundingList 호출 결과: "+mypagedao.selectAllFundingList());
		return mypagedao.selectAllFundingList();
	}
	
	//기업회원 펀딩내권한부여 페이지 요청시 부여자 id로 권한부여 정보 조회
	@Override
	public List<FundingauthFundingAuthlevelCompany> getAuthInfoByGiverId(String giverId) {
		log.debug("MypageService getAuthInfoByGiverId 호출 결과: "+mypagedao.selectAuthInfoByGiverId(giverId));
		return mypagedao.selectAuthInfoByGiverId(giverId);
	}
	
	//기업회원 펀딩내권한부여 페이지 요청시 피부여자 id로 권한부여 정보 조회
	@Override
	public List<FundingauthFundingAuthlevelCompany> getAuthInfoByReceiverId(String receiverId) {
		log.debug("MypageService getAuthInfoByGiverId 호출 결과: "+mypagedao.selectAuthInfoByReceiverId(receiverId));
		return mypagedao.selectAuthInfoByReceiverId(receiverId);
	}
	
	//관리자 전체회원리스트 조회
	@Override
	public List<UserAndUserdetail> getAllUserList() {
		log.debug("MypageService getAllUserList 호출 결과: "+mypagedao.selectAllUserList());
		return mypagedao.selectAllUserList();
	}
	
	//경영진 기업삭제취소
	@Override
	public int modifyCompanyDeleteRequestCancle(Company company) {
		log.debug("MypageService modifyCompanyDeleteRequestCancle 호출 결과: "+mypagedao.updateCompanyDeleteRequestCancle(company));
		return mypagedao.updateCompanyDeleteRequestCancle(company);
	}
	
	//관리자의 기업삭제처리
	@Override
	public int modifyCompanyDelete(Company company) {
		log.debug("MypageService modifyCompanyDelete 호출 결과: "+mypagedao.updateCompanyDelete(company));
		return mypagedao.updateCompanyDelete(company);
	}
	
	//관리자의 기업승인처리
	@Override
	public int modifyCompanyApproval(Company company) {
		log.debug("MypageService modifyCompanyApproval 호출 결과: "+mypagedao.updateCompanyApproval(company));
		return mypagedao.updateCompanyApproval(company);
	}
	
	//사원탈퇴처리
	@Override
	public int removeEmployeeByEmCode(int emCode) {
		log.debug("MypageService removeEmployeeByEmCode 호출 결과: "+mypagedao.deleteEmployeeByEmCode(emCode));
		return mypagedao.deleteEmployeeByEmCode(emCode);
	}
	
	//경영진 마이페이지 분기시 페이지 로딩하면서, 자신이 속한 기업의 모든 사원조회기능 구현을 위한 메서드 선언(입력값 - map)
	@Override
	public List<Employee> getAllEmployeeInMyComList(Map<String, Object> map) {
		log.debug("MypageService getAllEmployeeInMyComList 호출 결과: "+mypagedao.selectAllEmployeeInMyComList(map));
		return mypagedao.selectAllEmployeeInMyComList(map);
	}
	
	//기업삭제요청
	@Override
	public int removeCompany(Company company) {
		log.debug("MypageService removeCompany 호출 결과: "+mypagedao.deleteCompany(company));
		return mypagedao.deleteCompany(company);
	}
	
	//경영진으로 속한 회사이름을 조회하기 위해 employee 정보 조회(ID로)
	@Override
	public List<Employee> getEmployeeMngById(String emUserId) {
		log.debug("MypageService getEmployeeMngById 호출 결과: "+mypagedao.selectEmployeeMngById(emUserId));
		return mypagedao.selectEmployeeMngById(emUserId);
	}
	
	//경영진 마이페이지에서 사원요청목록 조회
	@Override
	public List<Employee> getEmployeeRequestList(String comName) {
		log.debug("MypageService getEmployeeRequestList 호출 결과: "+mypagedao.selectEmployeeRequestList(comName));
		return mypagedao.selectEmployeeRequestList(comName);
	}
	
	//사원정보 조회 메서드 선언(사원정보 수정페이지 요청을 위해)
	@Override
	public Employee getEmployeeByEmCode(int emCode) {
		log.debug("MypageService getEmployeeByEmCode 호출 결과: "+mypagedao.selectEmployeeByEmCode(emCode));
		return mypagedao.selectEmployeeByEmCode(emCode);
	}
	
	//기업정보 조회 메서드 선언(기업정보 수정페이지 요청을 위해)
	@Override
	public Company getCompanyByComCode(int comCode) {
		log.debug("MypageService getEmployeeByEmCode 호출 결과: "+mypagedao.selectCompanyByComCode(comCode));
		return mypagedao.selectCompanyByComCode(comCode);
	}
	
	//사원등록정보 확인 모달에서 부서명 수정하기 요청 처리
	@Override
	public int modifyEmployeeInfo(Employee employee) {
		log.debug("MypageService modifyEmployeeInfo 호출 결과: "+mypagedao.updateEmployeeInfo(employee));
		return mypagedao.updateEmployeeInfo(employee);
	}
	
	//경영진 마이페이지 개설한 기업정보 수정 요청 처리
	@Override
	public int modifyCompanyInfo(Company company) {
		log.debug("MypageService modifyCompanyInfo 호출 결과: "+mypagedao.updateCompanyInfo(company));
		return mypagedao.updateCompanyInfo(company);
	}
	//투자자 투자내역 조회
	@Override
	public List<InvestorInvestList> getInvestor(String investId) {
		log.debug("MypageService getInvestor 호출 결과: "+mypagedao.selectInvestor(investId));
		return mypagedao.selectInvestor(investId);
	}
	//투자자, 사이트관리자의 계좌조회 메서드 선언(id로)
	@Override
	public Account getAccountByAccountCode(int accountCode) {
		log.debug("MypageService getAccountByAccountId 호출 결과: "+mypagedao.selectAccountByAccountCode(accountCode));
		return mypagedao.selectAccountByAccountCode(accountCode);
	}
	//기업명 중복체크 기능 구현을 위한 메서드 선언
	@Override
	public Company getCompanyByComName(String comName) {
		log.debug("MypageService getCompanyByComName 호출");
		return mypagedao.selectCompanyByComName(comName);
	}
	//아이디로 사원조회
	@Override
	public List<Employee> getEmployeeById(String userId) {
		log.debug("MypageService getEmployee 호출");
		return mypagedao.selectEmployee(userId);
	}
	//사원등록 요청 처리
	@Override
	public int addEmployee(Employee employee) {
		log.debug("MypageService addEmployee 호출");
		return mypagedao.insertEmployee(employee);
	}
	//사원등록시 특정회사검색 요청 처리
	@Override
	public Company getMyCompany(String comName) {
		log.debug("MypageService getMyCompany 호출");
		return mypagedao.selectMyCompany(comName);
	}
	//사원등록시 전체회사검색 요청 처리
	@Override
	public List<Company> getAllCompany() {
		log.debug("MypageService getAllCompany 호출");
		return mypagedao.selectAllCompany();
	}
	//경영진 마이페이지에서 기업등록요청 처리 메서드 선언
	@Override
	public int addCompany(Company company) {
		log.debug("MypageService addCompany 호출 : "+company);
		return mypagedao.insertCompany(company);
	}
	//경영진 마이페이지 분기시 자신이 개설한 회사정보 조회 메서드 선언
	@Override
	public List<Company> getCompanyByOpenId(String comOpenUserId) {
		log.debug("MypageService getCompanyByOpenId 호출 : "+comOpenUserId);
		return mypagedao.selectCompanyByOpenId(comOpenUserId);
	}
	//회원상세정보 수정을 위한 메서드 선언
	@Override
	public int modifyUserDetail(UserDetail userdetail) {
		log.debug("MypageService updateUserDetail 호출 : "+userdetail);
		return mypagedao.updateUserDetail(userdetail);
	}
	//회원상세정보조회를 위한 메서드 호출
	@Override
	public UserDetail getUserDetail(String userDetailId) {
		log.debug("MypageService getUserDetail 호출 : "+mypagedao.selectUserDetail(userDetailId));
		return mypagedao.selectUserDetail(userDetailId);
	}
	//투자자 마이페이지 첫화면 구성을 위한 투자자 기본 정보와 계좌 정보 조회 메서드
	@Override
	public User getInvestorBasic(String userId) {
		log.debug("MypageService selectInvestorBasic 메서드 호출 "+userId);
		return mypagedao.selectInvestorBasic(userId);
	}


}
