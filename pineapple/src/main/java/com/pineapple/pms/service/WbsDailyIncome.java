package com.pineapple.pms.service;

public class WbsDailyIncome {
	
	
	private int wpiCode;
	private int wpiFdCode;
	private int wpiMsCode;
	private int wpiWaCode;
	private int wpiIncome;
	private int wpiComCode;
	private String wpiReason;
	private String wpiDate;
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
	public int getwpiWaCode() {
		return wpiWaCode;
	}
	public void setwpiWaCode(int wpiWaCode) {
		this.wpiWaCode = wpiWaCode;
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
	public String getWpiDate() {
		return wpiDate;
	}
	public void setWpiDate(String wpiDate) {
		if(wpiDate==""){
			wpiDate=null;
		}else{
			this.wpiDate = wpiDate;
		}
	}

	@Override
	public String toString() {
		return "WbsPlanIncome [wpiCode=" + wpiCode + ", wpiFdCode=" + wpiFdCode + ", wpiMsCode=" + wpiMsCode
				+ ", wpiWaCode=" + wpiWaCode + ", wpiIncome=" + wpiIncome + ", wpiComCode=" + wpiComCode
				+ ", wpiReason=" + wpiReason + ", wpiDate=" + wpiDate + "]";
	}

}
