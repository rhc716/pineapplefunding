package com.pineapple.user.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.invest.service.InvestorInvestList;

@Service
public class MypageService implements MypageServiceInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageDaoInterface mypagedao;
	
	//사원등록정보 확인 모달에서 부서명 수정하기 요청 처리
	
	
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
		log.debug("MypageService getUserDetail 호출 : "+userDetailId);
		return mypagedao.selectUserDetail(userDetailId);
	}
	//투자자 마이페이지 첫화면 구성을 위한 투자자 기본 정보와 계좌 정보 조회 메서드
	@Override
	public User getInvestorBasic(String userId) {
		log.debug("MypageService selectInvestorBasic 메서드 호출 "+userId);
		return mypagedao.selectInvestorBasic(userId);
	}


}
