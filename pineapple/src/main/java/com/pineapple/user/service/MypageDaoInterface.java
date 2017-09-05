package com.pineapple.user.service;

import java.util.List;
import java.util.Map;

import com.pineapple.invest.service.InvestorInvestList;

public interface MypageDaoInterface {
	//관리자 전체회원리스트 조회
	List<User> selectAllUserList();
	
	//경영진 기업삭제취소
	int updateCompanyDeleteRequestCancle(Company company);
	
	//관리자의 기업삭제처리
	int updateCompanyDelete(Company company);
	
	//관리자의 기업승인처리
	int updateCompanyApproval(Company company);
	
	//사원탈퇴처리
	int deleteEmployeeByEmCode(int emCode);
	
	//경영진 마이페이지 분기시 페이지 로딩하면서, 자신이 속한 기업의 모든 사원조회기능 구현을 위한 메서드 선언(입력값 - map)
	List<Employee> selectAllEmployeeInMyComList(Map<String, Object> map);
	
	//기업삭제요청을 위한 메서드
	int deleteCompany(Company company);
	
	//경영진으로 속한 회사이름을 조회하기 위해 employee 정보 조회(ID로)
	List<Employee> selectEmployeeMngById(String emUserId);
	
	//경영진 마이페이지에서 사원요청목록 조회
	List<Employee> selectEmployeeRequestList(String comName);
	
	//사원등록정보 확인 모달에서 부서명 수정하기 요청 처리
	int updateEmployeeInfo(Employee employee);
	
	//사원정보 조회 메서드 선언(사원정보 수정페이지 요청을 위해)
	Employee selectEmployeeByEmCode(int emCode);
	
	//경영진 마이페이지 개설한 기업정보 수정 요청 처리
	int updateCompanyInfo(Company company);
	
	//기업정보 조회 메서드 선언(기업정보 수정페이지 요청을 위해)
	Company selectCompanyByComCode(int comCode);

	//투자자 투자내역 조회
	List<InvestorInvestList> selectInvestor(String investId);
	
	//투자자, 사이트관리자의 계좌조회 메서드 선언
	Account selectAccountByAccountCode(int accountCode);
	
	//기업명 중복체크 기능 구현을 위한 메서드 선언
	Company selectCompanyByComName(String comName);
	
	//아이디로 사원조회
	List<Employee> selectEmployee(String userId);
	
	//사원등록 요청 처리
	int insertEmployee(Employee employee);
	
	//사원등록시 특정회사검색 요청 처리
	Company selectMyCompany(String comName);
	
	//사원등록시 전체회사검색 요청 처리
	List<Company> selectAllCompany();
	
	//경영진 마이페이지에서 기업등록요청 처리 메서드 선언
	int insertCompany(Company company);
	
	//경영진 마이페이지 분기시 자신이 개설한 회사정보 조회 메서드 선언
	List<Company> selectCompanyByOpenId(String comOpenUserId);
	
	//회원상세정보 수정을 위한 메서드 선언
	int updateUserDetail(UserDetail userdetail);
	
	//회원상세정보조회를 위한 메서드 선언
	UserDetail selectUserDetail(String userDetailId);
	
	//투자자 권한일 때, 투자자 마이페이지 요청(첫화면-회원정보, 계좌정보)
	User selectInvestorBasic(String userId);
}
