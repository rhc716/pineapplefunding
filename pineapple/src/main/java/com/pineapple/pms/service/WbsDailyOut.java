package com.pineapple.pms.service;

public class WbsDailyOut {
	private int wdoCode;
	private int wdoFdCode;
	private int wdoMsCode;
	private int wdoWaCode;
	private int wdoCost;
	private int wdoComCode;
	private String wdoOutComName;
	private String wdoDate;
	private String wdoRemarks;
	public int getwdoCode() {
		return wdoCode;
	}
	public void setwdoCode(int wdoCode) {
		this.wdoCode = wdoCode;
	}
	public int getwdoFdCode() {
		return wdoFdCode;
	}
	public void setwdoFdCode(int wdoFdCode) {
		this.wdoFdCode = wdoFdCode;
	}
	public int getwdoMsCode() {
		return wdoMsCode;
	}
	public void setwdoMsCode(int wdoMsCode) {
		this.wdoMsCode = wdoMsCode;
	}
	public int getwdoWaCode() {
		return wdoWaCode;
	}
	public void setwdoWaCode(int wdoWaCode) {
		this.wdoWaCode = wdoWaCode;
	}
	public int getwdoCost() {
		return wdoCost;
	}
	public void setwdoCost(int wdoCost) {
		this.wdoCost = wdoCost;
	}
	public int getwdoComCode() {
		return wdoComCode;
	}
	public void setwdoComCode(int wdoComCode) {
		this.wdoComCode = wdoComCode;
	}
	public String getwdoOutComName() {
		return wdoOutComName;
	}
	public void setwdoOutComName(String wdoOutComName) {
		this.wdoOutComName = wdoOutComName;
	}
	public String getwdoDate() {
		return wdoDate;
	}
	public void setwdoDate(String wdoDate) {
		if(wdoDate==""){
			wdoDate=null;
		}else{
			this.wdoDate = wdoDate;
		}
	}
	public String getwdoRemarks() {
		return wdoRemarks;
	}
	public void setwdoRemarks(String wdoRemarks) {
		this.wdoRemarks = wdoRemarks;
	}
	@Override
	public String toString() {
		return "WbsPlanOut [wdoCode=" + wdoCode + ", wdoFdCode=" + wdoFdCode + ", wdoMsCode=" + wdoMsCode
				+ ", wdoWaCode=" + wdoWaCode + ", wdoCost=" + wdoCost + ", wdoComCode=" + wdoComCode
				+ ", wdoOutComName=" + wdoOutComName + ", wdoDate=" + wdoDate + ", wdoRemarks=" + wdoRemarks + "]";
	}
	

}
