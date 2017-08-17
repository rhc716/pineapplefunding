package com.pineapple.user.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDao implements MypageDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int modifyUserDetail(UserDetail userdetail) {
		log.debug("MypageDao modifyUserDetail 호출 결과: "+sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.updateUserDetailById", userdetail));
		return sqlSessionTemplate.update("com.pineapple.user.service.MypageMapper.updateUserDetailById", userdetail);
	}
	
	//회원상세정보 조회를 위한 메서드 선언
	@Override
	public UserDetail getUserDetail(String userDetailId) {
		log.debug("MypageDao getUserDetail : "+userDetailId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.selectUserDetailById", userDetailId);
	}
	
	//투자자 마이페이지 첫화면 구성을 위한 투자자 기본 정보와 계좌 정보 조회 메서드
	@Override
	public User getInvestorBasic(String userId) {
		log.debug("MypageDao getInvestorBasic 메서드 호출"+userId);
		User user = new User();
		user.setUserId(userId);
		log.debug("MypageDao getInvestorBasic 메서드 호출 결과"+sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.getAllInvestorInfo", userId));
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.MypageMapper.getAllInvestorInfo", userId);
	}

}
