package com.pineapple.funding.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.pineapple.invest.service.Investment;
import com.pineapple.user.service.Company;
import com.pineapple.user.service.Employee;

public interface FundingServiceInterface {
	List<Funding> getMyFundinglist(String userId);
	int removeFunding(int delfdCode);
	void modifyFunding(Funding funding, int fdCode);
	List<FundingAndFdDetail> getMyFundingDetailList(String userId);
	void modifyFundingDetail(FundingDetail fundingdetail);
	void addMileStone(MileStone milestone);
	List<Funding> getFundingForInsertMileStone(String userId);
	List<Employee> getEmployeeForInsertMileStone(int fdCode);
	List<FundingAndMileStone> getMyMileStoneList(String userId);
	void modifyMileStone(MileStone mileStone);
	void removeMileStone(int delMsCode);
	List<FundingAndFdDividendPlan> getFundingDividendPalnList(int fdCode);
	void addDividendPlan(FundingDividendPlan fundingdividendplan);
	void removeFundingFile(int fdFileCode);
	List<FundingAndFdFile> getFundingFileList(String userId);
	void addFundingFile(MultipartFile uploadFile, String result, int fdCode);
	void removeFundingDividendPaln(int divCode);
	List<Investment> getFundingInvestorList(int fdCode);
	List<Company> getComList(String userId);
	void addFunding(Funding funding);
	void modifyFundingImage(Model model);
	Funding fdtitleCheck(String fdTitle);
	Funding getMyFunding(int fdCode);
}