package com.pineapple.pms.service;

public class WbsDailyHuman {
	
	private int wdhCode;
	private int wdhWaCode;
	private int wdhFdCode;
	private int wdhMsCode;
	private int wdhComCode;
	private int wdhNoPeople;
	private int wdhCost;
	private String wdhRemarks;
	private String wdhDate;
	public int getwdhCode() {
		//System.out.println("wdhCode get"+wdhCode);
		return wdhCode;
	}
	public void setwdhCode(int wdhCode) {
		//System.out.println("wdhCode set"+wdhCode);
		this.wdhCode = wdhCode;
	}
	public int getwdhWaCode() {
		//System.out.println("wdhWaCode get"+wdhWaCode);
		return wdhWaCode;
	}
	public void setwdhWaCode(int wdhWaCode) {
		//System.out.println("wdhWaCode set"+wdhWaCode);
		this.wdhWaCode = wdhWaCode;
	}
	public int getwdhFdCode() {
		//System.out.println("wdhFdCode get"+wdhFdCode);
		return wdhFdCode;
	}
	public void setwdhFdCode(int wdhFdCode) {
		//System.out.println("wdhFdCode set"+wdhFdCode);
		this.wdhFdCode = wdhFdCode;
	}
	public int getwdhMsCode() {
		//System.out.println("wdhMsCode get"+wdhMsCode);
		return wdhMsCode;
	}
	public void setwdhMsCode(int wdhMsCode) {
		//System.out.println("wdhMsCode set"+wdhMsCode);
		this.wdhMsCode = wdhMsCode;
	}
	public int getwdhComCode() {
		//System.out.println("wdhComCode get"+wdhComCode);
		return wdhComCode;
	}
	public void setwdhComCode(int wdhComCode) {
		//System.out.println("wdhComCode set"+wdhComCode);
		this.wdhComCode = wdhComCode;
	}
	public int getwdhNoPeople() {
		//System.out.println("wdhNoPeople get"+wdhNoPeople);
		return wdhNoPeople;
	}
	public void setwdhNoPeople(int wdhNoPeople) {
		//System.out.println("wdhNoPeople set"+wdhNoPeople);
		this.wdhNoPeople = wdhNoPeople;
	}
	public int getwdhCost() {
		//System.out.println("wdhCost get"+wdhCost);
		return wdhCost;
	}
	public void setwdhCost(int wdhCost) {
		//System.out.println("wdhCost set"+wdhCost);
		this.wdhCost = wdhCost;
	}
	public String getwdhRemarks() {
		//System.out.println("wdhRemarks get"+wdhRemarks);
		return wdhRemarks;
	}
	public void setwdhRemarks(String wdhRemarks) {
		//System.out.println("wdhRemarks set"+wdhRemarks);
		this.wdhRemarks = wdhRemarks;
	}
	public String getwdhDate() {
		//System.out.println("wdhDate get"+wdhDate);
		return wdhDate;
	}
	public void setwdhDate(String wdhDate) {
		if(wdhDate==""){
			wdhDate = null;
		}else{
		this.wdhDate = wdhDate;
		}
		//System.out.println("wdhDate set"+wdhDate);
	}

}
