package com.pineapple.user.service;

public class Fundingauth {
	private int authCode;
	private int authFdCode;
	private String authReceiver;
	private String authGiver;
	private int fdAuthLevelCode;
	
	public int getAuthCode() {
		return authCode;
	}
	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
	public int getAuthFdCode() {
		return authFdCode;
	}
	public void setAuthFdCode(int authFdCode) {
		this.authFdCode = authFdCode;
	}
	public String getAuthReceiver() {
		return authReceiver;
	}
	public void setAuthReceiver(String authReceiver) {
		this.authReceiver = authReceiver;
	}
	public String getAuthGiver() {
		return authGiver;
	}
	public void setAuthGiver(String authGiver) {
		this.authGiver = authGiver;
	}
	public int getFdAuthLevelCode() {
		return fdAuthLevelCode;
	}
	public void setFdAuthLevelCode(int fdAuthLevelCode) {
		this.fdAuthLevelCode = fdAuthLevelCode;
	}
	
	@Override
	public String toString() {
		return "Fundingauth [authCode=" + authCode + ", authFdCode=" + authFdCode + ", authReceiver=" + authReceiver
				+ ", authGiver=" + authGiver + ", fdAuthLevelCode=" + fdAuthLevelCode + "]";
	}
	
	
}
