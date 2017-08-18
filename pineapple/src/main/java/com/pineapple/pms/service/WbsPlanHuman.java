package com.pineapple.pms.service;

public class WbsPlanHuman {
	private int wphCode;
	private int wphWpCode;
	private int wphFdCode;
	private int wphMsCode;
	private int wphComCode;
	private int wphNoPeople;
	private int wphCost;
	private String wphRemarks;
	private String wphStartDate;
	private String wphEndDate;
	public int getWphCode() {
		//System.out.println("wphCode get"+wphCode);
		return wphCode;
	}
	public void setWphCode(int wphCode) {
		//System.out.println("wphCode set"+wphCode);
		this.wphCode = wphCode;
	}
	public int getWphWpCode() {
		//System.out.println("wphWpCode get"+wphWpCode);
		return wphWpCode;
	}
	public void setWphWpCode(int wphWpCode) {
		//System.out.println("wphWpCode set"+wphWpCode);
		this.wphWpCode = wphWpCode;
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
	public String getWphStartDate() {
		//System.out.println("wphStartDate get"+wphStartDate);
		return wphStartDate;
	}
	public void setWphStartDate(String wphStartDate) {
		if(wphStartDate==""){
			wphStartDate = null;
		}else{
		this.wphStartDate = wphStartDate;
		}
		//System.out.println("wphStartDate set"+wphStartDate);
	}
	public String getWphEndDate() {
		//System.out.println("wphEndDate get"+wphEndDate);
		return wphEndDate;
	}
	public void setWphEndDate(String wphEndDate) {
		if(wphEndDate==""){
			wphEndDate = null;
		}else{
		this.wphEndDate = wphEndDate;
		}
		//System.out.println("wphEndDate set"+wphEndDate);
	}

}
