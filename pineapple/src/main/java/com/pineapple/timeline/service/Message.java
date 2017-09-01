package com.pineapple.timeline.service;

public class Message {
	private int msgCode;
	private String msgTitle;
	private int msgCheck;
	private String msgSendId;
	private String msgReceiveId;
	private String msgTime;
	private String name;
	private String nickname;
	public int getMsgCode() {
		return msgCode;
	}
	public void setMsgCode(int msgCode) {
		this.msgCode = msgCode;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public int getMsgCheck() {
		return msgCheck;
	}
	public void setMsgCheck(int msgCheck) {
		this.msgCheck = msgCheck;
	}
	public String getMsgSendId() {
		return msgSendId;
	}
	public void setMsgSendId(String msgSendId) {
		this.msgSendId = msgSendId;
	}
	public String getMsgReceiveId() {
		return msgReceiveId;
	}
	public void setMsgReceiveId(String msgReceiveId) {
		this.msgReceiveId = msgReceiveId;
	}
	public String getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "Message [msgCode=" + msgCode + ", msgTitle=" + msgTitle + ", msgCheck=" + msgCheck + ", msgSendId="
				+ msgSendId + ", msgReceiveId=" + msgReceiveId + ", msgTime=" + msgTime + ", name=" + name
				+ ", nickname=" + nickname + "]";
	}
	
}
