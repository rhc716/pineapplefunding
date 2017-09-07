package com.pineapple.user.service;

public class Fundingauthlevel {
	private int authLevelCode;
	private String authLevelName;
	public int getAuthLevelCode() {
		return authLevelCode;
	}
	public void setAuthLevelCode(int authLevelCode) {
		this.authLevelCode = authLevelCode;
	}
	public String getAuthLevelName() {
		return authLevelName;
	}
	public void setAuthLevelName(String authLevelName) {
		this.authLevelName = authLevelName;
	}
	@Override
	public String toString() {
		return "Fundingauthlevel [authLevelCode=" + authLevelCode + ", authLevelName=" + authLevelName + "]";
	}
	
}
