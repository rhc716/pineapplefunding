package com.pineapple.invest.service;

public class InvestorInvestList {
	private int investCode;
	private int investFdCode;
	private String investId;
	private String investTime;
	private int payCheck;
	private int purchaseShares;
	private int fdCode;
	private String fdType;
	private String fdStatus;
	private String fdTitle;
	private int numberOfShares;
	private int investtotal;
	private int issuePrice;
	
	public int getPurchaseShares() {
		return purchaseShares;
	}
	public void setPurchaseShares(int purchaseShares) {
		this.purchaseShares = purchaseShares;
	}
	public int getInvestCode() {
		return investCode;
	}
	public void setInvestCode(int investCode) {
		this.investCode = investCode;
	}
	public int getInvestFdCode() {
		return investFdCode;
	}
	public void setInvestFdCode(int investFdCode) {
		this.investFdCode = investFdCode;
	}
	public String getInvestId() {
		return investId;
	}
	public void setInvestId(String investId) {
		this.investId = investId;
	}
	public String getInvestTime() {
		return investTime;
	}
	public void setInvestTime(String investTime) {
		this.investTime = investTime;
	}
	public int getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(int payCheck) {
		this.payCheck = payCheck;
	}
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	public String getFdType() {
		return fdType;
	}
	public void setFdType(String fdType) {
		this.fdType = fdType;
	}
	public String getFdStatus() {
		return fdStatus;
	}
	public void setFdStatus(String fdStatus) {
		this.fdStatus = fdStatus;
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
	public int getInvesttotal() {
		return investtotal;
	}
	public void setInvesttotal(int investtotal) {
		this.investtotal = investtotal;
	}
	public int getIssuePrice() {
		return issuePrice;
	}
	public void setIssuePrice(int issuePrice) {
		this.issuePrice = issuePrice;
	}
	@Override
	public String toString() {
		return "InvestorInvestList [investCode=" + investCode + ", investFdCode=" + investFdCode + ", investId="
				+ investId + ", investTime=" + investTime + ", payCheck=" + payCheck + ", purchaseShares="
				+ purchaseShares + ", fdCode=" + fdCode + ", fdType=" + fdType + ", fdStatus=" + fdStatus + ", fdTitle="
				+ fdTitle + ", numberOfShares=" + numberOfShares + ", investtotal=" + investtotal + ", issuePrice="
				+ issuePrice + "]";
	}


}
