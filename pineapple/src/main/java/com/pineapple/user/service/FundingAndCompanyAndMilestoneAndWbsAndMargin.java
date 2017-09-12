package com.pineapple.user.service;

import com.pineapple.pms.service.WbsActual;
import com.pineapple.pms.service.WbsMs;
import com.pineapple.pms.service.WbsPlan;

public class FundingAndCompanyAndMilestoneAndWbsAndMargin {
	//funding
	private int fdCode;
	private int fdComCode;
	private String fdTitle;
	
	//company
	private Company company;
	
	//milestone
	private WbsMs milestone;
	
	//WbsPlan
	private WbsPlan wbsplan;
	
	//WbsActual
	private WbsActual wbsactual;
	
	//WbsDailyMargin
	private WbsDailyMargin wbsdailymargin;
	
	//WbsPlanMargin
	private WbsPlanMargin wbsplanmargin;

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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public WbsMs getMilestone() {
		return milestone;
	}

	public void setMilestone(WbsMs milestone) {
		this.milestone = milestone;
	}

	public WbsPlan getWbsplan() {
		return wbsplan;
	}

	public void setWbsplan(WbsPlan wbsplan) {
		this.wbsplan = wbsplan;
	}

	public WbsActual getWbsactual() {
		return wbsactual;
	}

	public void setWbsactual(WbsActual wbsactual) {
		this.wbsactual = wbsactual;
	}

	public WbsDailyMargin getWbsdailymargin() {
		return wbsdailymargin;
	}

	public void setWbsdailymargin(WbsDailyMargin wbsdailymargin) {
		this.wbsdailymargin = wbsdailymargin;
	}

	public WbsPlanMargin getWbsplanmargin() {
		return wbsplanmargin;
	}

	public void setWbsplanmargin(WbsPlanMargin wbsplanmargin) {
		this.wbsplanmargin = wbsplanmargin;
	}

	@Override
	public String toString() {
		return "FundingAndCompanyAndMilestoneAndWbsAndMargin [fdCode=" + fdCode + ", fdComCode=" + fdComCode
				+ ", fdTitle=" + fdTitle + ", company=" + company + ", milestone=" + milestone + ", wbsplan=" + wbsplan
				+ ", wbsactual=" + wbsactual + ", wbsdailymargin=" + wbsdailymargin + ", wbsplanmargin=" + wbsplanmargin
				+ "]";
	}

}
