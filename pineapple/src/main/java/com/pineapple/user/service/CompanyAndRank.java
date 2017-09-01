package com.pineapple.user.service;

public class CompanyAndRank {
	// 소속회사명과 직급을 보여주기위해 담아올 객체
	private int ComCode;
	private String comName;
	private String rankName;
	
	
	
	public int getComCode() {
		return ComCode;
	}
	public void setComCode(int comCode) {
		ComCode = comCode;
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
	
	@Override
	public String toString() {
		return "CompanyAndRank [ComCode=" + ComCode + ", comName=" + comName
				+ ", rankName=" + rankName + "]";
	}
	
}
