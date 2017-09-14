package com.pineapple.user.service;

public class Dividendpay {
	private int divPayCode;
	private int divPayFdCode;
	private int divPayInvestCode;
	private String divPayFdTitle;
	private int divPayAmount;
	private String divPayDate;
	private int divPayissuePrice;
	private int divPayPurchaseShares;
	private int divPayNoShares;
	private int divPayMinInterestRate;
	private int divPayDividendRate;
	private int divPayTotalMargin;
	
	//투자수익률 지표
	private int roi;
	
	public int getDivPayCode() {
		return divPayCode;
	}
	public void setDivPayCode(int divPayCode) {
		this.divPayCode = divPayCode;
	}
	public int getDivPayFdCode() {
		return divPayFdCode;
	}
	public void setDivPayFdCode(int divPayFdCode) {
		this.divPayFdCode = divPayFdCode;
	}
	public int getDivPayInvestCode() {
		return divPayInvestCode;
	}
	public void setDivPayInvestCode(int divPayInvestCode) {
		this.divPayInvestCode = divPayInvestCode;
	}
	public String getDivPayFdTitle() {
		return divPayFdTitle;
	}
	public void setDivPayFdTitle(String divPayFdTitle) {
		this.divPayFdTitle = divPayFdTitle;
	}
	public int getDivPayAmount() {
		return divPayAmount;
	}
	public void setDivPayAmount(int divPayAmount) {
		this.divPayAmount = divPayAmount;
	}
	public String getDivPayDate() {
		return divPayDate;
	}
	public void setDivPayDate(String divPayDate) {
		this.divPayDate = divPayDate;
	}
	public int getDivPayissuePrice() {
		return divPayissuePrice;
	}
	public void setDivPayissuePrice(int divPayissuePrice) {
		this.divPayissuePrice = divPayissuePrice;
	}
	public int getDivPayPurchaseShares() {
		return divPayPurchaseShares;
	}
	public void setDivPayPurchaseShares(int divPayPurchaseShares) {
		this.divPayPurchaseShares = divPayPurchaseShares;
	}
	public int getDivPayNoShares() {
		return divPayNoShares;
	}
	public void setDivPayNoShares(int divPayNoShares) {
		this.divPayNoShares = divPayNoShares;
	}
	public int getDivPayMinInterestRate() {
		return divPayMinInterestRate;
	}
	public void setDivPayMinInterestRate(int divPayMinInterestRate) {
		this.divPayMinInterestRate = divPayMinInterestRate;
	}
	public int getDivPayDividendRate() {
		return divPayDividendRate;
	}
	public void setDivPayDividendRate(int divPayDividendRate) {
		this.divPayDividendRate = divPayDividendRate;
	}
	public int getDivPayTotalMargin() {
		return divPayTotalMargin;
	}
	public void setDivPayTotalMargin(int divPayTotalMargin) {
		this.divPayTotalMargin = divPayTotalMargin;
	}
	public int getRoi() {
		return roi;
	}
	public void setRoi(int roi) {
		this.roi = roi;
	}
	@Override
	public String toString() {
		return "Dividendpay [divPayCode=" + divPayCode + ", divPayFdCode=" + divPayFdCode + ", divPayInvestCode="
				+ divPayInvestCode + ", divPayFdTitle=" + divPayFdTitle + ", divPayAmount=" + divPayAmount
				+ ", divPayDate=" + divPayDate + ", divPayissuePrice=" + divPayissuePrice + ", divPayPurchaseShares="
				+ divPayPurchaseShares + ", divPayNoShares=" + divPayNoShares + ", divPayMinInterestRate="
				+ divPayMinInterestRate + ", divPayDividendRate=" + divPayDividendRate + ", divPayTotalMargin="
				+ divPayTotalMargin + ", roi=" + roi + "]";
	}
	
}
