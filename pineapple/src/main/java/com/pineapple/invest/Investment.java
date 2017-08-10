package com.pineapple.invest;

public class Investment {
	private int investCode;
	private int investFdCode;
	private String investId;
	private int purchaseShares;
	private String investTime;
	private int payCheck;
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
	@Override
	public String toString() {
		return "Invest [investCode=" + investCode + ", investFdCode=" + investFdCode + ", investId=" + investId
				+ ", purchaseShares=" + purchaseShares + ", investTime=" + investTime + ", payCheck=" + payCheck + "]";
	}

}
