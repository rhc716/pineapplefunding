package com.pineapple.funding.service;


import java.util.List;

public interface FundingDaoInterface {
	void insertFunding(Funding funding);
	List<Funding> selectMyFundinglist(String userId);
	int deleteFunding(int delfdCode);
}