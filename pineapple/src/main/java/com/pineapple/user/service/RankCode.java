package com.pineapple.user.service;

public class RankCode {
	private int rankCode;
	private String rankName;
	
	public int getRankCode() {
		return rankCode;
	}
	public void setRankCode(int rankCode) {
		this.rankCode = rankCode;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	@Override
	public String toString() {
		return "RankCode [rankCode=" + rankCode + ", rankName=" + rankName + "]";
	}
}
