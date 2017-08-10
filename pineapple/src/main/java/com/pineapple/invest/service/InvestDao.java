package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.funding.service.Funding;

@Repository
public class InvestDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	public List<Funding> investFundingSelect(){
		System.out.println("InvestDao-----investFundingSelect");
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.investFundingSelect",map);
	}
	public List<InvestAndFd> investAndFundingListSelect(){
		System.out.println("InvestDao-----investAndFundingListSelect");
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sqlSessionTemplate.selectList("com.prineapple.invest.service.InvestMapper.getInvestFundingList",map);
	}
}
