package com.pineapple.invest.service;

public class InvestAndFdLikeAndFd {
	private int fdCode;
	private int numberOfShares;
	private int issuePrice;
	private String closeDate;
	private String fdTitle;
	private String fdType;
	private int minInvestMoney;
	private int liketotal;
	private int investtotal;
	private int investcount;
	private String posterImg;
	
	public String getPosterImg() {
		return posterImg;
	}
	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	public int getNumberOfShares() {
		return numberOfShares;
	}
	public void setNumberOfShares(int numberOfShares) {
		this.numberOfShares = numberOfShares;
	}
	public int getIssuePrice() {
		return issuePrice;
	}
	public void setIssuePrice(int issuePrice) {
		this.issuePrice = issuePrice;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public String getFdType() {
		return fdType;
	}
	public void setFdType(String fdType) {
		this.fdType = fdType;
	}
	public int getMinInvestMoney() {
		return minInvestMoney;
	}
	public void setMinInvestMoney(int minInvestMoney) {
		this.minInvestMoney = minInvestMoney;
	}
	public int getLiketotal() {
		return liketotal;
	}
	public void setLiketotal(int liketotal) {
		this.liketotal = liketotal;
	}
	public int getInvesttotal() {
		return investtotal;
	}
	public void setInvesttotal(int investtotal) {
		this.investtotal = investtotal;
	}
	
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public int getInvestcount() {
		return investcount;
	}
	public void setInvestcount(int investcount) {
		this.investcount = investcount;
	}
	@Override
	public String toString() {
		return "InvestAndFdLikeAndFd [fdCode=" + fdCode + ", numberOfShares=" + numberOfShares + ", issuePrice="
				+ issuePrice + ", closeDate=" + closeDate + ", fdTitle=" + fdTitle + ", fdType=" + fdType
				+ ", minInvestMoney=" + minInvestMoney + ", liketotal=" + liketotal + ", investtotal=" + investtotal
				+ ", investcount=" + investcount + ", posterImg=" + posterImg + "]";
	}

}
