package com.pineapple.funding.service;

import java.util.List;

public class InfomationForPmsMainViewOfInvestorUser {
	//사전예약중인 펀딩리스트
	private List<Funding> fdBookingList;
	//투자중인 펀딩리스트 
	private List<Funding> fdInvestingList;
	//투자총액
	private int totalInvestMoney;
	//배당총액
	private int totalDevidendMoney;
	//총투자건수
	private int totalInvestmentCount;
	//진행중인 투자수 (투자결제가 이루어진 투자중 펀딩상태가 마감이 아닌 것)
	private int proceedingInvestmentCount;
	//진행중인 펀딩의 투자금액 (위의 진행중인 투자들의 투자금액의 합)
	private int proceedingFdInvestMoney;
	//진행중인 펀딩의 배당금액 (위의 진행중인 투자들에서 받은 배당금액의 합 )
	private int proceedingFdDevidendMoney;
	
	
	
	public List<Funding> getFdBookingList() {
		return fdBookingList;
	}
	public void setFdBookingList(List<Funding> fdBookingList) {
		this.fdBookingList = fdBookingList;
	}
	public List<Funding> getFdInvestingList() {
		return fdInvestingList;
	}
	public void setFdInvestingList(List<Funding> fdInvestingList) {
		this.fdInvestingList = fdInvestingList;
	}
	public int getTotalInvestMoney() {
		return totalInvestMoney;
	}
	public void setTotalInvestMoney(int totalInvestMoney) {
		this.totalInvestMoney = totalInvestMoney;
	}
	public int getTotalDevidendMoney() {
		return totalDevidendMoney;
	}
	public void setTotalDevidendMoney(int totalDevidendMoney) {
		this.totalDevidendMoney = totalDevidendMoney;
	}
	public int getTotalInvestmentCount() {
		return totalInvestmentCount;
	}
	public void setTotalInvestmentCount(int totalInvestmentCount) {
		this.totalInvestmentCount = totalInvestmentCount;
	}
	public int getProceedingInvestmentCount() {
		return proceedingInvestmentCount;
	}
	public void setProceedingInvestmentCount(int proceedingInvestmentCount) {
		this.proceedingInvestmentCount = proceedingInvestmentCount;
	}
	public int getProceedingFdInvestMoney() {
		return proceedingFdInvestMoney;
	}
	public void setProceedingFdInvestMoney(int proceedingFdInvestMoney) {
		this.proceedingFdInvestMoney = proceedingFdInvestMoney;
	}
	public int getProceedingFdDevidendMoney() {
		return proceedingFdDevidendMoney;
	}
	public void setProceedingFdDevidendMoney(int proceedingFdDevidendMoney) {
		this.proceedingFdDevidendMoney = proceedingFdDevidendMoney;
	}
	
	
	
	@Override
	public String toString() {
		return "InfomationForPmsMainViewOfInvestorUser [fdBookingList="
				+ fdBookingList + ", fdInvestingList=" + fdInvestingList
				+ ", totalInvestMoney=" + totalInvestMoney
				+ ", totalDevidendMoney=" + totalDevidendMoney
				+ ", totalInvestmentCount=" + totalInvestmentCount
				+ ", proceedingInvestmentCount=" + proceedingInvestmentCount
				+ ", proceedingFdInvestMoney=" + proceedingFdInvestMoney
				+ ", proceedingFdDevidendMoney=" + proceedingFdDevidendMoney
				+ "]";
	}
	
	
	
	
}
