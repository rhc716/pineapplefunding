package com.pineapple.user.service;

import java.util.List;

public class InvestmentAndDividendpay {
	//investment
	private int investCode;
	private int investFdCode;
	private String investId;
	private int purchaseShares;
	private String investTime;
	private int payCheck;
	
	//투자액
	private int ia;
	
	//funding 
	private String fdTitle;
	private int issuePrice;
	
	//company
	private String comName;
	
	//dividendpay
	private List<Dividendpay> dividendpay;

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

	public List<Dividendpay> getDividendpay() {
		return dividendpay;
	}

	public void setDividendpay(List<Dividendpay> dividendpay) {
		this.dividendpay = dividendpay;
	}

	public String getFdTitle() {
		return fdTitle;
	}

	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}

	public int getIssuePrice() {
		return issuePrice;
	}

	public void setIssuePrice(int issuePrice) {
		this.issuePrice = issuePrice;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getIa() {
		return ia;
	}

	public void setIa(int ia) {
		this.ia = ia;
	}

	@Override
	public String toString() {
		return "InvestmentAndDividendpay [investCode=" + investCode + ", investFdCode=" + investFdCode + ", investId="
				+ investId + ", purchaseShares=" + purchaseShares + ", investTime=" + investTime + ", payCheck="
				+ payCheck + ", ia=" + ia + ", fdTitle=" + fdTitle + ", issuePrice=" + issuePrice + ", comName="
				+ comName + ", dividendpay=" + dividendpay + "]";
	}
	
}
