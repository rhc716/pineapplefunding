package com.pineapple.funding.service;

public class FundingAndFdAuth {
	// 펀딩내 부여된 권한을 보여주기위해 담아올 객체 ( pmsmain.jsp에서 사용 )
	private int fdCode;
	private int fdComCode;
	private String fdTitle;
	private String authLevelName;
	private String emComName;
	private String fdStatus;
	
	
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
	public String getAuthLevelName() {
		return authLevelName;
	}
	public void setAuthLevelName(String authLevelName) {
		this.authLevelName = authLevelName;
	}
	public String getEmComName() {
		return emComName;
	}
	public void setEmComName(String emComName) {
		this.emComName = emComName;
	}
	public String getFdStatus() {
		return fdStatus;
	}
	public void setFdStatus(String fdStatus) {
		this.fdStatus = fdStatus;
	}
	@Override
	public String toString() {
		return "FundingAndFdAuth [fdCode=" + fdCode + ", fdComCode=" + fdComCode
				+ ", fdTitle=" + fdTitle + ", authLevelName=" + authLevelName
				+ ", emComName=" + emComName + ", fdStatus=" + fdStatus + "]";
	}
	
	
	
	
	
}
