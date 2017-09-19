package com.pineapple.pms.service;

public class WbsDailyIncome {
	
	
	private int wdiCode;
	private int wdiFdCode;
	private int wdiMsCode;
	private int wdiWaCode;
	private int wdiIncome;
	private int wdiComCode;
	private String wdiReason;
	private String wdiDate;
	public int getwdiCode() {
		return wdiCode;
	}
	public void setwdiCode(int wdiCode) {
		this.wdiCode = wdiCode;
	}
	public int getwdiFdCode() {
		return wdiFdCode;
	}
	public void setwdiFdCode(int wdiFdCode) {
		this.wdiFdCode = wdiFdCode;
	}
	public int getwdiMsCode() {
		return wdiMsCode;
	}
	public void setwdiMsCode(int wdiMsCode) {
		this.wdiMsCode = wdiMsCode;
	}
	public int getwdiWaCode() {
		return wdiWaCode;
	}
	public void setwdiWaCode(int wdiWaCode) {
		this.wdiWaCode = wdiWaCode;
	}
	public int getwdiIncome() {
		return wdiIncome;
	}
	public void setwdiIncome(int wdiIncome) {
		this.wdiIncome = wdiIncome;
	}
	public int getwdiComCode() {
		return wdiComCode;
	}
	public void setwdiComCode(int wdiComCode) {
		this.wdiComCode = wdiComCode;
	}
	public String getwdiReason() {
		return wdiReason;
	}
	public void setwdiReason(String wdiReason) {
		this.wdiReason = wdiReason;
	}
	public String getwdiDate() {
		return wdiDate;
	}
	public void setwdiDate(String wdiDate) {
		if(wdiDate==""){
			wdiDate=null;
		}else{
			this.wdiDate = wdiDate;
		}
	}

	@Override
	public String toString() {
		return "WbsPlanIncome [wdiCode=" + wdiCode + ", wdiFdCode=" + wdiFdCode + ", wdiMsCode=" + wdiMsCode
				+ ", wdiWaCode=" + wdiWaCode + ", wdiIncome=" + wdiIncome + ", wdiComCode=" + wdiComCode
				+ ", wdiReason=" + wdiReason + ", wdiDate=" + wdiDate + "]";
	}

}
