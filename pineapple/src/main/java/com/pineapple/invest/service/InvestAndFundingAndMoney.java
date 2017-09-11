package com.pineapple.invest.service;

public class InvestAndFundingAndMoney {
	private int investCode;
	private int investFdCode;
	private String investId;
	private int purchaseShares;
	private String investTime;
	private int payCheck;
	private int fdCode;
	private int moneytotal;
	private int numberOfShares;
	private int issuePrice;
	private int minInvestMoney;
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
	public int getPurchaseShares() {
		return purchaseShares;
	}
	public void setPurchaseShares(int purchaseShares) {
		this.purchaseShares = purchaseShares;
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
	public int getMoneytotal() {
		return moneytotal;
	}
	public void setMoneytotal(int moneytotal) {
		this.moneytotal = moneytotal;
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
	public int getMinInvestMoney() {
		return minInvestMoney;
	}
	public void setMinInvestMoney(int minInvestMoney) {
		this.minInvestMoney = minInvestMoney;
	}
	@Override
	public String toString() {
		return "InvestAndFundingAndMoney [investCode=" + investCode + ", investFdCode=" + investFdCode + ", investId="
				+ investId + ", purchaseShares=" + purchaseShares + ", investTime=" + investTime + ", payCheck="
				+ payCheck + ", fdCode=" + fdCode + ", moneytotal=" + moneytotal + ", numberOfShares=" + numberOfShares
				+ ", issuePrice=" + issuePrice + ", minInvestMoney=" + minInvestMoney + "]";
	}
	
}
