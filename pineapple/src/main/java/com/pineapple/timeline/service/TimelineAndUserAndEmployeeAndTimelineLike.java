package com.pineapple.timeline.service;

import java.util.List;

public class TimelineAndUserAndEmployeeAndTimelineLike {
	private int tlCode;
	private String tlTitle;
	private String tlContent;
	private String tlTime;
	private String nickname;
	private int emRankCode;
	private String emComName;
	private int timelinelikecount;
	private List<TimelineLike> timelineLike;
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
	public int getEmRankCode() {
		return emRankCode;
	}
	public void setEmRankCode(int emRankCode) {
		this.emRankCode = emRankCode;
	}
	public String getEmComName() {
		return emComName;
	}
	public void setEmComName(String emComName) {
		this.emComName = emComName;
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
	@Override
	public String toString() {
		return "TimelineAndUserAndEmployeeAndTimelineLike [tlCode=" + tlCode + ", tlTitle=" + tlTitle + ", tlContent="
				+ tlContent + ", tlTime=" + tlTime + ", nickname=" + nickname + ", emRankCode=" + emRankCode
				+ ", emComName=" + emComName + ", timelinelikecount=" + timelinelikecount + ", timelineLike="
				+ timelineLike + "]";
	}

}
