package com.pineapple.user.service;

public class FundingAndCompany {
	private int fdCode;
	private int fdComCode;
	private String fdTitle;
	private String openDate;
	private String closeDate; 
	private int minInterestRate;
	private String fdType;
	private String fdStatus;
	private String projectStartDate;
	private String projectEndDate;
	private String fdPublisher;
	private int adminApproval;
	private String fdApprovalDate;
	private String fdApprovalId;
	private String fdDate;
	
	//회사명 
	private String comName;

	public int getFdCode() {
		return fdCode;
	}

	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}

	public String getFdTitle() {
		return fdTitle;
	}

	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
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

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}
	
	public String getFdPublisher() {
		return fdPublisher;
	}

	public void setFdPublisher(String fdPublisher) {
		this.fdPublisher = fdPublisher;
	}

	public int getFdComCode() {
		return fdComCode;
	}

	public void setFdComCode(int fdComCode) {
		this.fdComCode = fdComCode;
	}

	@Override
	public String toString() {
		return "FundingAndCompany [fdCode=" + fdCode + ", fdComCode=" + fdComCode + ", fdTitle=" + fdTitle
				+ ", openDate=" + openDate + ", closeDate=" + closeDate + ", minInterestRate=" + minInterestRate
				+ ", fdType=" + fdType + ", fdStatus=" + fdStatus + ", projectStartDate=" + projectStartDate
				+ ", projectEndDate=" + projectEndDate + ", fdPublisher=" + fdPublisher + ", adminApproval="
				+ adminApproval + ", fdApprovalDate=" + fdApprovalDate + ", fdApprovalId=" + fdApprovalId + ", fdDate="
				+ fdDate + ", comName=" + comName + "]";
	}
	
}
