package com.pineapple.funding.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	//회원가입하기 회원기본정보 입력
	public int insertUser(User user) {
    	int row = sqlSessionTemplate.insert("com.pineapple.funding.user.UserMapper.insertUser", user);
    	System.out.println("UserDao insertUser : "+row);
        return row;
    }
}
