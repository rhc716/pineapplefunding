package com.pineapple.pms.service;

public class WbsPlanMaterial {
	private int wpmCode;
	private int wpmWpCode;
	private int wpmFdCode;
	private int wpmMsCode;
	private int wpmComCode;
	private int wpmCost;
	private String wpmName;
	private String wpmRemarks;
	private String wpmDate;
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
	public String getWpmDate() {
		return wpmDate;
	}
	public void setWpmDate(String wpmDate) {
		if(wpmDate==""){
			wpmDate = null;
		}else{
			this.wpmDate = wpmDate;
		}
		
	}
	
	
}
