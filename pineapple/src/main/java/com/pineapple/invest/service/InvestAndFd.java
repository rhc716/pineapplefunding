package com.pineapple.invest.service;

public class InvestAndFd {
	private int fdCode;
	private String fdTitle;
	private int numberOfShares;
	private String comName;
	private int total;
	private String posterImg;
	private int minInvestMoney;
	private int issuePrice;
	private int days;
	
	
	public int getIssuePrice() {
		return issuePrice;
	}
	public void setIssuePrice(int issuePrice) {
		this.issuePrice = issuePrice;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public int getMinInvestMoney() {
		return minInvestMoney;
	}
	public void setMinInvestMoney(int minInvestMoney) {
		this.minInvestMoney = minInvestMoney;
	}
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public int getNumberOfShares() {
		return numberOfShares;
	}
	public void setNumberOfShares(int numberOfShares) {
		this.numberOfShares = numberOfShares;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getPosterImg() {
		return posterImg;
	}
	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}
	@Override
	public String toString() {
		return "InvestAndFd [fdCode=" + fdCode + ", fdTitle=" + fdTitle + ", numberOfShares=" + numberOfShares
				+ ", comName=" + comName + ", total=" + total + ", posterImg=" + posterImg + ", minInvestMoney="
				+ minInvestMoney + ", issuePrice=" + issuePrice + ", days=" + days + "]";
	}


}
