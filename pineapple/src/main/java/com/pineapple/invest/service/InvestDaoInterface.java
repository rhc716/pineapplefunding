package com.pineapple.invest.service;

import java.util.List;

import com.pineapple.funding.service.Funding;

public interface InvestDaoInterface {
	//전체펀딩리스트 조회Dao
	List<InvestAndFd> investFundingSelect();
	//하나의 펀딩 data 불러오는 Dao
	InvestAndFdLikeAndFd investFundingDataSelect(int fdCode);
}