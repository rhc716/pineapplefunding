package com.pineapple.funding.service;

import java.util.List;

public interface FundingServiceInterface {
	void addFunding(Funding funding);
	List<Funding> getMyFundinglist(String userId);
	int removeFunding(int delfdCode);
}