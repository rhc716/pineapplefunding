package com.pineapple.timeline.service;

public class TimelineReply {
	private int tlReCode;
	private int tlCode;
	private String tlReId;
	private String tlReContent;
	private String tlReTime;
	private String nickname;
	public int getTlReCode() {
		return tlReCode;
	}
	public void setTlReCode(int tlReCode) {
		this.tlReCode = tlReCode;
	}
	public int getTlCode() {
		return tlCode;
	}
	public void setTlCode(int tlCode) {
		this.tlCode = tlCode;
	}
	public String getTlReId() {
		return tlReId;
	}
	public void setTlReId(String tlReId) {
		this.tlReId = tlReId;
	}
	public String getTlReContent() {
		return tlReContent;
	}
	public void setTlReContent(String tlReContent) {
		this.tlReContent = tlReContent;
	}
	public String getTlReTime() {
		return tlReTime;
	}
	public void setTlReTime(String tlReTime) {
		this.tlReTime = tlReTime;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "TimelineReply [tlReCode=" + tlReCode + ", tlCode=" + tlCode + ", tlReId=" + tlReId + ", tlReContent="
				+ tlReContent + ", tlReTime=" + tlReTime + ", nickname=" + nickname + "]";
	}

	
}
