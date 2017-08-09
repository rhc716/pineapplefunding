package com.pineapple.funding.invest;

import java.util.List;

public class InvestAndFd {
	private int fdCode;
	private String fdTitle;
	private List<Investment> investment;
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public List<Investment> getInvestment() {
		return investment;
	}
	public void setInvestment(List<Investment> investment) {
		this.investment = investment;
	}
	@Override
	public String toString() {
		return "InvestAndFd [fdCode=" + fdCode + ", fdTitle=" + fdTitle + ", investment=" + investment + "]";
	}

	
}
