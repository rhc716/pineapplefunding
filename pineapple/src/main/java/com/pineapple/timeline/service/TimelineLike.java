package com.pineapple.timeline.service;

public class TimelineLike {
	private String tlLikeId;
	private int tlCode;
	private String timelinelikenickname;

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
	public String getTimelinelikenickname() {
		return timelinelikenickname;
	}
	public void setTimelinelikenickname(String timelinelikenickname) {
		this.timelinelikenickname = timelinelikenickname;
	}
	@Override
	public String toString() {
		return "TimelineLike [tlLikeId=" + tlLikeId + ", tlCode=" + tlCode + ", timelinelikenickname="
				+ timelinelikenickname + "]";
	}

}
