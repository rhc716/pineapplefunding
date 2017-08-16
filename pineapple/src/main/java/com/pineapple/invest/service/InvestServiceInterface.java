package com.pineapple.invest.service;

import java.util.List;

import com.pineapple.funding.service.FundingDetail;

public interface InvestServiceInterface {
	//전체펀딩리스트 service(투자하기 main)
	List<InvestAndFd> getInvestFunding();
	//하나의 펀딩 Data 불러오는 Service(투자하기 list 에서 펀딩클릭시)
	InvestAndFdLikeAndFd getInvestFundingone(int fdCode);
	//하나의 펀딩 Detail 불러오는 Service
	FundingDetail getInvestFundingDetail(int fdCode);
	//하나의 펀딩 Q&A 불러오는 Service
	List<FundingQna> getInvestFundingQna(int fdCode);
}