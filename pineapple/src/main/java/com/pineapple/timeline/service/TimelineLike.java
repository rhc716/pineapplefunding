package com.pineapple.timeline.service;

public class TimelineLike {
	private String tlLikeId;
	private int tlCode;

	public int getTlCode() {
		return tlCode;
	}
	public void setTlCode(int tlCode) {
		this.tlCode = tlCode;
	}
	public String getTlLikeId() {
		return tlLikeId;
	}
	public void setTlLikeId(String tlLikeId) {
		this.tlLikeId = tlLikeId;
	}
	@Override
	public String toString() {
		return "TimelineLike [tlCode=" + tlCode + ", tlLikeId=" + tlLikeId + "]";
	}
	
}
