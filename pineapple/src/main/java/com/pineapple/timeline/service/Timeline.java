package com.pineapple.timeline.service;

public class Timeline {
	private int tlCode;
	private String tlId;
	private String tlTitle;
	private String tlContent;
	private String tlTime;
	public int getTlCode() {
		return tlCode;
	}
	public void setTlCode(int tlCode) {
		this.tlCode = tlCode;
	}
	public String getTlId() {
		return tlId;
	}
	public void setTlId(String tlId) {
		this.tlId = tlId;
	}
	public String getTlTitle() {
		return tlTitle;
	}
	public void setTlTitle(String tlTitle) {
		this.tlTitle = tlTitle;
	}
	public String getTlContent() {
		return tlContent;
	}
	public void setTlContent(String tlContent) {
		this.tlContent = tlContent;
	}
	public String getTlTime() {
		return tlTime;
	}
	public void setTlTime(String tlTime) {
		this.tlTime = tlTime;
	}
	@Override
	public String toString() {
		return "Timeline [tlCode=" + tlCode + ", tlId=" + tlId + ", tlTitle=" + tlTitle + ", tlContent=" + tlContent
				+ ", tlTime=" + tlTime + "]";
	}
	
}
