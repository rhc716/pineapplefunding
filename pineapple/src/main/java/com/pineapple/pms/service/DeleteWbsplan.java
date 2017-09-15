package com.pineapple.pms.service;

public class DeleteWbsplan {

	private int wbsPlanCode;
	private int msCode;
	private int fdCode;
	public int getWbsPlanCode() {
		return wbsPlanCode;
	}
	public void setWbsPlanCode(int wbsPlanCode) {
		this.wbsPlanCode = wbsPlanCode;
	}
	public int getMsCode() {
		return msCode;
	}
	public void setMsCode(int msCode) {
		this.msCode = msCode;
	}
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	@Override
	public String toString() {
		return "DeleteWbsplan [wbsPlanCode=" + wbsPlanCode + ", msCode=" + msCode + ", fdCode=" + fdCode + "]";
	}
	
	
}
