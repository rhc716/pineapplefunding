package com.pineapple.user.service;

public class Employee {
	private int emCode;
	private String emUserId;
	private int emComCode;
	private String emComName;
	private int emRankCode;
	private String emDepartment;
	private int emCheck;
	private int emDelRequest;
	
	public int getEmCode() {
		return emCode;
	}
	public void setEmCode(int emCode) {
		this.emCode = emCode;
	}
	public String getEmUserId() {
		return emUserId;
	}
	public void setEmUserId(String emUserId) {
		this.emUserId = emUserId;
	}
	public int getEmComCode() {
		return emComCode;
	}
	public void setEmComCode(int emComCode) {
		this.emComCode = emComCode;
	}
	public String getEmComName() {
		return emComName;
	}
	public void setEmComName(String emComName) {
		this.emComName = emComName;
	}
	public int getEmRankCode() {
		return emRankCode;
	}
	public void setEmRankCode(int emRankCode) {
		this.emRankCode = emRankCode;
	}
	public String getEmDepartment() {
		return emDepartment;
	}
	public void setEmDepartment(String emDepartment) {
		this.emDepartment = emDepartment;
	}
	public int getEmCheck() {
		return emCheck;
	}
	public void setEmCheck(int emCheck) {
		this.emCheck = emCheck;
	}
	public int getEmDelRequest() {
		return emDelRequest;
	}
	public void setEmDelRequest(int emDelRequest) {
		this.emDelRequest = emDelRequest;
	}
	
	@Override
	public String toString() {
		return "Employee [emCode=" + emCode + ", emUserId=" + emUserId + ", emComCode=" + emComCode + ", emComName="
				+ emComName + ", emRankCode=" + emRankCode + ", emDepartment=" + emDepartment + ", emCheck=" + emCheck
				+ ", emDelRequest=" + emDelRequest + "]";
	}
	
	
}
