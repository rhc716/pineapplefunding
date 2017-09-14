package com.pineapple.pms.service;

public class WbsPlan {
	private int wbsPlanCode;
	private int wbsPlanFdCode;
	private int wbsPlanMsCode;
	private int wbsPlanChange;
	private String wbsPlanName;
	private String wbsPlanDependency;
	private String wbsPlanStartDate;
	private int wbsPlanDuration;
	private String wbsPlanWriteDate;
	private String wbsPlanManager;
	private int wbsPlanComCode;
	private int wbsMargin;
	
	public int getWbsPlanCode() {
		//System.out.println("wbsPlanCode get"+wbsPlanCode);
		return wbsPlanCode;
	}
	public void setWbsPlanCode(int wbsPlanCode) {
		this.wbsPlanCode = wbsPlanCode;
	}
	public int getWbsPlanFdCode() {
		//System.out.println("wbsPlanFdCode get"+wbsPlanFdCode);
		return wbsPlanFdCode;
	}
	public void setWbsPlanFdCode(int wbsPlanFdCode) {
		this.wbsPlanFdCode = wbsPlanFdCode;
	}
	public int getWbsPlanMsCode() {
		//System.out.println("wbsPlanMsCode get"+wbsPlanMsCode);
		return wbsPlanMsCode;
	}
	public void setWbsPlanMsCode(int wbsPlanMsCode) {
		this.wbsPlanMsCode = wbsPlanMsCode;
	}

	public int getWbsPlanChange() {
		//System.out.println("wbsPlanChange get"+wbsPlanChange);
		return wbsPlanChange;
	}
	public void setWbsPlanChange(int wbsPlanChange) {
		this.wbsPlanChange = wbsPlanChange;
	}
	public String getWbsPlanName() {
		//System.out.println("wbsPlanName get"+wbsPlanName);
		return wbsPlanName;
	}
	public void setWbsPlanName(String wbsPlanName) {
		this.wbsPlanName = wbsPlanName;
	}
	public String getWbsPlanDependency() {
		//System.out.println("wbsPlanDependency get"+wbsPlanDependency);
		return wbsPlanDependency;
	}
	public void setWbsPlanDependency(String wbsPlanDependency) {
		if(wbsPlanDependency==""){
			wbsPlanDependency=null;
		}
		this.wbsPlanDependency = wbsPlanDependency;
	}
	public String getWbsPlanStartDate() {
		//System.out.println("wbsPlanStartDate get"+wbsPlanStartDate);
		return wbsPlanStartDate;
	}
	public void setWbsPlanStartDate(String wbsPlanStartDate) {
		//wbsPlanStartDate 가 공백일경우 null로 치환
		if(wbsPlanStartDate==""){
			wbsPlanStartDate = null;
		}else{
			this.wbsPlanStartDate = wbsPlanStartDate;
		}
	}
	public int getWbsPlanDuration() {
		//System.out.println("wbsPlanDuration get"+wbsPlanDuration);
		return wbsPlanDuration;
	}
	public void setWbsPlanDuration(int wbsPlanDuration) {
		this.wbsPlanDuration = wbsPlanDuration;
	}
	public String getWbsPlanWriteDate() {
		//System.out.println("wbsPlanWriteDate get"+wbsPlanWriteDate);
		return wbsPlanWriteDate;
	}
	public void setWbsPlanWriteDate(String wbsPlanWriteDate) {
		this.wbsPlanWriteDate = wbsPlanWriteDate;
	}
	public String getWbsPlanManager() {
		//System.out.println("wbsPlanManager get"+wbsPlanManager);
		return wbsPlanManager;
	}
	public void setWbsPlanManager(String wbsPlanManager) {
		this.wbsPlanManager = wbsPlanManager;
	}
	public int getWbsPlanComCode() {
		//System.out.println("wbsPlanComCode get"+wbsPlanComCode);
		return wbsPlanComCode;
	}
	public void setWbsPlanComCode(int wbsPlanComCode) {
		this.wbsPlanComCode = wbsPlanComCode;
	}
	public int getWbsMargin() {
		return wbsMargin;
	}
	public void setWbsMargin(int wbsMargin) {
		this.wbsMargin = wbsMargin;
	}
	@Override
	public String toString() {
		return "WbsPlan [wbsPlanCode=" + wbsPlanCode + ", wbsPlanFdCode=" + wbsPlanFdCode + ", wbsPlanMsCode="
				+ wbsPlanMsCode + ", wbsPlanChange=" + wbsPlanChange + ", wbsPlanName=" + wbsPlanName
				+ ", wbsPlanDependency=" + wbsPlanDependency + ", wbsPlanStartDate=" + wbsPlanStartDate
				+ ", wbsPlanDuration=" + wbsPlanDuration + ", wbsPlanWriteDate=" + wbsPlanWriteDate
				+ ", wbsPlanManager=" + wbsPlanManager + ", wbsPlanComCode=" + wbsPlanComCode + ", wbsMargin="
				+ wbsMargin + "]";
	}	
	
}
