package com.pineapple.invest.service;

public class InvestAndFd {
	private int fdCode;
	private String fdTitle;
	private int numberOfShares;
	private String comName;
	private int total;

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
	@Override
	public String toString() {
		return "InvestAndFd [fdCode=" + fdCode + ", fdTitle=" + fdTitle + ", numberOfShares=" + numberOfShares
				+ ", comName=" + comName + ", total=" + total + "]";
	}
	

	
}
