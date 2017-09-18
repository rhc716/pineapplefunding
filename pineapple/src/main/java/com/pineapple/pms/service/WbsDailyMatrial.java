package com.pineapple.pms.service;

public class WbsDailyMatrial {
	
	private int wpmCode;
	private int wpmWaCode;
	private int wpmFdCode;
	private int wpmMsCode;
	private int wpmComCode;
	private int wdmCostPerNo;
	private String wpmName;
	private String wpmRemarks;
	private String wpmDate;
	public int getWpmCode() {
		
		return wpmCode;
	}
	public void setWpmCode(int wpmCode) {
		
		this.wpmCode = wpmCode;
	}
	public int getwpmWaCode() {
		System.out.println("getwpmWaCode "+wpmWaCode);
		return wpmWaCode;
	}
	public void setwpmWaCode(int wpmWaCode) {
		System.out.println("setwpmWaCode "+wpmWaCode);
		this.wpmWaCode = wpmWaCode;
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
	public int getWdmCostPerNo() {
		return wdmCostPerNo;
	}
	public void setWdmCostPerNo(int wdmCostPerNo) {
		this.wdmCostPerNo = wdmCostPerNo;
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
