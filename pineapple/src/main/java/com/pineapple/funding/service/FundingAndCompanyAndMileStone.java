package com.pineapple.funding.service;

import java.util.ArrayList;

public class FundingAndCompanyAndMileStone {
	// 하나의 펀딩에 하나의 회사에 여러개의 마일스톤 리스트를 가져오기위한 객체
	private int fdCode;
	private int fdComCode;
	private String fdTitle;
	private int minInvestMoney;
	private int numberOfShares;
	private int issuePrice;
	private String openDate;
	private String closeDate;
	private int minInterestRate;
	private String fdType;
	private String fdStatus;
	private String projectStartDate;
	private String projectEndDate;
	private String posterImg;
	private String fdPublisher;
	private int adminApproval;
	private String fdApprovalDate;
	private String fdApprovalId;
	private String fdDate;
	
	private int comCode;
	private String comName;
	
	private ArrayList<MileStone> mileStoneList;

	public int getFdCode() {
		return fdCode;
	}

	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}

	public int getFdComCode() {
		return fdComCode;
	}

	public void setFdComCode(int fdComCode) {
		this.fdComCode = fdComCode;
	}

	public String getFdTitle() {
		return fdTitle;
	}

	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}

	public int getMinInvestMoney() {
		return minInvestMoney;
	}

	public void setMinInvestMoney(int minInvestMoney) {
		this.minInvestMoney = minInvestMoney;
	}

	public int getNumberOfShares() {
		return numberOfShares;
	}

	public void setNumberOfShares(int numberOfShares) {
		this.numberOfShares = numberOfShares;
	}

	public int getIssuePrice() {
		return issuePrice;
	}

	public void setIssuePrice(int issuePrice) {
		this.issuePrice = issuePrice;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}

	public int getMinInterestRate() {
		return minInterestRate;
	}

	public void setMinInterestRate(int minInterestRate) {
		this.minInterestRate = minInterestRate;
	}

	public String getFdType() {
		return fdType;
	}

	public void setFdType(String fdType) {
		this.fdType = fdType;
	}

	public String getFdStatus() {
		return fdStatus;
	}

	public void setFdStatus(String fdStatus) {
		this.fdStatus = fdStatus;
	}

	public String getProjectStartDate() {
		return projectStartDate;
	}

	public void setProjectStartDate(String projectStartDate) {
		this.projectStartDate = projectStartDate;
	}

	public String getProjectEndDate() {
		return projectEndDate;
	}

	public void setProjectEndDate(String projectEndDate) {
		this.projectEndDate = projectEndDate;
	}

	public String getPosterImg() {
		return posterImg;
	}

	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}

	public String getFdPublisher() {
		return fdPublisher;
	}

	public void setFdPublisher(String fdPublisher) {
		this.fdPublisher = fdPublisher;
	}

	public int getAdminApproval() {
		return adminApproval;
	}

	public void setAdminApproval(int adminApproval) {
		this.adminApproval = adminApproval;
	}

	public String getFdApprovalDate() {
		return fdApprovalDate;
	}

	public void setFdApprovalDate(String fdApprovalDate) {
		this.fdApprovalDate = fdApprovalDate;
	}

	public String getFdApprovalId() {
		return fdApprovalId;
	}

	public void setFdApprovalId(String fdApprovalId) {
		this.fdApprovalId = fdApprovalId;
	}

	public String getFdDate() {
		return fdDate;
	}

	public void setFdDate(String fdDate) {
		this.fdDate = fdDate;
	}

	public int getComCode() {
		return comCode;
	}

	public void setComCode(int comCode) {
		this.comCode = comCode;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public ArrayList<MileStone> getMileStoneList() {
		return mileStoneList;
	}

	public void setMileStoneList(ArrayList<MileStone> mileStoneList) {
		this.mileStoneList = mileStoneList;
	}

	@Override
	public String toString() {
		return "FundingAndCompanyAndMileStone [fdCode=" + fdCode
				+ ", fdComCode=" + fdComCode + ", fdTitle=" + fdTitle
				+ ", minInvestMoney=" + minInvestMoney + ", numberOfShares="
				+ numberOfShares + ", issuePrice=" + issuePrice + ", openDate="
				+ openDate + ", closeDate=" + closeDate + ", minInterestRate="
				+ minInterestRate + ", fdType=" + fdType + ", fdStatus="
				+ fdStatus + ", projectStartDate=" + projectStartDate
				+ ", projectEndDate=" + projectEndDate + ", posterImg="
				+ posterImg + ", fdPublisher=" + fdPublisher
				+ ", adminApproval=" + adminApproval + ", fdApprovalDate="
				+ fdApprovalDate + ", fdApprovalId=" + fdApprovalId
				+ ", fdDate=" + fdDate + ", comCode=" + comCode + ", comName="
				+ comName + ", mileStoneList=" + mileStoneList + "]";
	}

	
	

	
	
}
