package com.pineapple.pms.service;

public class WbsDailyEtc {
	private int wdeCode;
	private int wdeFdCode;
	private int wdeMsCode;
	private int wdeWaCode;
	private String wdePurpose;
	private int wdeCost;
	private String wdeRemarks;
	private String wdeDate;
	private int wdeComCode;
	public int getWdeCode() {
		return wdeCode;
	}
	public void setWdeCode(int wdeCode) {
		this.wdeCode = wdeCode;
	}
	public int getWdeFdCode() {
		return wdeFdCode;
	}
	public void setWdeFdCode(int wdeFdCode) {
		this.wdeFdCode = wdeFdCode;
	}
	public int getWdeMsCode() {
		return wdeMsCode;
	}
	public void setWdeMsCode(int wdeMsCode) {
		this.wdeMsCode = wdeMsCode;
	}
	public int getWdeWaCode() {
		return wdeWaCode;
	}
	public void setWdeWaCode(int wdeWaCode) {
		this.wdeWaCode = wdeWaCode;
	}
	public String getWdePurpose() {
		return wdePurpose;
	}
	public void setWdePurpose(String wdePurpose) {
		this.wdePurpose = wdePurpose;
	}
	public int getWdeCost() {
		return wdeCost;
	}
	public void setWdeCost(int wdeCost) {
		this.wdeCost = wdeCost;
	}
	public String getWdeRemarks() {
		return wdeRemarks;
	}
	public void setWdeRemarks(String wdeRemarks) {
		this.wdeRemarks = wdeRemarks;
	}
	public String getWdeDate() {
		return wdeDate;
	}
	public void setWdeDate(String wdeDate) {
		if(wdeDate==""){
			wdeDate=null;
		}else{
			this.wdeDate = wdeDate;
		}
	}
	public int getWdeComCode() {
		return wdeComCode;
	}
	public void setWdeComCode(int wdeComCode) {
		this.wdeComCode = wdeComCode;
	}
	@Override
	public String toString() {
		return "WbsDailyEtc [wdeCode=" + wdeCode + ", wdeFdCode=" + wdeFdCode + ", wdeMsCode=" + wdeMsCode
				+ ", wdeWaCode=" + wdeWaCode + ", wdePurpose=" + wdePurpose + ", wdeCost=" + wdeCost + ", wdeRemarks="
				+ wdeRemarks + ", wdeDate=" + wdeDate + ", wdeComCode=" + wdeComCode + "]";
	}
	
	
}
