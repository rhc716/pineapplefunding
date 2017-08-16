package com.pineapple.funding.service;


import java.util.List;

public interface FundingDaoInterface {
	void insertFunding(Funding funding);
	List<Funding> selectMyFundinglist(String userId);
	int deleteFunding(int delfdCode);
	void updateFunding(Funding funding, int fdCode);
	List<FundingAndFdDetail> selectFundingDetailList(String userId);
	void updateFundingDetail(FundingDetail fundingdetail);
}