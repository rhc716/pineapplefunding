package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.funding.service.FundingDetail;


@Repository
public class InvestDao implements InvestDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    //전체펀딩리스트 조회
	@Override
	public List<InvestAndFd> investFundingSelect(){
		log.debug("InvestDao-----investFundingSelect");
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.getInvestAndFd",map);
	}
	//하나의 펀딩 정보 열람
	@Override
	public InvestAndFdLikeAndFd investFundingDataSelect(int fdCode){
		log.debug("InvestDao-----investFundingDataSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.getInvestAndFdLikeAndFd",fdCode);
	}
	//하나의 펀딩 Detail 열람
	@Override
	public FundingDetail investFundingDetailSelect(int fdCode) {
		log.debug("InvestDao-----investFundingDetailSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.getFundingDetail",fdCode);
	}
	//하나의 펀딩 Q&A SELECT
	@Override
	public List<FundingQna> investFundingQnaSelect(int fdCode) {
		log.debug("InvestDao-----investFundingQnaSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.getFundingQna",fdCode);
	}
}



