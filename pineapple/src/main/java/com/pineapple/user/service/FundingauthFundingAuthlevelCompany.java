package com.pineapple.user.service;

public class FundingauthFundingAuthlevelCompany {
	private int authCode;
	private int authFdCode;
	private String authReceiver;
	private String authGiver;
	private int fdAuthLevelCode;
	private int fdComCode;
	private String comName;
	private String fdTitle;
	private String fdStatus;
	private String authLevelName;
	
	public int getAuthCode() {
		return authCode;
	}
	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
	public int getAuthFdCode() {
		return authFdCode;
	}
	public void setAuthFdCode(int authFdCode) {
		this.authFdCode = authFdCode;
	}
	public String getAuthReceiver() {
		return authReceiver;
	}
	public void setAuthReceiver(String authReceiver) {
		this.authReceiver = authReceiver;
	}
	public String getAuthGiver() {
		return authGiver;
	}
	public void setAuthGiver(String authGiver) {
		this.authGiver = authGiver;
	}
	public int getFdAuthLevelCode() {
		return fdAuthLevelCode;
	}
	public void setFdAuthLevelCode(int fdAuthLevelCode) {
		this.fdAuthLevelCode = fdAuthLevelCode;
	}
	public int getFdComCode() {
		return fdComCode;
	}
	public void setFdComCode(int fdComCode) {
		this.fdComCode = fdComCode;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public String getFdStatus() {
		return fdStatus;
	}
	public void setFdStatus(String fdStatus) {
		this.fdStatus = fdStatus;
	}
	public String getAuthLevelName() {
		return authLevelName;
	}
	public void setAuthLevelName(String authLevelName) {
		this.authLevelName = authLevelName;
	}
	@Override
	public String toString() {
		return "FundingauthFundingAuthlevelCompany [authCode=" + authCode + ", authFdCode=" + authFdCode
				+ ", authReceiver=" + authReceiver + ", authGiver=" + authGiver + ", fdAuthLevelCode=" + fdAuthLevelCode
				+ ", fdComCode=" + fdComCode + ", comName=" + comName + ", fdTitle=" + fdTitle + ", fdStatus="
				+ fdStatus + ", authLevelName=" + authLevelName + "]";
	}
	
}
