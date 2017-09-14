package com.pineapple.pms.service;

public class WbsPlanFacility {
	private int wpfCode;
	private int wpfFdCode;
	private int wpfMsCode;
	private int wpfWpCode;
	private int wpfCost;
	private int wpfComCode;
	private String wpfName;
	private String wpftDate;
	private String wpfRemarks;
	public int getWpfCode() {
		return wpfCode;
	}
	public void setWpfCode(int wpfCode) {
		this.wpfCode = wpfCode;
	}
	public int getWpfFdCode() {
		return wpfFdCode;
	}
	public void setWpfFdCode(int wpfFdCode) {
		this.wpfFdCode = wpfFdCode;
	}
	public int getWpfMsCode() {
		return wpfMsCode;
	}
	public void setWpfMsCode(int wpfMsCode) {
		this.wpfMsCode = wpfMsCode;
	}
	public int getWpfWpCode() {
		return wpfWpCode;
	}
	public void setWpfWpCode(int wpfWpCode) {
		this.wpfWpCode = wpfWpCode;
	}
	public int getWpfCost() {
		return wpfCost;
	}
	public void setWpfCost(int wpfCost) {
		this.wpfCost = wpfCost;
	}
	public int getWpfComCode() {
		return wpfComCode;
	}
	public void setWpfComCode(int wpfComCode) {
		this.wpfComCode = wpfComCode;
	}
	public String getWpfName() {
		return wpfName;
	}
	public void setWpfName(String wpfName) {
		this.wpfName = wpfName;
	}
	public String getWpftDate() {
		return wpftDate;
	}
	public void setWpftDate(String wpftDate) {
		if(wpftDate==""){
			wpftDate =null;
		}else{
			this.wpftDate = wpftDate;
		}
		
	}
	
	public String getWpfRemarks() {
		return wpfRemarks;
	}
	public void setWpfRemarks(String wpfRemarks) {
		this.wpfRemarks = wpfRemarks;
	}
	@Override
	public String toString() {
		return "WbsDailyfacility [wpfCode=" + wpfCode + ", wpfFdCode=" + wpfFdCode + ", wpfMsCode=" + wpfMsCode
				+ ", wpfWpCode=" + wpfWpCode + ", wpfCost=" + wpfCost + ", wpfComCode=" + wpfComCode + ", wpfName="
				+ wpfName + ", wpftDate=" + wpftDate + ", wpfRemarks="
				+ wpfRemarks + "]";
	}

}
