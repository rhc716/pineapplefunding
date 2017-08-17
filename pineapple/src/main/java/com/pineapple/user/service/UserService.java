package com.pineapple.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceInterface {

	@Autowired
	private UserDaoInterface dao;
	//회원상세정보조회를 위한 메서드 호출
	@Override
	public UserDetail getUserDetail(String userDetailId) {
		System.out.println("service getUserDetail 호출 : "+userDetailId);
		return dao.selectUserDetail(userDetailId);
	}
	
	//회원상세정보입력 처리를 위한 메서드 호출
	@Override
	public int addUserDetail(UserDetail userdetail) {
		System.out.println("service addUserDetail 호출 : "+userdetail);
		return dao.insertUserDetail(userdetail);
	}
	
	//로그인 요청 처리를 위한 권한명,직급명을 포함한 회원 정보 호출
	@Override
	public UserAndLevelAndEmployeeAndCompanyAndRank gettUserByIdLevelnameRankname(String userId) {
		System.out.println("service gettUserByIdLevelnameRankname 호출 : "+dao.selectUserByIdWithLevelnameRankname(userId).getUserId());
		return dao.selectUserByIdWithLevelnameRankname(userId);
	}

	//회원가입시 닉네임 중복체크 기능을 위한 dao 메서드 호출
		/* (non-Javadoc)
		 * @see com.pineapple.user.service.UserServiceInterface#getUserByNickname(java.lang.String)
		 */
	@Override
	public User getUserByNickname(String nickname){
		System.out.println("service getUserByNickname 호출 : "+dao.selectUserByNickname(nickname).getNickname());
		return dao.selectUserByNickname(nickname);
	}
	
	//회원가입시 아이디 중복체크 기능,로그인 요청 처리를 위한 dao 메서드 호출
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserServiceInterface#getUser(java.lang.String)
	 */
	@Override
	public User getUser(String userId){
		System.out.println("service getUser 호출");
		return dao.selectUserById(userId);
	}
	
	//회원가입시 회원정보 입력하기 위한 dao 메서드 호출
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserServiceInterface#addUser(com.pineapple.user.service.User)
	 */
	@Override
	public int addUser(User user) {
		System.out.println("service addUser 호출");
		return dao.insertUser(user);
	}

	

}
