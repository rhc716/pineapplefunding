package com.pineapple.timeline.service;

import java.util.List;

public class MyInvestorTimeline {
	private int tlCode;
	private String tlTitle;
	private String tlContent;
	private String tlTime;
	private String nickname;
	private String tlId;
	private int timelinelikecount;
	private List<TimelineLike> timelineLike;
	private int totaltimelinecount;
	public int getTlCode() {
		return tlCode;
	}
	public void setTlCode(int tlCode) {
		this.tlCode = tlCode;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTlId() {
		return tlId;
	}
	public void setTlId(String tlId) {
		this.tlId = tlId;
	}
	public int getTimelinelikecount() {
		return timelinelikecount;
	}
	public void setTimelinelikecount(int timelinelikecount) {
		this.timelinelikecount = timelinelikecount;
	}
	public List<TimelineLike> getTimelineLike() {
		return timelineLike;
	}
	public void setTimelineLike(List<TimelineLike> timelineLike) {
		this.timelineLike = timelineLike;
	}
	public int getTotaltimelinecount() {
		return totaltimelinecount;
	}
	public void setTotaltimelinecount(int totaltimelinecount) {
		this.totaltimelinecount = totaltimelinecount;
	}
	@Override
	public String toString() {
		return "MyInvestorTimeline [tlCode=" + tlCode + ", tlTitle=" + tlTitle + ", tlContent=" + tlContent
				+ ", tlTime=" + tlTime + ", nickname=" + nickname + ", tlId=" + tlId + ", timelinelikecount="
				+ timelinelikecount + ", timelineLike=" + timelineLike + ", totaltimelinecount=" + totaltimelinecount
				+ "]";
	}
	

}
