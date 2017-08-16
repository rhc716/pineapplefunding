package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.funding.service.FundingDetail;


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
	//하나의 펀딩 정보 열람
	@Override
	public InvestAndFdLikeAndFd investFundingDataSelect(int fdCode){
		System.out.println("InvestDao-----investFundingDataSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.investFundingDataSelect",fdCode);
	}
	//하나의 펀딩 Detail 열람
	@Override
	public FundingDetail investFundingDetailSelect(int fdCode) {
		System.out.println("InvestDao-----investFundingDetailSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.investFundingDetailSelect",fdCode);
	}
	//하나의 펀딩 Q&A SELECT
	@Override
	public List<FundingQna> investFundingQnaSelect(int fdCode) {
		System.out.println("InvestDao-----investFundingQnaSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.investFundingQna",fdCode);
	}
}
