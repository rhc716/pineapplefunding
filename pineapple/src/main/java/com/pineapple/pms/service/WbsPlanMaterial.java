package com.pineapple.pms.service;

public class WbsPlanMaterial {
	private int wpmCode;
	private int wpmWpCode;
	private int wpmFdCode;
	private int wpmMsCode;
	private int wpmComCode;
	private int wpmNo;
	private int wpmCostPerNo;
	private int wpmCost;
	private String wpmName;
	private String wpmRemarks;
	private String wpmStartDate;
	private String wpmEndDate;
	public int getWpmCode() {
		
		return wpmCode;
	}
	public void setWpmCode(int wpmCode) {
		
		this.wpmCode = wpmCode;
	}
	public int getWpmWpCode() {
		System.out.println("getWpmWpCode "+wpmWpCode);
		return wpmWpCode;
	}
	public void setWpmWpCode(int wpmWpCode) {
		System.out.println("setWpmWpCode "+wpmWpCode);
		this.wpmWpCode = wpmWpCode;
	}
	public int getWpmFdCode() {
		return wpmFdCode;
	}
	public void setWpmFdCode(int wpmFdCode) {
		this.wpmFdCode = wpmFdCode;
	}
	public int getWpmMsCode() {
		return wpmMsCode;
	}
	public void setWpmMsCode(int wpmMsCode) {
		this.wpmMsCode = wpmMsCode;
	}
	public int getWpmComCode() {
		return wpmComCode;
	}
	public void setWpmComCode(int wpmComCode) {
		this.wpmComCode = wpmComCode;
	}
	public int getWpmNo() {
		return wpmNo;
	}
	public void setWpmNo(int wpmNo) {
		this.wpmNo = wpmNo;
	}
	public int getWpmCostPerNo() {
		return wpmCostPerNo;
	}
	public void setWpmCostPerNo(int wpmCostPerNo) {
		this.wpmCostPerNo = wpmCostPerNo;
	}
	public int getWpmCost() {
		return wpmCost;
	}
	public void setWpmCost(int wpmCost) {
		this.wpmCost = wpmCost;
	}
	public String getWpmName() {
		return wpmName;
	}
	public void setWpmName(String wpmName) {
		this.wpmName = wpmName;
	}
	public String getWpmRemarks() {
		return wpmRemarks;
	}
	public void setWpmRemarks(String wpmRemarks) {
		this.wpmRemarks = wpmRemarks;
	}
	public String getWpmStartDate() {
		return wpmStartDate;
	}
	public void setWpmStartDate(String wpmStartDate) {
		if(wpmStartDate==""){
			wpmStartDate = null;
		}else{
			this.wpmStartDate = wpmStartDate;
		}
		
	}
	public String getWpmEndDate() {
		return wpmEndDate;
	}
	public void setWpmEndDate(String wpmEndDate) {
		if(wpmEndDate==""){
			wpmEndDate = null;
		}else{
			this.wpmEndDate = wpmEndDate;
		}
	}
	@Override
	public String toString() {
		return "WbsPlanMaterial [wpmCode=" + wpmCode + ", wpmWpCode=" + wpmWpCode + ", wpmFdCode=" + wpmFdCode
				+ ", wpmMsCode=" + wpmMsCode + ", wpmComCode=" + wpmComCode + ", wpmNo=" + wpmNo + ", wpmCostPerNo="
				+ wpmCostPerNo + ", wpmCost=" + wpmCost + ", wpmName=" + wpmName + ", wpmRemarks=" + wpmRemarks
				+ ", wpmStartDate=" + wpmStartDate + ", wpmEndDate=" + wpmEndDate + "]";
	}
	
	
}
