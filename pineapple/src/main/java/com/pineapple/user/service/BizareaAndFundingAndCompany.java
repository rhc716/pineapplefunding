package com.pineapple.user.service;

public class BizareaAndFundingAndCompany {
	private int areaCode;
	private String areaName;
	private String fdTitle;
	private String comName;
	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	@Override
	public String toString() {
		return "BizareaAndFundingAndCompany [areaCode=" + areaCode + ", areaName=" + areaName + ", fdTitle=" + fdTitle
				+ ", comName=" + comName + "]";
	}
	
}
