package com.pineapple.pms.service;

public class WbsDailyMatrial {
	
	private int wdmCode;
	private int wdmWaCode;
	private int wdmFdCode;
	private int wdmMsCode;
	private int wdmComCode;
	private int wdmCostPerNo;
	private String wdmName;
	private String wdmRemarks;
	private String wdmDate;
	public int getwdmCode() {
		
		return wdmCode;
	}
	public void setwdmCode(int wdmCode) {
		
		this.wdmCode = wdmCode;
	}
	public int getwdmWaCode() {
		System.out.println("getwdmWaCode "+wdmWaCode);
		return wdmWaCode;
	}
	public void setwdmWaCode(int wdmWaCode) {
		System.out.println("setwdmWaCode "+wdmWaCode);
		this.wdmWaCode = wdmWaCode;
	}
	public int getwdmFdCode() {
		return wdmFdCode;
	}
	public void setwdmFdCode(int wdmFdCode) {
		this.wdmFdCode = wdmFdCode;
	}
	public int getwdmMsCode() {
		return wdmMsCode;
	}
	public void setwdmMsCode(int wdmMsCode) {
		this.wdmMsCode = wdmMsCode;
	}
	public int getwdmComCode() {
		return wdmComCode;
	}
	public void setwdmComCode(int wdmComCode) {
		this.wdmComCode = wdmComCode;
	}
	public int getWdmCostPerNo() {
		return wdmCostPerNo;
	}
	public void setWdmCostPerNo(int wdmCostPerNo) {
		this.wdmCostPerNo = wdmCostPerNo;
	}
	public String getwdmName() {
		return wdmName;
	}
	public void setwdmName(String wdmName) {
		this.wdmName = wdmName;
	}
	public String getwdmRemarks() {
		return wdmRemarks;
	}
	public void setwdmRemarks(String wdmRemarks) {
		this.wdmRemarks = wdmRemarks;
	}
	public String getwdmDate() {
		return wdmDate;
	}
	public void setwdmDate(String wdmDate) {
		if(wdmDate==""){
			wdmDate = null;
		}else{
			this.wdmDate = wdmDate;
		}
		
	}
	

}
