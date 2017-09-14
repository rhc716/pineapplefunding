package com.pineapple.user.service;

public class WbsPlanMargin {
	private int wpmgCode;
	private int wpmgFdCode;
	private int wpmgMsCode;
	private int wpmgWpCode;
	private int wpmgMargin;
	
	public int getWpmgCode() {
		return wpmgCode;
	}
	public void setWpmgCode(int wpmgCode) {
		this.wpmgCode = wpmgCode;
	}
	public int getWpmgFdCode() {
		return wpmgFdCode;
	}
	public void setWpmgFdCode(int wpmgFdCode) {
		this.wpmgFdCode = wpmgFdCode;
	}
	public int getWpmgMsCode() {
		return wpmgMsCode;
	}
	public void setWpmgMsCode(int wpmgMsCode) {
		this.wpmgMsCode = wpmgMsCode;
	}
	public int getWpmgWpCode() {
		return wpmgWpCode;
	}
	public void setWpmgWpCode(int wpmgWpCode) {
		this.wpmgWpCode = wpmgWpCode;
	}
	public int getWpmgMargin() {
		return wpmgMargin;
	}
	public void setWpmgMargin(int wpmgMargin) {
		this.wpmgMargin = wpmgMargin;
	}
	@Override
	public String toString() {
		return "WbsPlanMargin [wpmgCode=" + wpmgCode + ", wpmgFdCode=" + wpmgFdCode + ", wpmgMsCode=" + wpmgMsCode
				+ ", wpmgWpCode=" + wpmgWpCode + ", wpmgMargin=" + wpmgMargin + "]";
	}
	
}
