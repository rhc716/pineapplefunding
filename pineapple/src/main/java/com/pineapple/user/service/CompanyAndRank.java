package com.pineapple.user.service;

public class CompanyAndRank {
	// 소속회사명과 직급을 보여주기위해 담아올 객체
	private int comCode;
	private String comName;
	private String rankName;
	private String emDepartment;
	
	
	public int getComCode() {
		return comCode;
	}
	public void setComCode(int comCode) {
		this.comCode = comCode;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getEmDepartment() {
		return emDepartment;
	}
	public void setEmDepartment(String emDepartment) {
		this.emDepartment = emDepartment;
	}
	@Override
	public String toString() {
		return "CompanyAndRank [ComCode=" + comCode + ", comName=" + comName
				+ ", rankName=" + rankName + ", emDepartment=" + emDepartment
				+ "]";
	}
	
	
	

	
}
