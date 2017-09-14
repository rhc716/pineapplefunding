package com.pineapple.funding.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.pineapple.invest.service.Investment;
import com.pineapple.user.service.Company;
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
	void deleteFundingFile(int fdFileCode);
	void insertDividendPlan(FundingDividendPlan fundingdividendplan);
	List<FundingAndFdDividendPlan> selectFundingDividendPalnList(int fdCode);
	void deleteFundingDividendPaln(int divCode);
	List<Company> selectComList(String userId);
	void updateFundingImage(Model model);
	Funding fdtitleCheck(String fdTitle);
	Funding selectMyFunding(int fdCode);
	List<Object> selectProjectInfoList(String userId, String level);
	List<Object> selectMoreFdList(int numberOfRequests);
	List<Object> selectMilestoneListOfFunding(int fdCode);
	MileStone milestoneStepCheck(int msFdCode, int milestoneStep);
	void selectForfundingTotalViewPage(int fdCode, Model model);
	List<FundingAndFdFile> selectFundingFileList(int fdCode);
	List<Object> selectAllFundingList();
	List<Investment> selectFundingInvestorList(int fdCode,
			int numberOfRequests);
	List<Object> selectEndFundingList();
	List<Funding> selectMoreEndFundingList(int numberOfRequests);
	int sendMessageAllInvestors(MessageAndFd messageandfd);
	int selectMyNewMessageNum(String userid);
}