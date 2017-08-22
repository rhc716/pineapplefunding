package com.pineapple.funding.service;

public class FundingDividendPlan {
	private int divCode;
	private int divFdCode;
	private String divIndexName;
	private int settlementUnit;
	private int minMargin;
	private int maxMargin;
	private int dividendRate;
	
	
	public int getDivCode() {
		return divCode;
	}
	public void setDivCode(int divCode) {
		this.divCode = divCode;
	}
	public int getDivFdCode() {
		return divFdCode;
	}
	public void setDivFdCode(int divFdCode) {
		this.divFdCode = divFdCode;
	}
	public String getDivIndexName() {
		return divIndexName;
	}
	public void setDivIndexName(String divIndexName) {
		this.divIndexName = divIndexName;
	}
	public int getSettlementUnit() {
		return settlementUnit;
	}
	public void setSettlementUnit(int settlementUnit) {
		this.settlementUnit = settlementUnit;
	}
	public int getMinMargin() {
		return minMargin;
	}
	public void setMinMargin(int minMargin) {
		this.minMargin = minMargin;
	}
	public int getMaxMargin() {
		return maxMargin;
	}
	public void setMaxMargin(int maxMargin) {
		this.maxMargin = maxMargin;
	}
	public int getDividendRate() {
		return dividendRate;
	}
	public void setDividendRate(int dividendRate) {
		this.dividendRate = dividendRate;
	}
	
	
	@Override
	public String toString() {
		return "FundingDividendPlan [divCode=" + divCode + ", divFdCode="
				+ divFdCode + ", divIndexName=" + divIndexName
				+ ", settlementUnit=" + settlementUnit + ", minMargin="
				+ minMargin + ", maxMargin=" + maxMargin + ", dividendRate="
				+ dividendRate + "]";
	}
	
}
