package com.pineapple.user.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceInterface {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserDaoInterface dao;
	
	//투자자, 사이트관리자의 계좌수정 메서드 선언
	@Override
	public int changeAccountByAccountCode(Account account) {
		log.debug("service changeAccountByAccountCode 호출 : "+account);
		return dao.updateAccountByAccountCode(account);
	}
	
	//투자자, 사이트관리자의 계좌삭제 메서드 선언
	@Override
	public int removeAccountByAccountCode(int accountCode) {
		log.debug("service removeAccountByAccountCode 호출 : "+accountCode);
		return dao.deleteAccountByAccountCode(accountCode);
	}
	
	//투자자, 사이트관리자의 계좌조회 메서드 선언
	@Override
	public List<Account> getAccountByAccountCode(int accountCode) {
		log.debug("service getAccountByAccountCode 호출 : "+accountCode);
		return dao.selectAccountByAccountCode(accountCode);
	}
	
	//투자자, 사이트관리자 새로운 계좌등록을 위한 메서드 호출
	@Override
	public int addAccount(Account account) {
		log.debug("service addAccount 호출 : "+account);
		return dao.insertAccount(account);
	}
	
	//비밀번호 변경을 위한 메서드 호출
	@Override
	public int modifyUserPw(Map map) {
		log.debug("service modifyUserPw 호출 : "+map.get("userId"));
		return dao.updateUserPw(map);
	}

	//회원상세정보조회를 위한 메서드 호출
	@Override
	public UserDetail getUserDetail(String userDetailId) {
		log.debug("service getUserDetail 호출 : "+userDetailId);
		return dao.selectUserDetail(userDetailId);
	}
	
	//회원상세정보입력 처리를 위한 메서드 호출
	@Override
	public int addUserDetail(UserDetail userdetail) {
		log.debug("service addUserDetail 호출 : "+userdetail);
		return dao.insertUserDetail(userdetail);
	}
	
	//로그인 요청 처리를 위한 권한명,직급명을 포함한 회원 정보 호출
	@Override
	public UserAndLevelAndEmployeeAndCompanyAndRank gettUserByIdLevelnameRankname(String userId) {
		log.debug("service gettUserByIdLevelnameRankname 호출 : "+dao.selectUserByIdWithLevelnameRankname(userId).getUserId());
		return dao.selectUserByIdWithLevelnameRankname(userId);
	}

	//회원가입시 닉네임 중복체크 기능을 위한 dao 메서드 호출
		/* (non-Javadoc)
		 * @see com.pineapple.user.service.UserServiceInterface#getUserByNickname(java.lang.String)
		 */
	@Override
	public User getUserByNickname(String nickname){
		log.debug("service getUserByNickname 호출 : "+nickname);
		return dao.selectUserByNickname(nickname);
	}
	
	//회원가입시 아이디 중복체크 기능,로그인 요청 처리를 위한 dao 메서드 호출
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserServiceInterface#getUser(java.lang.String)
	 */
	@Override
	public User getUser(String userId){
		log.debug("service getUser 호출");
		return dao.selectUserById(userId);
	}
	
	//회원가입시 회원정보 입력하기 위한 dao 메서드 호출
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserServiceInterface#addUser(com.pineapple.user.service.User)
	 */
	@Override
	public int addUser(User user) {
		log.debug("service addUser 호출");
		return dao.insertUser(user);
	}

	
}
