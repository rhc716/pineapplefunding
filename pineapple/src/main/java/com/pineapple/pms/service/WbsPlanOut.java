package com.pineapple.pms.service;

public class WbsPlanOut {
	private int wpoCode;
	private int wpoFdCode;
	private int wpoMsCode;
	private int wpoWpCode;
	private int wpoCost;
	private int wpoComCode;
	private String wpoOutComName;
	private String wpoStartDate;
	private String wpoEndDate;
	private String wpoRemarks;
	public int getWpoCode() {
		return wpoCode;
	}
	public void setWpoCode(int wpoCode) {
		this.wpoCode = wpoCode;
	}
	public int getWpoFdCode() {
		return wpoFdCode;
	}
	public void setWpoFdCode(int wpoFdCode) {
		this.wpoFdCode = wpoFdCode;
	}
	public int getWpoMsCode() {
		return wpoMsCode;
	}
	public void setWpoMsCode(int wpoMsCode) {
		this.wpoMsCode = wpoMsCode;
	}
	public int getWpoWpCode() {
		return wpoWpCode;
	}
	public void setWpoWpCode(int wpoWpCode) {
		this.wpoWpCode = wpoWpCode;
	}
	public int getWpoCost() {
		return wpoCost;
	}
	public void setWpoCost(int wpoCost) {
		this.wpoCost = wpoCost;
	}
	public int getWpoComCode() {
		return wpoComCode;
	}
	public void setWpoComCode(int wpoComCode) {
		this.wpoComCode = wpoComCode;
	}
	public String getWpoOutComName() {
		return wpoOutComName;
	}
	public void setWpoOutComName(String wpoOutComName) {
		this.wpoOutComName = wpoOutComName;
	}
	public String getWpoStartDate() {
		return wpoStartDate;
	}
	public void setWpoStartDate(String wpoStartDate) {
		if(wpoStartDate==""){
			wpoStartDate=null;
		}else{
			this.wpoStartDate = wpoStartDate;
		}
	}
	public String getWpoEndDate() {
		return wpoEndDate;
	}
	public void setWpoEndDate(String wpoEndDate) {
		if(wpoEndDate==""){
			wpoEndDate=null;
		}else{
			this.wpoEndDate = wpoEndDate;
		}
	}
	public String getWpoRemarks() {
		return wpoRemarks;
	}
	public void setWpoRemarks(String wpoRemarks) {
		this.wpoRemarks = wpoRemarks;
	}
	@Override
	public String toString() {
		return "WbsPlanOut [wpoCode=" + wpoCode + ", wpoFdCode=" + wpoFdCode + ", wpoMsCode=" + wpoMsCode
				+ ", wpoWpCode=" + wpoWpCode + ", wpoCost=" + wpoCost + ", wpoComCode=" + wpoComCode
				+ ", wpoOutComName=" + wpoOutComName + ", wpoStartDate=" + wpoStartDate + ", wpoEndDate=" + wpoEndDate
				+ ", wpoRemarks=" + wpoRemarks + "]";
	}
	

}
