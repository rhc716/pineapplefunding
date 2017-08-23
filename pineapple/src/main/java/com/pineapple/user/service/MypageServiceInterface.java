package com.pineapple.user.service;

import java.util.List;

public interface MypageServiceInterface {
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
