package com.pineapple.pms.service;

public class WbsDailyHuman {
	
	private int wphCode;
	private int wphWaCode;
	private int wphFdCode;
	private int wphMsCode;
	private int wphComCode;
	private int wphNoPeople;
	private int wphCost;
	private String wphRemarks;
	private String wphDate;
	public int getWphCode() {
		//System.out.println("wphCode get"+wphCode);
		return wphCode;
	}
	public void setWphCode(int wphCode) {
		//System.out.println("wphCode set"+wphCode);
		this.wphCode = wphCode;
	}
	public int getwphWaCode() {
		//System.out.println("wphWaCode get"+wphWaCode);
		return wphWaCode;
	}
	public void setwphWaCode(int wphWaCode) {
		//System.out.println("wphWaCode set"+wphWaCode);
		this.wphWaCode = wphWaCode;
	}
	public int getWphFdCode() {
		//System.out.println("wphFdCode get"+wphFdCode);
		return wphFdCode;
	}
	public void setWphFdCode(int wphFdCode) {
		//System.out.println("wphFdCode set"+wphFdCode);
		this.wphFdCode = wphFdCode;
	}
	public int getWphMsCode() {
		//System.out.println("wphMsCode get"+wphMsCode);
		return wphMsCode;
	}
	public void setWphMsCode(int wphMsCode) {
		//System.out.println("wphMsCode set"+wphMsCode);
		this.wphMsCode = wphMsCode;
	}
	public int getWphComCode() {
		//System.out.println("wphComCode get"+wphComCode);
		return wphComCode;
	}
	public void setWphComCode(int wphComCode) {
		//System.out.println("wphComCode set"+wphComCode);
		this.wphComCode = wphComCode;
	}
	public int getWphNoPeople() {
		//System.out.println("wphNoPeople get"+wphNoPeople);
		return wphNoPeople;
	}
	public void setWphNoPeople(int wphNoPeople) {
		//System.out.println("wphNoPeople set"+wphNoPeople);
		this.wphNoPeople = wphNoPeople;
	}
	public int getWphCost() {
		//System.out.println("wphCost get"+wphCost);
		return wphCost;
	}
	public void setWphCost(int wphCost) {
		//System.out.println("wphCost set"+wphCost);
		this.wphCost = wphCost;
	}
	public String getWphRemarks() {
		//System.out.println("wphRemarks get"+wphRemarks);
		return wphRemarks;
	}
	public void setWphRemarks(String wphRemarks) {
		//System.out.println("wphRemarks set"+wphRemarks);
		this.wphRemarks = wphRemarks;
	}
	public String getwphDate() {
		//System.out.println("wphDate get"+wphDate);
		return wphDate;
	}
	public void setwphDate(String wphDate) {
		if(wphDate==""){
			wphDate = null;
		}else{
		this.wphDate = wphDate;
		}
		//System.out.println("wphDate set"+wphDate);
	}

}
