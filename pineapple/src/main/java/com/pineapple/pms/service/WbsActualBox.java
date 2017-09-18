package com.pineapple.pms.service;

import java.util.List;

public class WbsActualBox {
	WbsActual wbsactual;
	List<WbsDailyEtc> wbsdailyetc;
	List<WbsDailyFacility> wbsdailyfacility;
	List<WbsDailyHuman> wbsdailyhuman;
	List<WbsDailyIncome> wbsdailyincome;
	List<WbsDailyMatrial> wbsdailymatrial;
	List<WbsDailyOut> wbsdailyout;
	
	public WbsActual getWbsactual() {
		return wbsactual;
	}
	public void setWbsactual(WbsActual wbsactual) {
		this.wbsactual = wbsactual;
	}
	public List<WbsDailyEtc> getWbsdailyetc() {
		return wbsdailyetc;
	}
	public void setWbsdailyetc(List<WbsDailyEtc> wbsdailyetc) {
		this.wbsdailyetc = wbsdailyetc;
	}
	public List<WbsDailyFacility> getWbsdailyfacility() {
		return wbsdailyfacility;
	}
	public void setWbsdailyfacility(List<WbsDailyFacility> wbsdailyfacility) {
		this.wbsdailyfacility = wbsdailyfacility;
	}
	public List<WbsDailyHuman> getWbsdailyhuman() {
		return wbsdailyhuman;
	}
	public void setWbsdailyhuman(List<WbsDailyHuman> wbsdailyhuman) {
		this.wbsdailyhuman = wbsdailyhuman;
	}
	public List<WbsDailyIncome> getWbsdailyincome() {
		return wbsdailyincome;
	}
	public void setWbsdailyincome(List<WbsDailyIncome> wbsdailyincome) {
		this.wbsdailyincome = wbsdailyincome;
	}
	public List<WbsDailyMatrial> getWbsdailymatrial() {
		return wbsdailymatrial;
	}
	public void setWbsdailymatrial(List<WbsDailyMatrial> wbsdailymatrial) {
		this.wbsdailymatrial = wbsdailymatrial;
	}
	public List<WbsDailyOut> getWbsdailyout() {
		return wbsdailyout;
	}
	public void setWbsdailyout(List<WbsDailyOut> wbsdailyout) {
		this.wbsdailyout = wbsdailyout;
	}
	@Override
	public String toString() {
		return "WbsActualBox [wbsactual=" + wbsactual + ", wbsdailyetc=" + wbsdailyetc + ", wbsdailyfacility="
				+ wbsdailyfacility + ", wbsdailyhuman=" + wbsdailyhuman + ", wbsdailyincome=" + wbsdailyincome
				+ ", wbsdailymatrial=" + wbsdailymatrial + ", wbsdailyout=" + wbsdailyout + "]";
	}
	
	

	
	
}
