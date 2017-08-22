package com.pineapple.pms.service;

public class WbsPlanView {
	private int wbsPlanCode;
	private int wbsPlanOrder;
	private String wbsPlanName;
	private int wbsPlanDependency;
	private String wbsPlanStartDate;
	private int wbsPlanDuration;
	private String wbsPlanManager;
	private int wbsPlanFdCode;
	private int wbsPlanMsCode;
	private int wbsPlanComCode;
	private int wbsPlanChange;
	private String fdTitle;
	private String milestoneName;
	
	public int getWbsPlanFdCode() {
		return wbsPlanFdCode;
	}
	public void setWbsPlanFdCode(int wbsPlanFdCode) {
		this.wbsPlanFdCode = wbsPlanFdCode;
	}
	public int getWbsPlanMsCode() {
		return wbsPlanMsCode;
	}
	public void setWbsPlanMsCode(int wbsPlanMsCode) {
		this.wbsPlanMsCode = wbsPlanMsCode;
	}
	
	public int getWbsPlanCode() {
		return wbsPlanCode;
	}
	public void setWbsPlanCode(int wbsPlanCode) {
		this.wbsPlanCode = wbsPlanCode;
	}
	public int getWbsPlanOrder() {
		return wbsPlanOrder;
	}
	public void setWbsPlanOrder(int wbsPlanOrder) {
		this.wbsPlanOrder = wbsPlanOrder;
	}
	public String getWbsPlanName() {
		return wbsPlanName;
	}
	public void setWbsPlanName(String wbsPlanName) {
		this.wbsPlanName = wbsPlanName;
	}
	public int getWbsPlanDependency() {
		return wbsPlanDependency;
	}
	public void setWbsPlanDependency(int wbsPlanDependency) {
		this.wbsPlanDependency = wbsPlanDependency;
	}
	public String getWbsPlanStartDate() {
		return wbsPlanStartDate;
	}
	public void setWbsPlanStartDate(String wbsPlanStartDate) {
		this.wbsPlanStartDate = wbsPlanStartDate;
	}
	public int getWbsPlanDuration() {
		return wbsPlanDuration;
	}
	public void setWbsPlanDuration(int wbsPlanDuration) {
		this.wbsPlanDuration = wbsPlanDuration;
	}
	public String getWbsPlanManager() {
		return wbsPlanManager;
	}
	public void setWbsPlanManager(String wbsPlanManager) {
		this.wbsPlanManager = wbsPlanManager;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public String getMilestoneName() {
		return milestoneName;
	}
	public void setMilestoneName(String milestoneName) {
		this.milestoneName = milestoneName;
	}
	
	public int getWbsPlanComCode() {
		return wbsPlanComCode;
	}
	public void setWbsPlanComCode(int wbsPlanComCode) {
		this.wbsPlanComCode = wbsPlanComCode;
	}
	public int getWbsPlanChange() {
		return wbsPlanChange;
	}
	public void setWbsPlanChange(int wbsPlanChange) {
		this.wbsPlanChange = wbsPlanChange;
	}
	@Override
	public String toString() {
		return "WbsPlanView [wbsPlanCode=" + wbsPlanCode + ", wbsPlanOrder=" + wbsPlanOrder + ", wbsPlanName="
				+ wbsPlanName + ", wbsPlanDependency=" + wbsPlanDependency + ", wbsPlanStartDate=" + wbsPlanStartDate
				+ ", wbsPlanDuration=" + wbsPlanDuration + ", wbsPlanManager=" + wbsPlanManager + ", wbsPlanFdCode="
				+ wbsPlanFdCode + ", wbsPlanMsCode=" + wbsPlanMsCode + ", wbsPlanComCode=" + wbsPlanComCode
				+ ", wbsPlanChange=" + wbsPlanChange + ", fdTitle=" + fdTitle + ", milestoneName=" + milestoneName
				+ "]";
	}
	
}
