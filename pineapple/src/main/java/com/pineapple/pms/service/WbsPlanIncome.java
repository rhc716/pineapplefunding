package com.pineapple.pms.service;

public class WbsPlanIncome {
	private int wpiCode;
	private int wpiFdCode;
	private int wpiMsCode;
	private int wpiWpCode;
	private int wpiIncome;
	private int wpiComCode;
	private String wpiReason;
	private String wpiStartDate;
	private String wpiEndDate;
	public int getWpiCode() {
		return wpiCode;
	}
	public void setWpiCode(int wpiCode) {
		this.wpiCode = wpiCode;
	}
	public int getWpiFdCode() {
		return wpiFdCode;
	}
	public void setWpiFdCode(int wpiFdCode) {
		this.wpiFdCode = wpiFdCode;
	}
	public int getWpiMsCode() {
		return wpiMsCode;
	}
	public void setWpiMsCode(int wpiMsCode) {
		this.wpiMsCode = wpiMsCode;
	}
	public int getWpiWpCode() {
		return wpiWpCode;
	}
	public void setWpiWpCode(int wpiWpCode) {
		this.wpiWpCode = wpiWpCode;
	}
	public int getWpiIncome() {
		return wpiIncome;
	}
	public void setWpiIncome(int wpiIncome) {
		this.wpiIncome = wpiIncome;
	}
	public int getWpiComCode() {
		return wpiComCode;
	}
	public void setWpiComCode(int wpiComCode) {
		this.wpiComCode = wpiComCode;
	}
	public String getWpiReason() {
		return wpiReason;
	}
	public void setWpiReason(String wpiReason) {
		this.wpiReason = wpiReason;
	}
	public String getWpiStartDate() {
		return wpiStartDate;
	}
	public void setWpiStartDate(String wpiStartDate) {
		this.wpiStartDate = wpiStartDate;
	}
	public String getWpiEndDate() {
		return wpiEndDate;
	}
	public void setWpiEndDate(String wpiEndDate) {
		this.wpiEndDate = wpiEndDate;
	}
	@Override
	public String toString() {
		return "WbsPlanIncome [wpiCode=" + wpiCode + ", wpiFdCode=" + wpiFdCode + ", wpiMsCode=" + wpiMsCode
				+ ", wpiWpCode=" + wpiWpCode + ", wpiIncome=" + wpiIncome + ", wpiComCode=" + wpiComCode
				+ ", wpiReason=" + wpiReason + ", wpiStartDate=" + wpiStartDate + ", wpiEndDate=" + wpiEndDate + "]";
	}
	
}
