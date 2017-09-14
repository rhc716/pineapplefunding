package com.pineapple.user.service;

public class WbsDailyMargin {
	private int wdmgCode;
	private int wdmgFdCode;
	private int wdmgMsCode;
	private int wdmgWaCode;
	private int wdmgMargin;
	private String wdmgDate;
	private int wdmgComCode;
	
	public int getWdmgCode() {
		return wdmgCode;
	}
	public void setWdmgCode(int wdmgCode) {
		this.wdmgCode = wdmgCode;
	}
	public int getWdmgFdCode() {
		return wdmgFdCode;
	}
	public void setWdmgFdCode(int wdmgFdCode) {
		this.wdmgFdCode = wdmgFdCode;
	}
	public int getWdmgMsCode() {
		return wdmgMsCode;
	}
	public void setWdmgMsCode(int wdmgMsCode) {
		this.wdmgMsCode = wdmgMsCode;
	}
	public int getWdmgWaCode() {
		return wdmgWaCode;
	}
	public void setWdmgWaCode(int wdmgWaCode) {
		this.wdmgWaCode = wdmgWaCode;
	}
	public int getWdmgMargin() {
		return wdmgMargin;
	}
	public void setWdmgMargin(int wdmgMargin) {
		this.wdmgMargin = wdmgMargin;
	}
	public String getWdmgDate() {
		return wdmgDate;
	}
	public void setWdmgDate(String wdmgDate) {
		this.wdmgDate = wdmgDate;
	}
	public int getWdmgComCode() {
		return wdmgComCode;
	}
	public void setWdmgComCode(int wdmgComCode) {
		this.wdmgComCode = wdmgComCode;
	}
	@Override
	public String toString() {
		return "WbsDailyMargin [wdmgCode=" + wdmgCode + ", wdmgFdCode=" + wdmgFdCode + ", wdmgMsCode=" + wdmgMsCode
				+ ", wdmgWaCode=" + wdmgWaCode + ", wdmgMargin=" + wdmgMargin + ", wdmgDate=" + wdmgDate
				+ ", wdmgComCode=" + wdmgComCode + "]";
	}

}
