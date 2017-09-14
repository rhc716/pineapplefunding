package com.pineapple.funding.service;

public class MessageAndFd {
	private int msgCode;
	private String msgTitle;
	private String msgContent;
	private int msgCheck;
	private String msgSendId;
	private String msgReceiveId;
	private String msgTime;
	private String name;
	private String nickname;
	private int fdCode;
	
	
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
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
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
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	@Override
	public String toString() {
		return "MessageAndFd [msgCode=" + msgCode + ", msgTitle=" + msgTitle
				+ ", msgContent=" + msgContent + ", msgCheck=" + msgCheck
				+ ", msgSendId=" + msgSendId + ", msgReceiveId=" + msgReceiveId
				+ ", msgTime=" + msgTime + ", name=" + name + ", nickname="
				+ nickname + ", fdCode=" + fdCode + "]";
	}
	
	
}
