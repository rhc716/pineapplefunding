package com.pineapple.user.service;

import java.util.List;

import com.pineapple.pms.service.WbsActual;
import com.pineapple.pms.service.WbsPlan;

public class FundingAndCompanyAndMilestoneAndWbsAndMargin {
	//funding
	private int fdCode;
	private int fdComCode;
	private String fdTitle;
	
	//company
	private String comName;
	
	//milestone
	private int milestoneCode;
	private int milestoneStep;
	private String milestoneName;
	private String milestoneSummary;
	private String pm;
	
	//WbsPlan
	private List<WbsPlan> wbsplan;
	
	//WbsActual
	private List<WbsActual> wbsactual;
	
	//WbsDailyMargin
	private List<WbsDailyMargin> wbsdailymargin;
	
	public int getFdCode() {
		return fdCode;
	}

	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}

	public int getFdComCode() {
		return fdComCode;
	}

	public void setFdComCode(int fdComCode) {
		this.fdComCode = fdComCode;
	}

	public String getFdTitle() {
		return fdTitle;
	}

	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}

	public int getMilestoneCode() {
		return milestoneCode;
	}

	public void setMilestoneCode(int milestoneCode) {
		this.milestoneCode = milestoneCode;
	}

	public int getMilestoneStep() {
		return milestoneStep;
	}

	public void setMilestoneStep(int milestoneStep) {
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

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public List<WbsPlan> getWbsplan() {
		return wbsplan;
	}

	public void setWbsplan(List<WbsPlan> wbsplan) {
		this.wbsplan = wbsplan;
	}

	public List<WbsActual> getWbsactual() {
		return wbsactual;
	}

	public void setWbsactual(List<WbsActual> wbsactual) {
		this.wbsactual = wbsactual;
	}

	public List<WbsDailyMargin> getWbsdailymargin() {
		return wbsdailymargin;
	}

	public void setWbsdailymargin(List<WbsDailyMargin> wbsdailymargin) {
		this.wbsdailymargin = wbsdailymargin;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	@Override
	public String toString() {
		return "FundingAndCompanyAndMilestoneAndWbsAndMargin [fdCode=" + fdCode + ", fdComCode=" + fdComCode
				+ ", fdTitle=" + fdTitle + ", comName=" + comName + ", milestoneCode=" + milestoneCode
				+ ", milestoneStep=" + milestoneStep + ", milestoneName=" + milestoneName + ", milestoneSummary="
				+ milestoneSummary + ", pm=" + pm + ", wbsplan=" + wbsplan + ", wbsactual=" + wbsactual
				+ ", wbsdailymargin=" + wbsdailymargin + "]";
	}

	
}
