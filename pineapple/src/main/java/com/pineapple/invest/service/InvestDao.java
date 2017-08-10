package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class InvestDao implements InvestDaoInterface {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    //전체펀딩리스트 조회
	/* (non-Javadoc)
	 * @see com.pineapple.invest.service.InvestDaoInterface#investFundingSelect()
	 */
	@Override
	public List<InvestAndFd> investFundingSelect(){
		System.out.println("InvestDao-----investFundingSelect");
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.investFundingSelect",map);
	}
}
