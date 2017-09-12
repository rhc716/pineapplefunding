package com.pineapple.user.service;

import java.util.List;
import java.util.Map;

import com.pineapple.invest.service.InvestorInvestList;

public interface MypageServiceInterface {
	//관리자 마이페이지 전체펀딩의 프로젝트관리시스템 조회
	List<FundingAndCompanyAndMilestoneAndWbsAndMargin> getPmsInfoByAdmin();
		
	//펀딩내 권한부여 삭제
	int removeFundingAuth(int authCode);
	
	//펀딩내 권한부여 입력요청
	int addFundingAuth(Fundingauth fundingauth);
		
	//소속 기업의 펀딩리스트 조회(ID로)
	List<FundingAndCompany> getFundingListOfMyCompany(String userId);
	
	//하나의 기업에 소속된 사원목록 조회(comCode 입력값)
	List<Employee> getEmployeeByComCode(int comCode);
	
	//펀딩권한명 옵션선택용 조회
	List<Fundingauthlevel> getFundingauthlevel();
	
	//사업분야 등록
	int addBizArea(Businessarea bizarea);
	
	//사업분야 삭제 
	int removeBizAreaByAreaCode(int areaCode);
	
	//기업별 사업분야 조회
	List<BizareaAndFundingAndCompany> getBizareaList(Map<String, Object> map);
	
	//펀딩승인요청 처리
	int modifyFundingApproval(Map<String, Object> map);
		
	//관리자 펀딩리스트 전체 조회
	List<FundingAndCompany> getAllFundingList();
	
	//기업회원 펀딩내권한부여 페이지 요청시 부여자 id로 권한부여 정보 조회
	List<FundingauthFundingAuthlevelCompany> getAuthInfoByGiverId(String giverId);
	
	//기업회원 펀딩내권한부여 페이지 요청시 피부여자 id로 권한부여 정보 조회
	List<FundingauthFundingAuthlevelCompany> getAuthInfoByReceiverId(String receiverId);
	
	//관리자 전체회원리스트 조회
	List<UserAndUserdetail> getAllUserList();
	
	//경영진 기업삭제취소
	int modifyCompanyDeleteRequestCancle(Company company);
	
	//관리자의 기업삭제처리
	int modifyCompanyDelete(Company company);
	
	//관리자의 기업승인처리
	int modifyCompanyApproval(Company company);
	
	//사원탈퇴처리
	int removeEmployeeByEmCode(int emCode);
	
	//경영진 마이페이지 분기시 페이지 로딩하면서, 자신이 속한 기업의 모든 사원조회기능 구현을 위한 메서드 선언(입력값 - map)
	List<Employee> getAllEmployeeInMyComList(Map<String, Object> map);
	
	//기업삭제요청을 위한 메서드
	int removeCompany(Company company);
	
	//경영진으로 속한 회사이름을 조회하기 위해 employee 정보 조회(ID로)
	List<Employee> getEmployeeMngById(String emUserId);
	
	//일반사원으로 속한 기업이름을 조회(ID로)
	List<Employee> getEmployeeComNameById(String emUserId);
	
	//경영진 마이페이지에서 사원요청목록 조회
	List<Employee> getEmployeeRequestList(String comName);
	
	//사원등록정보 확인 모달에서 부서명 수정하기 요청 처리
	int modifyEmployeeInfo(Employee employee);
	
	//사원정보 조회 메서드 선언(사원정보 수정페이지 요청을 위해)
	Employee getEmployeeByEmCode(int emCode);
	
	//경영진 마이페이지 개설한 기업정보 수정 요청 처리
	int modifyCompanyInfo(Company company);
	
	//기업정보 조회 메서드 선언(기업정보 수정페이지 요청을 위해)
	Company getCompanyByComCode(int comCode);
	
	//투자자 투자내역 조회
	List<InvestorInvestList> getInvestor(String investId);
	
	//투자자, 사이트관리자의 계좌조회 메서드 선언
	Account getAccountByAccountCode(int accountCode);
	
	//기업명 중복체크 기능 구현을 위한 메서드 선언
	Company getCompanyByComName(String comName);
	
	//아이디로 사원조회
	List<Employee> getEmployeeById(String userId);
	
	//사원등록 요청 처리
	int addEmployee(Employee employee);
		
	//사원등록시 특정회사검색 요청 처리
	Company getMyCompany(String comName);
		
	//사원등록시 전체회사검색 요청 처리
	List<Company> getAllCompany();
	
	//경영진 마이페이지에서 기업등록요청 처리 메서드 선언
	int addCompany(Company company);
	
	//경영진 마이페이지 분기시 자신이 개설한 회사정보 조회 메서드 선언
	List<Company> getCompanyByOpenId(String comOpenUserId);
	
	//회원상세정보 수정을 위한 메서드 선언
	int modifyUserDetail(UserDetail userdetail);
	
	//회원상세정보 조회를 위한 메서드 선언
	UserDetail getUserDetail(String userDetailId);
	
	//첫페이지 구성을 위한 회원정보와 계좌정보 호출
	User getInvestorBasic(String id);
}
