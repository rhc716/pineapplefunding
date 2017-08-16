package com.pineapple.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceInterface {

	@Autowired
	private UserDaoInterface dao;
	
	//로그인 요청 처리를 위한 권한명을 포함한 회원 정보 호출
	@Override
	public UserAndLevel gettUserByIdWithLevelname(String userId) {
		System.out.println("service gettUserByIdWithLevelname 호출 : "+dao.selectUserByIdWithLevelname(userId).getUserId());
		return dao.selectUserByIdWithLevelname(userId);
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
