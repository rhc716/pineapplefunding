package com.pineapple.pms.service;

public class WbsPlanUpdate {
	private int wbsPlanChange;
	private String wbsPlanCode;
	
	public int getWbsPlanChange() {
		return wbsPlanChange;
	}
	public void setWbsPlanChange(int wbsPlanChange) {
		this.wbsPlanChange = wbsPlanChange;
	}
	public String getWbsPlanCode() {
		return wbsPlanCode;
	}
	public void setWbsPlanCode(String wbsPlanCode) {
		this.wbsPlanCode = wbsPlanCode;
	}
	@Override
	public String toString() {
		return "WbsPlanUpdate [wbsPlanChange=" + wbsPlanChange + ", wbsPlanCode=" + wbsPlanCode + "]";
	}
	

}
