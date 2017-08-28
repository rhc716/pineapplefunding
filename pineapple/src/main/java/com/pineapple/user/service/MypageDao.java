package com.pineapple.user.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDao implements MypageDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
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
