package com.pineapple.user.service;

public class Businessarea {
	private int areaCode;
	private int areaFdCode;
	private String areaName;
	
	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	public int getAreaFdCode() {
		return areaFdCode;
	}
	public void setAreaFdCode(int areaFdCode) {
		this.areaFdCode = areaFdCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	@Override
	public String toString() {
		return "Businessarea [areaCode=" + areaCode + ", areaFdCode=" + areaFdCode + ", areaName=" + areaName + "]";
	}
	
}
