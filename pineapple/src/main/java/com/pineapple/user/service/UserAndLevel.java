package com.pineapple.user.service;

public class UserAndLevel {
	private String userId;
	private String nickname;
	private String name;
	private String pw;
	private int levelCode;
	private String uDelTime;
	private UserLevel userLevel;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getLevelCode() {
		return levelCode;
	}
	public void setLevelCode(int levelCode) {
		this.levelCode = levelCode;
	}
	public String getuDelTime() {
		return uDelTime;
	}
	public void setuDelTime(String uDelTime) {
		this.uDelTime = uDelTime;
	}
	public UserLevel getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(UserLevel userLevel) {
		this.userLevel = userLevel;
	}
	@Override
	public String toString() {
		return "UserAndLevel [userId=" + userId + ", nickname=" + nickname + ", name=" + name + ", pw=" + pw
				+ ", levelCode=" + levelCode + ", uDelTime=" + uDelTime + ", userLevel=" + userLevel + "]";
	}
}
