package com.pineapple.pms.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pineapple.funding.service.Funding;

@Repository
public class PmsDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	public void insertWbsPlan(WbsPlan wbsplan){
		System.out.println("PmsDao의insertWbsplan호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.insertWbsPlan", wbsplan);
	}
	
	public List<WbsPlan> WbsPlanSelect(){
		System.out.println("PmsDao의 WbsPlanSelect호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlan");
	}

}
