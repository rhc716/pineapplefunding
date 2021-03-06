package com.pineapple.funding.service;

public class FundingAndMileStone {
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
	private String posterImgName;
	private String posterImgExtension;
	private int posterImgWidth;
	private int posterImgHeight;
	private int posterImgSize;
	private String fdPublisher;
	private int adminApproval;
	private String fdApprovalDate;
	private String fdApprovalId;
	private String fdDate;
	//마일스톤부분
	private int milestoneCode;
	private int msFdCode;
	private int milestoneStep;
	private String milestoneName;
	private String milestoneSummary;
	private int msComCode;
	private String pm;
	
	
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
	public String getPosterImgName() {
		return posterImgName;
	}
	public void setPosterImgName(String posterImgName) {
		this.posterImgName = posterImgName;
	}
	public String getPosterImgExtension() {
		return posterImgExtension;
	}
	public void setPosterImgExtension(String posterImgExtension) {
		this.posterImgExtension = posterImgExtension;
	}
	public int getPosterImgWidth() {
		return posterImgWidth;
	}
	public void setPosterImgWidth(int posterImgWidth) {
		this.posterImgWidth = posterImgWidth;
	}
	public int getPosterImgHeight() {
		return posterImgHeight;
	}
	public void setPosterImgHeight(int posterImgHeight) {
		this.posterImgHeight = posterImgHeight;
	}
	public int getPosterImgSize() {
		return posterImgSize;
	}
	public void setPosterImgSize(int posterImgSize) {
		this.posterImgSize = posterImgSize;
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
	public int getMilestoneCode() {
		return milestoneCode;
	}
	public void setMilestoneCode(int milestoneCode) {
		this.milestoneCode = milestoneCode;
	}
	public int getMsFdCode() {
		return msFdCode;
	}
	public void setMsFdCode(int msFdCode) {
		this.msFdCode = msFdCode;
	}
	public int getMilestoneStep() {
		return milestoneStep;
	}
	public void setMilestoneStep(int milestoneStep) {
		this.milestoneStep = milestoneStep;
	}
	public String getMilestoneName() {
		return milestoneName;
	}
	public void setMilestoneName(String milestoneName) {
		this.milestoneName = milestoneName;
	}
	public String getMilestoneSummary() {
		return milestoneSummary;
	}
	public void setMilestoneSummary(String milestoneSummary) {
		this.milestoneSummary = milestoneSummary;
	}
	public int getMsComCode() {
		return msComCode;
	}
	public void setMsComCode(int msComCode) {
		this.msComCode = msComCode;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	
	
	@Override
	public String toString() {
		return "FundingAndMileStone [fdCode=" + fdCode + ", fdComCode="
				+ fdComCode + ", fdTitle=" + fdTitle + ", minInvestMoney="
				+ minInvestMoney + ", numberOfShares=" + numberOfShares
				+ ", issuePrice=" + issuePrice + ", openDate=" + openDate
				+ ", closeDate=" + closeDate + ", minInterestRate="
				+ minInterestRate + ", fdType=" + fdType + ", fdStatus="
				+ fdStatus + ", projectStartDate=" + projectStartDate
				+ ", projectEndDate=" + projectEndDate + ", posterImgName="
				+ posterImgName + ", posterImgExtension=" + posterImgExtension
				+ ", posterImgWidth=" + posterImgWidth + ", posterImgHeight="
				+ posterImgHeight + ", posterImgSize=" + posterImgSize
				+ ", fdPublisher=" + fdPublisher + ", adminApproval="
				+ adminApproval + ", fdApprovalDate=" + fdApprovalDate
				+ ", fdApprovalId=" + fdApprovalId + ", fdDate=" + fdDate
				+ ", milestoneCode=" + milestoneCode + ", msFdCode=" + msFdCode
				+ ", milestoneStep=" + milestoneStep + ", milestoneName="
				+ milestoneName + ", milestoneSummary=" + milestoneSummary
				+ ", msComCode=" + msComCode + ", pm=" + pm + "]";
	}
	
	
}
