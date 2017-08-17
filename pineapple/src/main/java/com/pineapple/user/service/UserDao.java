package com.pineapple.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao implements UserDaoInterface {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	//회원상세정보조회를 위한 메서드 선언
	@Override
	public UserDetail selectUserDetail(String userDetailId) {
		System.out.println("UserDao selectUserDetail : "+userDetailId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectUserDetailById", userDetailId);
	}
	
	//회원상세정보입력 처리를 위한 메서드 선언
	@Override
	public int insertUserDetail(UserDetail userdetail) {
		System.out.println("UserDao insertUserDetail : "+userdetail);
		return sqlSessionTemplate.insert("com.pineapple.user.service.UserMapper.insertUserDetail", userdetail);
	}

	//로그인 요청 처리를 위한 회원 정보 접근
	@Override
	public UserAndLevelAndEmployeeAndCompanyAndRank selectUserByIdWithLevelnameRankname(String userId) {
		System.out.println("UserDao selectUserByIdWithLevelnameRankname : "+userId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.getUserWithLevelnameComnameRankname", userId);
	}
	
	//회원가입 닉네임 중복체크 ajax를 위한 닉네임 데이터 접근
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserDaoInterface#selectUserByNickname(java.lang.String)
	 */
	@Override
	public User selectUserByNickname(String nickname){
		System.out.println("UserDao selectUserByNickname : "+nickname);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectUserByNickname", nickname);	
	}
	
	//회원가입 이메일아이디 중복체크 ajax를 위한 회원아이디 데이터 접근
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserDaoInterface#selectUserById(java.lang.String)
	 */
	@Override
	public User selectUserById(String userId){
		System.out.println("UserDao selectUserById : "+userId);
		return sqlSessionTemplate.selectOne("com.pineapple.user.service.UserMapper.selectUserById", userId);	
	}
	
	//회원가입하기 회원기본정보 입력 메서드 선언
	/* (non-Javadoc)
	 * @see com.pineapple.user.service.UserDaoInterface#insertUser(com.pineapple.user.service.User)
	 */
	@Override
	public int insertUser(User user) {
    	int row = sqlSessionTemplate.insert("com.pineapple.user.service.UserMapper.insertUser", user);
    	System.out.println("UserDao insertUser : "+row);
        return row;
    }

	

	
}
