package com.pineapple.invest.service;

public class MoneyAndTitleAndId {
	private int flowCode;
	private int mfFdCode;
	private int mfInvestCode;
	private int mfAmount;
	private int mfCategory;
	private String mfDate;
	private String title;
	private String id;
	public int getFlowCode() {
		return flowCode;
	}
	public void setFlowCode(int flowCode) {
		this.flowCode = flowCode;
	}
	public int getMfFdCode() {
		return mfFdCode;
	}
	public void setMfFdCode(int mfFdCode) {
		this.mfFdCode = mfFdCode;
	}
	public int getMfInvestCode() {
		return mfInvestCode;
	}
	public void setMfInvestCode(int mfInvestCode) {
		this.mfInvestCode = mfInvestCode;
	}
	public int getMfAmount() {
		return mfAmount;
	}
	public void setMfAmount(int mfAmount) {
		this.mfAmount = mfAmount;
	}
	public int getMfCategory() {
		return mfCategory;
	}
	public void setMfCategory(int mfCategory) {
		this.mfCategory = mfCategory;
	}
	public String getMfDate() {
		return mfDate;
	}
	public void setMfDate(String mfDate) {
		this.mfDate = mfDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "MoneyAndTitleAndId [flowCode=" + flowCode + ", mfFdCode=" + mfFdCode + ", mfInvestCode=" + mfInvestCode
				+ ", mfAmount=" + mfAmount + ", mfCategory=" + mfCategory + ", mfDate=" + mfDate + ", title=" + title
				+ ", id=" + id + "]";
	}
	
}
