package com.pineapple.user.service;

public class UserDetail {
	private String userDetailId;
	private String phoneFront3;
	private String phoneRest8;
	private String postalCode;
	private String address;
	private String address2;
	private int nameCheck;
	
	public String getUserDetailId() {
		return userDetailId;
	}
	public void setUserDetailId(String userDetailId) {
		this.userDetailId = userDetailId;
	}
	public String getPhoneFront3() {
		return phoneFront3;
	}
	public void setPhoneFront3(String phoneFront3) {
		this.phoneFront3 = phoneFront3;
	}
	public String getPhoneRest8() {
		return phoneRest8;
	}
	public void setPhoneRest8(String phoneRest8) {
		this.phoneRest8 = phoneRest8;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getNameCheck() {
		return nameCheck;
	}
	public void setNameCheck(int nameCheck) {
		this.nameCheck = nameCheck;
	}
	@Override
	public String toString() {
		return "UserDetail [userDetailId=" + userDetailId + ", phoneFront3=" + phoneFront3 + ", phoneRest8="
				+ phoneRest8 + ", postalCode=" + postalCode + ", address=" + address + ", address2=" + address2
				+ ", nameCheck=" + nameCheck + "]";
	}
	
}
