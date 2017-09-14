package com.pineapple.pms.service;

import java.util.List;

public class WbsPlanBox {
	WbsPlan wbsplan;
	List<WbsPlanEtc> wbsplanetc;
	List<WbsPlanFacility> wbsplanfacility;
	List<WbsPlanHuman> wbsplanhuman;
	List<WbsPlanIncome> wbsplanincome;
	List<WbsPlanMaterial> wbsplanmaterial;
	List<WbsPlanOut> wbsplanout;
	
	public WbsPlan getWbsplan() {
		return wbsplan;
	}
	public void setWbsplan(WbsPlan wbsplan) {
		this.wbsplan = wbsplan;
	}
	public List<WbsPlanEtc> getWbsplanetc() {
		return wbsplanetc;
	}
	public void setWbsplanetc(List<WbsPlanEtc> wbsplanetc) {
		this.wbsplanetc = wbsplanetc;
	}
	public List<WbsPlanFacility> getWbsplanfacility() {
		return wbsplanfacility;
	}
	public void setWbsplanfacility(List<WbsPlanFacility> wbsplanfacility) {
		this.wbsplanfacility = wbsplanfacility;
	}
	public List<WbsPlanHuman> getWbsplanhuman() {
		return wbsplanhuman;
	}
	public void setWbsplanhuman(List<WbsPlanHuman> wbsplanhuman) {
		this.wbsplanhuman = wbsplanhuman;
	}
	public List<WbsPlanIncome> getWbsplanincome() {
		return wbsplanincome;
	}
	public void setWbsplanincome(List<WbsPlanIncome> wbsplanincome) {
		this.wbsplanincome = wbsplanincome;
	}
	public List<WbsPlanMaterial> getWbsplanmaterial() {
		return wbsplanmaterial;
	}
	public void setWbsplanmaterial(List<WbsPlanMaterial> wbsplanmaterial) {
		this.wbsplanmaterial = wbsplanmaterial;
	}
	public List<WbsPlanOut> getWbsplanout() {
		return wbsplanout;
	}
	public void setWbsplanout(List<WbsPlanOut> wbsplanout) {
		this.wbsplanout = wbsplanout;
	}
	@Override
	public String toString() {
		return "WbsPlanBox [wbsplan=" + wbsplan + ", wbsplanetc=" + wbsplanetc + ", wbsplanfacility=" + wbsplanfacility
				+ ", wbsplanhuman=" + wbsplanhuman + ", wbsplanincome=" + wbsplanincome + ", wbsplanmaterial="
				+ wbsplanmaterial + ", wbsplanout=" + wbsplanout + "]";
	}
	
	
}
