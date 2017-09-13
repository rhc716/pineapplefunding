package com.pineapple.user.service;

import java.util.List;

public class UserAndUserdetail {
	//user
	private String userId;
	private String nickname;
	private String name;
	private String pw;
	private int levelCode;
	private String uDelTime;
	
	//userdetail
	private String phoneFront3;
	private String phoneRest8;
	private String postalCode;
	private String address;
	private String address2;
	private int nameCheck;
	
	//권한명, 직급명, 회사명
	private UserLevel userlevel;
	private RankCode rankcode;
	private Employee employee;
	private List<Company> company;
	
	public UserLevel getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(UserLevel userlevel) {
		this.userlevel = userlevel;
	}
	public RankCode getRankcode() {
		return rankcode;
	}
	public void setRankcode(RankCode rankcode) {
		this.rankcode = rankcode;
	}
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
	public String getPhoneFront3() {
		return phoneFront3;
	}
	public void setPhoneFront3(String phoneFront3) {
		this.phoneFront3 = phoneFront3;
	}
	public String getPhoneRest8() {
		return phoneRest8;
	}
	public void setPhoneRest8(String phoneRest8) {
		this.phoneRest8 = phoneRest8;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getNameCheck() {
		return nameCheck;
	}
	public void setNameCheck(int nameCheck) {
		this.nameCheck = nameCheck;
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
	@Override
	public String toString() {
		return "UserAndUserdetail [userId=" + userId + ", nickname=" + nickname + ", name=" + name + ", pw=" + pw
				+ ", levelCode=" + levelCode + ", uDelTime=" + uDelTime + ", phoneFront3=" + phoneFront3
				+ ", phoneRest8=" + phoneRest8 + ", postalCode=" + postalCode + ", address=" + address + ", address2="
				+ address2 + ", nameCheck=" + nameCheck + ", userlevel=" + userlevel + ", rankcode=" + rankcode
				+ ", employee=" + employee + ", company=" + company + "]";
	}
	
	
}
