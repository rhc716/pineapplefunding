package com.pineapple.user.service;

public class Account {
	private int accountCode;
	private String accountId;
	private String secCompany;
	private String accountNumber;
	private String accountNickname;
	
	public int getAccountCode() {
		return accountCode;
	}
	public void setAccountCode(int accountCode) {
		this.accountCode = accountCode;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getSecCompany() {
		return secCompany;
	}
	public void setSecCompany(String secCompany) {
		this.secCompany = secCompany;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountNickname() {
		return accountNickname;
	}
	public void setAccountNickname(String accountNickname) {
		this.accountNickname = accountNickname;
	}
	
	@Override
	public String toString() {
		return "Account [accountCode=" + accountCode + ", accountId=" + accountId + ", secCompany=" + secCompany
				+ ", accountNumber=" + accountNumber + ", accountNickname=" + accountNickname + "]";
	}
	
	
}
