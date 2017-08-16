package com.pineapple.funding.service;

public class FundingDetail {
	private int fdDetailCode;
	private String openstory;
	private String comValue;
	
	
	public int getFdDetailCode() {
		return fdDetailCode;
	}
	public void setFdDetailCode(int fdDetailCode) {
		this.fdDetailCode = fdDetailCode;
	}
	public String getOpenstory() {
		return openstory;
	}
	public void setOpenstory(String openstory) {
		this.openstory = openstory;
	}
	public String getComValue() {
		return comValue;
	}
	public void setComValue(String comValue) {
		this.comValue = comValue;
	}
	@Override
	public String toString() {
		return "FundingDetail [fdDetailCode=" + fdDetailCode + ", openstory="
				+ openstory + ", comValue=" + comValue + "]";
	}
	
	
}
