package com.pineapple.pms.service;

public class WbsPlanEtc {
	private int wpeCode;
	private int wpeFdCode;
	private int wpeMsCode;
	private int wpeWpCode;
	private int wpeCost;
	private int wpeComCode;
	private String wpePurpose;
	private String wpeStartDate;
	private String wpeEndDate;
	private String wpeRemarks;
	public int getWpeCode() {
		return wpeCode;
	}
	public void setWpeCode(int wpeCode) {
		this.wpeCode = wpeCode;
	}
	public int getWpeFdCode() {
		return wpeFdCode;
	}
	public void setWpeFdCode(int wpeFdCode) {
		this.wpeFdCode = wpeFdCode;
	}
	public int getWpeMsCode() {
		return wpeMsCode;
	}
	public void setWpeMsCode(int wpeMsCode) {
		this.wpeMsCode = wpeMsCode;
	}
	public int getWpeWpCode() {
		return wpeWpCode;
	}
	public void setWpeWpCode(int wpeWpCode) {
		this.wpeWpCode = wpeWpCode;
	}
	public int getWpeCost() {
		return wpeCost;
	}
	public void setWpeCost(int wpeCost) {
		this.wpeCost = wpeCost;
	}
	public int getWpeComCode() {
		return wpeComCode;
	}
	public void setWpeComCode(int wpeComCode) {
		this.wpeComCode = wpeComCode;
	}
	public String getWpePurpose() {
		return wpePurpose;
	}
	public void setWpePurpose(String wpePurpose) {
		this.wpePurpose = wpePurpose;
	}
	public String getWpeStartDate() {
		return wpeStartDate;
	}
	public void setWpeStartDate(String wpeStartDate) {
		this.wpeStartDate = wpeStartDate;
	}
	public String getWpeEndDate() {
		return wpeEndDate;
	}
	public void setWpeEndDate(String wpeEndDate) {
		this.wpeEndDate = wpeEndDate;
	}
	public String getWpeRemarks() {
		return wpeRemarks;
	}
	public void setWpeRemarks(String wpeRemarks) {
		this.wpeRemarks = wpeRemarks;
	}
	@Override
	public String toString() {
		return "WbsPlanEtc [wpeCode=" + wpeCode + ", wpeFdCode=" + wpeFdCode + ", wpeMsCode=" + wpeMsCode
				+ ", wpeWpCode=" + wpeWpCode + ", wpeCost=" + wpeCost + ", wpeComCode=" + wpeComCode + ", wpePurpose="
				+ wpePurpose + ", wpeStartDate=" + wpeStartDate + ", wpeEndDate=" + wpeEndDate + ", wpeRemarks="
				+ wpeRemarks + "]";
	}
	
	

}
