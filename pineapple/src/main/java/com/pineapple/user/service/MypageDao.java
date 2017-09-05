package com.pineapple.user.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.invest.service.InvestorInvestList;

@Repository
public class MypageDao implements MypageDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	//경영진 기업삭제취소
	@Override
	public int updateCompanyDeleteRequestCancle(Company company) {
		log.debug("MypageDao updateCompanyDeleteRequestCancle 호출 "+company);
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.cancleDeleteCompany", company);
	}
	
	//관리자의 기업삭제처리
	@Override
	public int updateCompanyDelete(Company company) {
		log.debug("MypageDao updateCompanyDelete 호출 "+company);
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.deleteCompany", company);
	}
	
	//관리자의 기업승인처리
	@Override
	public int updateCompanyApproval(Company company) {
		log.debug("MypageDao updateCompanyApproval 호출 "+company);
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.approveCompany", company);
	}
	
	//사원탈퇴처리
	@Override
	public int deleteEmployeeByEmCode(int emCode) {
		log.debug("MypageDao deleteEmployeeByEmCode 호출 "+emCode);
		return sqlSessionTemplate.delete("com.pineapple.user.service.MypageMapper.deleteEmployeebyEmCode", emCode);
	}

	//경영진 마이페이지 분기시 페이지 로딩하면서, 자신이 속한 기업의 모든 사원조회기능 구현을 위한 메서드 선언(입력값 - map)
	@Override
	public List<Employee> selectAllEmployeeInMyComList(Map<String, Object> map) {
		log.debug("MypageDao selectAllEmployeeInMyComList 호출 "+map);
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectAllEmployeeByMyComNameList", map);
	}
	
	//기업삭제요청
	@Override
	public int deleteCompany(Company company) {
		log.debug("MypageDao deleteCompany 호출 "+company);
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.delRequestCompany", company);
	}
	
	//경영진으로 속한 회사이름을 조회하기 위해 employee 정보 조회(ID로)
	@Override
	public List<Employee> selectEmployeeMngById(String emUserId) {
		log.debug("MypageDao selectEmployeeMngById 호출 "+emUserId);
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectEmployeeMngById", emUserId);
	}
	
	//경영진 마이페이지에서 사원요청목록 조회
	@Override
	public List<Employee> selectEmployeeRequestList(String comName) {
		log.debug("MypageDao selectEmployeeRequestList 호출 "+comName);
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectEmployeeRequestByComName", comName);
	}
	
	//사원정보 조회 메서드 선언(사원정보 수정페이지 요청을 위해)
	@Override
	public Employee selectEmployeeByEmCode(int emCode) {
		log.debug("MypageDao selectEmployeeByEmCode 호출 "+emCode);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectEmployeeByEmCode", emCode);
	}
	
	//기업정보 조회 메서드 선언(기업정보 수정페이지 요청을 위해)
	@Override
	public Company selectCompanyByComCode(int comCode) {
		log.debug("MypageDao selectCompanyByComCode 호출 "+comCode);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectCompanyInfoByComCode", comCode);
	}
	
	//사원등록정보 확인 모달에서 부서명 수정하기 요청 처리
	@Override
	public int updateEmployeeInfo(Employee employee) {
		log.debug("MypageDao updateEmployeeInfo 호출 "+employee);
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.updateEmployeeInfo", employee);
	}
	//경영진 마이페이지 개설한 기업정보 수정 요청 처리
	@Override
	public int updateCompanyInfo(Company company) {
		log.debug("MypageDao updateCompanyInfo 호출 "+company);
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.updateCompanyInfo", company);
	}
	//투자자 투자내역 조회
	@Override
	public List<InvestorInvestList> selectInvestor(String investId) {
		log.debug("MypageDao selectInvestor 호출 "+investId);
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectInvest", investId);
	}
	//투자자, 사이트관리자의 계좌조회 메서드 선언
	@Override
	public Account selectAccountByAccountCode(int accountCode) {
		log.debug("MypageDao selectAccountByAccountId 호출 "+accountCode);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectAccountByAccountCode", accountCode);
	}
	//기업명 중복체크 기능 구현을 위한 메서드 선언
	@Override
	public Company selectCompanyByComName(String comName) {
		log.debug("MypageDao selectCompanyByComName 호출 "+comName);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectCompanyByComName", comName);
	}
	//아이디로 사원조회
	@Override
	public List<Employee> selectEmployee(String userId) {
		log.debug("MypageDao selectEmployee 호출 "+userId);
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectEmployeeById", userId);
	}
	//사원등록 요청 처리
	@Override
	public int insertEmployee(Employee employee) {
		log.debug("MypageDao insertEmployee 호출 "+employee);
		return sqlSessionTemplate.insert("com.pineapple.user.service.MypageMapper.insertEmployeeInfo", employee);
	}
	//사원등록시 특정회사검색 요청 처리
	@Override
	public Company selectMyCompany(String comName) {
		log.debug("MypageDao selectMyCompany 호출 ");
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectCompanyByName", comName);
	}
	//사원등록시 전체회사검색 요청 처리
	@Override
	public List<Company> selectAllCompany() {
		log.debug("MypageDao selectAllCompany 호출 ");
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectAllCompany");
	}
	//경영진 마이페이지에서 기업등록요청 처리 메서드 선언
	@Override
	public int insertCompany(Company company) {
		log.debug("MypageDao insertCompany 호출 "+company);
		return sqlSessionTemplate.insert("com.pineapple.user.service.MypageMapper.insertCompany", company);
	}
	//경영진 마이페이지 분기시 자신이 개설한 회사정보 조회 메서드 선언
	@Override
	public List<Company> selectCompanyByOpenId(String comOpenUserId) {
		log.debug("MypageDao selectCompanyByOpenId 호출 "+comOpenUserId);
		return sqlSessionTemplate.selectList("com.pineapple.user.service.MypageMapper.selectCompanyInfoByOpenId", comOpenUserId);
	}
	//회원상세정보 수정을 위한 메서드 선언
	@Override
	public int updateUserDetail(UserDetail userdetail) {
		log.debug("MypageDao updateUserDetail 호출 결과: "+sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.updateUserDetailById", userdetail));
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.updateUserDetailById", userdetail);
	}
	//회원상세정보 조회를 위한 메서드 선언
	@Override
	public UserDetail selectUserDetail(String userDetailId) {
		log.debug("MypageDao selectUserDetail : "+userDetailId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectUserDetailById", userDetailId);
	}
	//투자자 마이페이지 첫화면 구성을 위한 투자자 기본 정보와 계좌 정보 조회 메서드
	@Override
	public User selectInvestorBasic(String userId) {
		log.debug("MypageDao selectInvestorBasic 메서드 호출"+userId);
		User user = new User();
		user.setUserId(userId);
		log.debug("MypageDao selectInvestorBasic 메서드 호출 결과"+sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectAllInvestorInfo", userId));
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectAllInvestorInfo", userId);
	}

	

	
}
