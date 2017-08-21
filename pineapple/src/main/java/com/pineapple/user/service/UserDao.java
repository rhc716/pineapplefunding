package com.pineapple.user.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao implements UserDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	//투자자, 사이트관리자의 계좌수정 메서드 선언
	@Override
	public int updateAccountByAccountCode(Account account) {
		log.debug("UserDao updateAccountByAccountCode : "+account);
		return sqlSessionTemplate.update("com.pineapple.user.service.UserMapper.updateAccountByAccountCode", account);
	}
	
	//투자자, 사이트관리자의 계좌삭제 메서드 선언
	@Override
	public int deleteAccountByAccountCode(int accountCode) {
		log.debug("UserDao deleteAccountByAccountCode : "+accountCode);
		return sqlSessionTemplate.delete("com.pineapple.user.service.UserMapper.deleteAccountByAccountCode", accountCode);
	}
	
	//투자자, 사이트관리자의 계좌조회 메서드 선언
	@Override
	public Account selectAccountByAccountCode(int accountCode) {
		log.debug("UserDao selectAccountByAccountCode : "+accountCode);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectAccountByAccountCode", accountCode);
	}
	
	//투자자, 사이트관리자의 새로운 계좌등록 메서드 선언
	@Override
	public int insertAccount(Account account) {
		log.debug("UserDao insertAccount 호출 : "+account);
		return sqlSessionTemplate.insert("com.pineapple.user.service.UserMapper.insertAccount", account);
	}

	//비밀번호 변경을 위한 메서드 선언
	@Override
	public int updateUserPw(Map map) {
		log.debug("UserDao updateUserPw 호출 : "+map);
		return sqlSessionTemplate.update("com.pineapple.user.service.UserMapper.updatePwById", map);
	}
	
	//회원상세정보조회를 위한 메서드 선언
	@Override
	public UserDetail selectUserDetail(String userDetailId) {
		log.debug("UserDao selectUserDetail : "+userDetailId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectUserDetailById", userDetailId);
	}
	
	//회원상세정보입력 처리를 위한 메서드 선언
	@Override
	public int insertUserDetail(UserDetail userdetail) {
		log.debug("UserDao insertUserDetail : "+userdetail);
		return sqlSessionTemplate.insert("com.pineapple.user.service.UserMapper.insertUserDetail", userdetail);
	}

	//로그인 요청 처리를 위한 회원 정보 접근
	@Override
	public UserAndLevelAndEmployeeAndCompanyAndRank selectUserByIdWithLevelnameRankname(String userId) {
		log.debug("UserDao selectUserByIdWithLevelnameRankname : "+userId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.getUserWithLevelnameComnameRankname", userId);
	}
	
	//회원가입 닉네임 중복체크 ajax를 위한 닉네임 데이터 접근
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserDaoInterface#selectUserByNickname(java.lang.String)
	 */
	@Override
	public User selectUserByNickname(String nickname){
		log.debug("UserDao selectUserByNickname : "+nickname);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectUserByNickname", nickname);	
	}
	
	//회원가입 이메일아이디 중복체크 ajax를 위한 회원아이디 데이터 접근
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserDaoInterface#selectUserById(java.lang.String)
	 */
	@Override
	public User selectUserById(String userId){
		log.debug("UserDao selectUserById : "+userId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectUserById", userId);	
	}
	
	//회원가입하기 회원기본정보 입력 메서드 선언
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserDaoInterface#insertUser(com.pineapple.user.service.User)
	 */
	@Override
	public int insertUser(User user) {
    	int row = sqlSessionTemplate.insert("com.pineapple.user.service.UserMapper.insertUser", user);
    	log.debug("UserDao insertUser : "+row);
        return row;
    }


}
