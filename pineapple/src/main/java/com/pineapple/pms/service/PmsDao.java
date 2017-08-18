package com.pineapple.pms.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pineapple.funding.service.Funding;

@Repository
public class PmsDao implements PmsDaoInterface {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#insertWbsPlan(com.pineapple.pms.service.WbsPlan)
	 */
	@Override
	public void insertWbsPlan(WbsPlan wbsplan){
		System.out.println("PmsDao의insertWbsplan호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.insertWbsPlan", wbsplan);
	}
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#WbsPlanSelect()
	 */
	@Override
	public List<WbsPlanView> WbsPlanSelect(String userId){
		System.out.println("PmsDao의 WbsPlanSelect호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlan", userId);
	}
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#getMyWbsPlanDetail(java.lang.String)
	 */
	@Override
	public WbsPlanView getMyWbsPlanDetail(String wbsplancode){
		System.out.println("PmsDao의 selectWbsPlandetail호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.pms.service.PmsMapper.selectdetail",wbsplancode);
	}
	@Override
	public void insertWbsPlanHuman(WbsPlanHuman wbsplanhuman){
		System.out.println("PmsDao의 insertWbsPlanHuman호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.insertWbsPlanHuman", wbsplanhuman);
	}

}
