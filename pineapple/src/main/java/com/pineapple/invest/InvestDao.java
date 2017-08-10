package com.pineapple.invest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.funding.Funding;

@Repository
public class InvestDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	public List<Funding> investFundingSelect(){
		System.out.println("InvestDao-----investFundingSelect");
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sqlSessionTemplate.selectList("com.pineapple.funding.invest.InvestMapper.investFundingSelect",map);
	}
	public List<InvestAndFd> investAndFundingListSelect(){
		System.out.println("InvestDao-----investAndFundingListSelect");
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sqlSessionTemplate.selectList("com.prineapple.funding.invest.InvestMapper.getInvestFundingList",map);
	}
}
