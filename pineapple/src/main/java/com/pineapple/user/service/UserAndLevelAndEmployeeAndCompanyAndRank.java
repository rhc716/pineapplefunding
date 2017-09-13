package com.pineapple.user.service;

import java.util.List;

public class UserAndLevelAndEmployeeAndCompanyAndRank {
	private String userId;
	private String nickname;
	private String name;
	private String pw;
	private int levelCode;
	private String uDelTime;
	private UserLevel userlevel;
	private Employee employee;
	private List<Company> company;
	private RankCode rankcode;
	
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
	public UserLevel getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(UserLevel userlevel) {
		this.userlevel = userlevel;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public List<Company> getCompany() {
		return company;
	}
	public void setCompany(List<Company> company) {
		this.company = company;
	}
	public RankCode getRankcode() {
		return rankcode;
	}
	public void setRankcode(RankCode rankcode) {
		this.rankcode = rankcode;
	}
	@Override
	public String toString() {
		return "UserAndLevelAndEmployeeAndCompanyAndRank [userId=" + userId + ", nickname=" + nickname + ", name="
				+ name + ", pw=" + pw + ", levelCode=" + levelCode + ", uDelTime=" + uDelTime + ", userlevel="
				+ userlevel + ", employee=" + employee + ", company=" + company + ", rankcode=" + rankcode + "]";
	}
}
