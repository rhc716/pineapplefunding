package com.pineapple.timeline.service;

public class UserIdAndCount {
	private String userId;
	private int usertotalcount;
	public String getNickname() {
		return userId;
	}
	public void setNickname(String nickname) {
		this.userId = nickname;
	}
	public int getUsercount() {
		return usertotalcount;
	}
	public void setUsercount(int usercount) {
		this.usertotalcount = usercount;
	}
	@Override
	public String toString() {
		return "UserIdAndCount [userId=" + userId + ", usertotalcount=" + usertotalcount + "]";
	}
	
}
