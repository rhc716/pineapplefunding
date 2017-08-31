package com.pineapple.funding.service;

import java.util.ArrayList;

import com.pineapple.user.service.Company;

public class InfomationForPmsMainViewOfCompanyUser {
	//소속된 회사리스트
	private ArrayList<Company> comList;
	//펀딩상태가 모집중 or 결제모집중 or 진행중 펀딩 (개설요청, 마감이 아닌 것)
	private ArrayList<Funding> FdList;
	private int fdTotalCount;
	private int fdRecruitingCount;
	private int fdProceedingCount;
	
	
	public ArrayList<Company> getComList() {
		return comList;
	}
	public void setComList(ArrayList<Company> comList) {
		this.comList = comList;
	}
	public ArrayList<Funding> getFdList() {
		return FdList;
	}
	public void setFdList(ArrayList<Funding> fdList) {
		FdList = fdList;
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
				+ ", FdList=" + FdList + ", fdTotalCount=" + fdTotalCount
				+ ", fdRecruitingCount=" + fdRecruitingCount
				+ ", fdProceedingCount=" + fdProceedingCount + "]";
	}
	
	
	
	
}
