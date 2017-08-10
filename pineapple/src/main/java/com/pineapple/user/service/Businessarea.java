package com.pineapple.user.service;

public class Businessarea {
	private int areaCode;
	private int areaComCode;
	private int areaName;
	
	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	public int getAreaComCode() {
		return areaComCode;
	}
	public void setAreaComCode(int areaComCode) {
		this.areaComCode = areaComCode;
	}
	public int getAreaName() {
		return areaName;
	}
	public void setAreaName(int areaName) {
		this.areaName = areaName;
	}
	
	@Override
	public String toString() {
		return "Businessarea [areaCode=" + areaCode + ", areaComCode=" + areaComCode + ", areaName=" + areaName + "]";
	}
	
	
}
