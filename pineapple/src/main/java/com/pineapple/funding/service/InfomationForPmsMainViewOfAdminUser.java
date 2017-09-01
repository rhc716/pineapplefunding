package com.pineapple.funding.service;

public class InfomationForPmsMainViewOfAdminUser {
	private int totalUserCount;
	private int totalComCount;
	private int totalInvestorUserCount;
	private int totalComUserCount;
	private int totalFundingCount;
	//모집중, 결제모집중인 총펀딩수
	private int totalRecruitingFundingCount;
	//개설요청중인 총펀딩수
	private int totalRequestFundingCount;
	//진행중인 총펀딩수
	private int totalProceedingFundingCount;
	
	private int totalVisitCount;
	private int todayVisitCount;
	//총수수료수익금
	private int totalCommissionRevenue;
	//오늘 발생한 수수료수익금
	private int todayCommissionRevenue;
	
	
	
	
	public int getTotalUserCount() {
		return totalUserCount;
	}
	public void setTotalUserCount(int totalUserCount) {
		this.totalUserCount = totalUserCount;
	}
	public int getTotalComCount() {
		return totalComCount;
	}
	public void setTotalComCount(int totalComCount) {
		this.totalComCount = totalComCount;
	}
	public int getTotalInvestorUserCount() {
		return totalInvestorUserCount;
	}
	public void setTotalInvestorUserCount(int totalInvestorUserCount) {
		this.totalInvestorUserCount = totalInvestorUserCount;
	}
	public int getTotalComUserCount() {
		return totalComUserCount;
	}
	public void setTotalComUserCount(int totalComUserCount) {
		this.totalComUserCount = totalComUserCount;
	}
	public int getTotalVisitCount() {
		return totalVisitCount;
	}
	public void setTotalVisitCount(int totalVisitCount) {
		this.totalVisitCount = totalVisitCount;
	}
	public int getTodayVisitCount() {
		return todayVisitCount;
	}
	public void setTodayVisitCount(int todayVisitCount) {
		this.todayVisitCount = todayVisitCount;
	}
	public int getTotalFundingCount() {
		return totalFundingCount;
	}
	public void setTotalFundingCount(int totalFundingCount) {
		this.totalFundingCount = totalFundingCount;
	}
	public int getTotalRecruitingFundingCount() {
		return totalRecruitingFundingCount;
	}
	public void setTotalRecruitingFundingCount(int totalRecruitingFundingCount) {
		this.totalRecruitingFundingCount = totalRecruitingFundingCount;
	}
	public int getTotalRequestFundingCount() {
		return totalRequestFundingCount;
	}
	public void setTotalRequestFundingCount(int totalRequestFundingCount) {
		this.totalRequestFundingCount = totalRequestFundingCount;
	}
	public int getTotalProceedingFundingCount() {
		return totalProceedingFundingCount;
	}
	public void setTotalProceedingFundingCount(int totalProceedingFundingCount) {
		this.totalProceedingFundingCount = totalProceedingFundingCount;
	}
	public int getTotalCommissionRevenue() {
		return totalCommissionRevenue;
	}
	public void setTotalCommissionRevenue(int totalCommissionRevenue) {
		this.totalCommissionRevenue = totalCommissionRevenue;
	}
	public int getTodayCommissionRevenue() {
		return todayCommissionRevenue;
	}
	public void setTodayCommissionRevenue(int todayCommissionRevenue) {
		this.todayCommissionRevenue = todayCommissionRevenue;
	}
	@Override
	public String toString() {
		return "InfomationForPmsMainViewOfAdminUser [totalUserCount="
				+ totalUserCount + ", totalComCount=" + totalComCount
				+ ", totalInvestorUserCount=" + totalInvestorUserCount
				+ ", totalComUserCount=" + totalComUserCount
				+ ", totalVisitCount=" + totalVisitCount + ", todayVisitCount="
				+ todayVisitCount + ", totalFundingCount=" + totalFundingCount
				+ ", totalRecruitingFundingCount=" + totalRecruitingFundingCount
				+ ", totalRequestFundingCount=" + totalRequestFundingCount
				+ ", totalProceedingFundingCount=" + totalProceedingFundingCount
				+ ", totalCommissionRevenue=" + totalCommissionRevenue
				+ ", todayCommissionRevenue=" + todayCommissionRevenue + "]";
	}
	
	
	
	
}
