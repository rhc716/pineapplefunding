package com.pineapple.funding;

public class MileStone {
	private int milestoneCode;
	private int msFdCode;
	private String milestoneStep;
	private String milestoneName;
	private String milestoneSummary;
	private int msComCode;
	private String pm;
	
	
	public int getMilestoneCode() {
		return milestoneCode;
	}
	public void setMilestoneCode(int milestoneCode) {
		this.milestoneCode = milestoneCode;
	}
	public int getMsFdCode() {
		return msFdCode;
	}
	public void setMsFdCode(int msFdCode) {
		this.msFdCode = msFdCode;
	}
	public String getMilestoneStep() {
		return milestoneStep;
	}
	public void setMilestoneStep(String milestoneStep) {
		this.milestoneStep = milestoneStep;
	}
	public String getMilestoneName() {
		return milestoneName;
	}
	public void setMilestoneName(String milestoneName) {
		this.milestoneName = milestoneName;
	}
	public String getMilestoneSummary() {
		return milestoneSummary;
	}
	public void setMilestoneSummary(String milestoneSummary) {
		this.milestoneSummary = milestoneSummary;
	}
	public int getMsComCode() {
		return msComCode;
	}
	public void setMsComCode(int msComCode) {
		this.msComCode = msComCode;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	
	
	@Override
	public String toString() {
		return "MileStone [milestoneCode=" + milestoneCode + ", msFdCode="
				+ msFdCode + ", milestoneStep=" + milestoneStep
				+ ", milestoneName=" + milestoneName + ", milestoneSummary="
				+ milestoneSummary + ", msComCode=" + msComCode + ", pm=" + pm
				+ "]";
	}

}
