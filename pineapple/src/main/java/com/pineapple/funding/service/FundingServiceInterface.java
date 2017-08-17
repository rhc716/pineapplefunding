package com.pineapple.funding.service;

import java.util.List;

import com.pineapple.user.service.Employee;

public interface FundingServiceInterface {
	void addFunding(Funding funding);
	List<Funding> getMyFundinglist(String userId);
	int removeFunding(int delfdCode);
	void modifyFunding(Funding funding, int fdCode);
	List<FundingAndFdDetail> getMyFundingDetailList(String userId);
	void modifyFundingDetail(FundingDetail fundingdetail);
	void addMileStone(MileStone milestone);
	List<Employee> getemployeeforinsertmilestone(int fdCode);
	List<Funding> getFundingForInsertMileStone(String userId);
}