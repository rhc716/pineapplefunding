package com.pineapple.funding.user;

public class User {
	private String userId;
	private String nickname;
	private String name;
	private String pw;
	private int levelCode;
	private String uDelTime;
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
	
	@Override
	public String toString() {
		return "UserVo [userId=" + userId + ", nickname=" + nickname + ", name=" + name + ", pw=" + pw + ", levelCode="
				+ levelCode + ", uDelTime=" + uDelTime + "]";
	}
	
}
