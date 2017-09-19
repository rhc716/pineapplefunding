package com.pineapple.pms.service;

public class WbsDailyFacility {
	private int wdfCode;
	private int wdfFdCode;
	private int wdfMsCode;
	private int wdfWaCode;
	private int wdfCost;
	private int wdfComCode;
	private String wdfName;
	private String wdfDate;
	private String wdfRemarks;
	public int getwdfCode() {
		return wdfCode;
	}
	public void setwdfCode(int wdfCode) {
		this.wdfCode = wdfCode;
	}
	public int getwdfFdCode() {
		return wdfFdCode;
	}
	public void setwdfFdCode(int wdfFdCode) {
		this.wdfFdCode = wdfFdCode;
	}
	public int getwdfMsCode() {
		return wdfMsCode;
	}
	public void setwdfMsCode(int wdfMsCode) {
		this.wdfMsCode = wdfMsCode;
	}
	public int getwdfWaCode() {
		return wdfWaCode;
	}
	public void setwdfWaCode(int wdfWaCode) {
		this.wdfWaCode = wdfWaCode;
	}
	public int getwdfCost() {
		return wdfCost;
	}
	public void setwdfCost(int wdfCost) {
		this.wdfCost = wdfCost;
	}
	public int getwdfComCode() {
		return wdfComCode;
	}
	public void setwdfComCode(int wdfComCode) {
		this.wdfComCode = wdfComCode;
	}
	public String getwdfName() {
		return wdfName;
	}
	public void setwdfName(String wdfName) {
		this.wdfName = wdfName;
	}
	public String getwdfDate() {
		return wdfDate;
	}
	public void setwdftDate(String wdftDate) {
		if(wdftDate==""){
			wdftDate =null;
		}else{
			this.wdfDate = wdftDate;
		}
		
	}
	
	public String getwdfRemarks() {
		return wdfRemarks;
	}
	public void setwdfRemarks(String wdfRemarks) {
		this.wdfRemarks = wdfRemarks;
	}
	@Override
	public String toString() {
		return "WbsDailyfacility [wdfCode=" + wdfCode + ", wdfFdCode=" + wdfFdCode + ", wdfMsCode=" + wdfMsCode
				+ ", wdfWaCode=" + wdfWaCode + ", wdfCost=" + wdfCost + ", wdfComCode=" + wdfComCode + ", wdfName="
				+ wdfName + ", wdfDate=" + wdfDate + ", wdfRemarks="
				+ wdfRemarks + "]";
	}


	
}
