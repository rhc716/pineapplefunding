package com.pineapple.user.service;

public class UserLevel {
	private int userLevelCode;
	private String userLevelName;
	
	public int getUserLevelCode() {
		return userLevelCode;
	}
	public void setUserLevelCode(int userLevelCode) {
		this.userLevelCode = userLevelCode;
	}
	public String getUserLevelName() {
		return userLevelName;
	}
	public void setUserLevelName(String userLevelName) {
		this.userLevelName = userLevelName;
	}
	@Override
	public String toString() {
		return "UserLevel [userLevelCode=" + userLevelCode + ", userLevelName=" + userLevelName + "]";
	}
}
