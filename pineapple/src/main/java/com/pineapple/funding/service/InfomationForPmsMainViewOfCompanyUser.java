package com.pineapple.funding.service;

import java.util.ArrayList;

import com.pineapple.user.service.Company;
import com.pineapple.user.service.CompanyAndRank;

public class InfomationForPmsMainViewOfCompanyUser {
	//소속된 회사리스트
	private ArrayList<CompanyAndRank> comList;
	//펀딩상태가 모집중 or 결제모집중 or 진행중 펀딩 (개설요청, 마감이 아닌 것)
	private int fdTotalCount;
	private int fdRecruitingCount;
	private int fdProceedingCount;
	// 펀딩내의 권한과 펀딩을 세트로 가져올 리스트
	private ArrayList<FundingAndFdAuth> FundingAndFdAuthList;	
	
	
	public ArrayList<FundingAndFdAuth> getFundingAndFdAuthList() {
		return FundingAndFdAuthList;
	}
	public void setFundingAndFdAuthList(
			ArrayList<FundingAndFdAuth> fundingAndFdAuthList) {
		FundingAndFdAuthList = fundingAndFdAuthList;
	}
	
	public ArrayList<CompanyAndRank> getComList() {
		return comList;
	}
	public void setComList(ArrayList<CompanyAndRank> comList) {
		this.comList = comList;
	}
	public int getFdTotalCount() {
		return fdTotalCount;
	}
	public void setFdTotalCount(int fdTotalCount) {
		this.fdTotalCount = fdTotalCount;
	}
	public int getFdRecruitingCount() {
		return fdRecruitingCount;
	}
	public void setFdRecruitingCount(int fdRecruitingCount) {
		this.fdRecruitingCount = fdRecruitingCount;
	}
	public int getFdProceedingCount() {
		return fdProceedingCount;
	}
	public void setFdProceedingCount(int fdProceedingCount) {
		this.fdProceedingCount = fdProceedingCount;
	}
	@Override
	public String toString() {
		return "InfomationForPmsMainViewOfCompanyUser [comList=" + comList
				+ ", fdTotalCount=" + fdTotalCount
				+ ", fdRecruitingCount=" + fdRecruitingCount
				+ ", fdProceedingCount=" + fdProceedingCount
				+ ", FundingAndFdAuthList=" + FundingAndFdAuthList + "]";
	}
	
	

}
