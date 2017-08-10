package com.pineapple.funding.service;

import java.util.ArrayList;
import java.util.List;

public interface FundingServiceInterface {
	void addFunding(Funding funding);
	List<Funding> getMyFundinglist(String userId);
}