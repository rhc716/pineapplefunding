package com.pineapple.funding.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	//회원가입 닉네임 중복체크 ajax를 위한 닉네임 데이터 호출
	public User selectUserByNickname(String nickname){
		System.out.println("UserDao selectUserByNickname : "+nickname);
		return sqlSessionTemplate.selectOne("com.pineapple.funding.user.UserMapper.selectUserByNickname", nickname);	
	}
	
	
	//회원가입 이메일아이디 중복체크 ajax를 위한 회원아이디 데이터 호출
	public User selectUserById(String userId){
		System.out.println("UserDao selectUserById : "+userId);
		return sqlSessionTemplate.selectOne("com.pineapple.funding.user.UserMapper.selectUserById", userId);	
	}
	
	//회원가입하기 회원기본정보 입력
	public int insertUser(User user) {
    	int row = sqlSessionTemplate.insert("com.pineapple.funding.user.UserMapper.insertUser", user);
    	System.out.println("UserDao insertUser : "+row);
        return row;
    }
}
