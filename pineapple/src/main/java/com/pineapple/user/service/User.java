package com.pineapple.user.service;

import java.util.List;

public class User {
	private String userId;
	private String nickname;
	private String name;
	private String pw;
	private int levelCode;
	private String uDelTime;
	private List<Account> account;
	
	public String getUserId() {
		System.out.println("getUserId 호출");
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
	public List<Account> getAccount() {
		return account;
	}
	public void setAccount(List<Account> account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", nickname=" + nickname + ", name=" + name + ", pw=" + pw + ", levelCode="
				+ levelCode + ", uDelTime=" + uDelTime + ", account=" + account + "]";
	}
	
	
}
