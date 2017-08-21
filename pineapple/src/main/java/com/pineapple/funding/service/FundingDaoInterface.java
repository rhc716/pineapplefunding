package com.pineapple.funding.service;


import java.util.List;

import com.pineapple.user.service.Employee;

public interface FundingDaoInterface {
	void insertFunding(Funding funding);
	List<Funding> selectMyFundinglist(String userId);
	int deleteFunding(int delfdCode);
	void updateFunding(Funding funding, int fdCode);
	List<FundingAndFdDetail> selectFundingDetailList(String userId);
	void updateFundingDetail(FundingDetail fundingdetail);
	void insertFundingDetail(int pk);
	void deleteFundingDetail(int delfdCode);
	void insertMileStone(MileStone milestone);
	List<Funding> selectFundingForInsertMileStone(String userId);
	List<Employee> selectEmployeeForInsertMileStone(int fdCode);
	List<FundingAndMileStone> selectMyMileStoneList(String userId);
	void updateMileStone(MileStone mileStone);
	void deleteMileStone(int delMsCode);
	void insertFundingFile(FundingAndFdFile file);
	List<FundingAndFdFile> selectFundingFileList(String userId);
}