package com.pineapple.timeline.service;

public class MyInvestorTimelineLog {
	private int daycount;
	private int oneweekcount;
	private int twoweekcount;
	private int threeweekcount;
	private int fourweekcount;
	private int onemonthcount;
	public int getDaycount() {
		return daycount;
	}
	public void setDaycount(int daycount) {
		this.daycount = daycount;
	}
	public int getOneweekcount() {
		return oneweekcount;
	}
	public void setOneweekcount(int oneweekcount) {
		this.oneweekcount = oneweekcount;
	}
	public int getTwoweekcount() {
		return twoweekcount;
	}
	public void setTwoweekcount(int twoweekcount) {
		this.twoweekcount = twoweekcount;
	}
	public int getThreeweekcount() {
		return threeweekcount;
	}
	public void setThreeweekcount(int threeweekcount) {
		this.threeweekcount = threeweekcount;
	}
	public int getFourweekcount() {
		return fourweekcount;
	}
	public void setFourweekcount(int fourweekcount) {
		this.fourweekcount = fourweekcount;
	}
	public int getOnemonthcount() {
		return onemonthcount;
	}
	public void setOnemonthcount(int onemonthcount) {
		this.onemonthcount = onemonthcount;
	}
	@Override
	public String toString() {
		return "MyInvestorTimelineLog [daycount=" + daycount + ", oneweekcount=" + oneweekcount + ", twoweekcount="
				+ twoweekcount + ", threeweekcount=" + threeweekcount + ", fourweekcount=" + fourweekcount
				+ ", onemonthcount=" + onemonthcount + "]";
	}
	
}
