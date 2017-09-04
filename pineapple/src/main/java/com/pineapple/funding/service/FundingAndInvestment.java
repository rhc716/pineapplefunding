package com.pineapple.funding.service;

public class FundingAndInvestment {
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
	
	private int investCode;
	private int investFdCode;
	private String investId;
	private int purchaseShares;
	private String investTime;
	private int payCheck;
	
	
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
	public int getInvestCode() {
		return investCode;
	}
	public void setInvestCode(int investCode) {
		this.investCode = investCode;
	}
	public int getInvestFdCode() {
		return investFdCode;
	}
	public void setInvestFdCode(int investFdCode) {
		this.investFdCode = investFdCode;
	}
	public String getInvestId() {
		return investId;
	}
	public void setInvestId(String investId) {
		this.investId = investId;
	}
	public int getPurchaseShares() {
		return purchaseShares;
	}
	public void setPurchaseShares(int purchaseShares) {
		this.purchaseShares = purchaseShares;
	}
	public String getInvestTime() {
		return investTime;
	}
	public void setInvestTime(String investTime) {
		this.investTime = investTime;
	}
	public int getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(int payCheck) {
		this.payCheck = payCheck;
	}
	
	@Override
	public String toString() {
		return "FundingAndInvestment [fdCode=" + fdCode + ", fdComCode="
				+ fdComCode + ", fdTitle=" + fdTitle + ", minInvestMoney="
				+ minInvestMoney + ", numberOfShares=" + numberOfShares
				+ ", issuePrice=" + issuePrice + ", openDate=" + openDate
				+ ", closeDate=" + closeDate + ", minInterestRate="
				+ minInterestRate + ", fdType=" + fdType + ", fdStatus="
				+ fdStatus + ", projectStartDate=" + projectStartDate
				+ ", projectEndDate=" + projectEndDate + ", posterImg="
				+ posterImg + ", fdPublisher=" + fdPublisher
				+ ", adminApproval=" + adminApproval + ", fdApprovalDate="
				+ fdApprovalDate + ", fdApprovalId=" + fdApprovalId
				+ ", fdDate=" + fdDate + ", investCode=" + investCode
				+ ", investFdCode=" + investFdCode + ", investId=" + investId
				+ ", purchaseShares=" + purchaseShares + ", investTime="
				+ investTime + ", payCheck=" + payCheck + "]";
	}
	
	
	
}
