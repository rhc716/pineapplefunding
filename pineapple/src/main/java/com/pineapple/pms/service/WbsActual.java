package com.pineapple.pms.service;

public class WbsActual {
	private int wbsActualCode;
	private int wbsActualFdCode;
	private int wbsActualMsCode;
	private int wbsPlanAcCode;
	private String wbsActualName;
	private String wbsActualStartDate;
	private String wbsActualEndDate;
	private int wbsActualDuration;
	private String wbsActualStatus;
	private int wbsActualProgress;
	private String wbsActualWriteDate;
	private String wbsActualApprovalDate;
	private String wbsActualApprovalReason;
	private String wbsActualWriteManager;
	private String wbsActualApprovalManager;
	private int wbsActualComCode;
	private String fdTitle;
	private String milestoneName;
	
	public int getWbsActualCode() {
		return wbsActualCode;
	}
	public void setWbsActualCode(int wbsActualCode) {
		this.wbsActualCode = wbsActualCode;
	}
	public int getWbsActualFdCode() {
		return wbsActualFdCode;
	}
	public void setWbsActualFdCode(int wbsActualFdCode) {
		this.wbsActualFdCode = wbsActualFdCode;
	}
	public int getWbsActualMsCode() {
		return wbsActualMsCode;
	}
	public void setWbsActualMsCode(int wbsActualMsCode) {
		this.wbsActualMsCode = wbsActualMsCode;
	}
	public int getWbsPlanAcCode() {
		return wbsPlanAcCode;
	}
	public void setWbsPlanAcCode(int wbsPlanAcCode) {
		this.wbsPlanAcCode = wbsPlanAcCode;
	}
	public String getWbsActualName() {
		return wbsActualName;
	}
	public void setWbsActualName(String wbsActualName) {
		this.wbsActualName = wbsActualName;
	}
	public String getWbsActualStartDate() {
		return wbsActualStartDate;
	}
	public void setWbsActualStartDate(String wbsActualStartDate) {
		if(wbsActualStartDate==""){
			wbsActualStartDate=null;
		}else{
			this.wbsActualStartDate = wbsActualStartDate;
		}
		
	}
	public String getWbsActualEndDate() {
		return wbsActualEndDate;
	}
	public void setWbsActualEndDate(String wbsActualEndDate) {
		if(wbsActualEndDate==""){
			wbsActualEndDate=null;
		}else{
			this.wbsActualEndDate = wbsActualEndDate;
		}
	}
		
	public int getWbsActualDuration() {
		return wbsActualDuration;
	}
	public void setWbsActualDuration(int wbsActualDuration) {
		this.wbsActualDuration = wbsActualDuration;
	}
	public String getWbsActualStatus() {
		return wbsActualStatus;
	}
	public void setWbsActualStatus(String wbsActualStatus) {
		this.wbsActualStatus = wbsActualStatus;
	}
	public int getWbsActualProgress() {
		return wbsActualProgress;
	}
	public void setWbsActualProgress(int wbsActualProgress) {
		this.wbsActualProgress = wbsActualProgress;
	}
	public String getWbsActualWriteDate() {
		return wbsActualWriteDate;
	}
	public void setWbsActualWriteDate(String wbsActualWriteDate) {
		if(wbsActualWriteDate==""){
			wbsActualWriteDate=null;
		}else{
			this.wbsActualWriteDate = wbsActualWriteDate;
		}
	}
	public String getWbsActualApprovalDate() {
		return wbsActualApprovalDate;
	}
	public void setWbsActualApprovalDate(String wbsActualApprovalDate) {
		if(wbsActualApprovalDate==""){
			wbsActualApprovalDate=null;
		}else{
			this.wbsActualApprovalDate = wbsActualApprovalDate;
		}
	}
	public String getWbsActualApprovalReason() {
		return wbsActualApprovalReason;
	}
	public void setWbsActualApprovalReason(String wbsActualApprovalReason) {
		this.wbsActualApprovalReason = wbsActualApprovalReason;
	}
	public String getWbsActualWriteManager() {
		return wbsActualWriteManager;
	}
	public void setWbsActualWriteManager(String wbsActualWriteManager) {
		this.wbsActualWriteManager = wbsActualWriteManager;
	}
	public String getWbsActualApprovalManager() {
		return wbsActualApprovalManager;
	}
	public void setWbsActualApprovalManager(String wbsActualApprovalManager) {
		this.wbsActualApprovalManager = wbsActualApprovalManager;
	}
	public int getWbsActualComCode() {
		return wbsActualComCode;
	}
	public void setWbsActualComCode(int wbsActualComCode) {
		this.wbsActualComCode = wbsActualComCode;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public String getMilestoneName() {
		return milestoneName;
	}
	public void setMilestoneName(String milestoneName) {
		this.milestoneName = milestoneName;
	}
	@Override
	public String toString() {
		return "WbsActual [wbsActualCode=" + wbsActualCode + ", wbsActualFdCode=" + wbsActualFdCode
				+ ", wbsActualMsCode=" + wbsActualMsCode + ", wbsPlanAcCode=" + wbsPlanAcCode + ", wbsActualName="
				+ wbsActualName + ", wbsActualStartDate=" + wbsActualStartDate + ", wbsActualEndDate="
				+ wbsActualEndDate + ", wbsActualDuration=" + wbsActualDuration + ", wbsActualStatus=" + wbsActualStatus
				+ ", wbsActualProgress=" + wbsActualProgress + ", wbsActualWriteDate=" + wbsActualWriteDate
				+ ", wbsActualApprovalDate=" + wbsActualApprovalDate + ", wbsActualApprovalReason="
				+ wbsActualApprovalReason + ", wbsActualWriteManager=" + wbsActualWriteManager
				+ ", wbsActualApprovalManager=" + wbsActualApprovalManager + ", wbsActualComCode=" + wbsActualComCode
				+ ", fdTitle=" + fdTitle + ", milestoneName=" + milestoneName + ", getWbsActualCode()="
				+ getWbsActualCode() + ", getWbsActualFdCode()=" + getWbsActualFdCode() + ", getWbsActualMsCode()="
				+ getWbsActualMsCode() + ", getWbsPlanAcCode()=" + getWbsPlanAcCode() + ", getWbsActualName()="
				+ getWbsActualName() + ", getWbsActualStartDate()=" + getWbsActualStartDate()
				+ ", getWbsActualEndDate()=" + getWbsActualEndDate() + ", getWbsActualDuration()="
				+ getWbsActualDuration() + ", getWbsActualStatus()=" + getWbsActualStatus()
				+ ", getWbsActualProgress()=" + getWbsActualProgress() + ", getWbsActualWriteDate()="
				+ getWbsActualWriteDate() + ", getWbsActualApprovalDate()=" + getWbsActualApprovalDate()
				+ ", getWbsActualApprovalReason()=" + getWbsActualApprovalReason() + ", getWbsActualWriteManager()="
				+ getWbsActualWriteManager() + ", getWbsActualApprovalManager()=" + getWbsActualApprovalManager()
				+ ", getWbsActualComCode()=" + getWbsActualComCode() + ", getFdTitle()=" + getFdTitle()
				+ ", getMilestoneName()=" + getMilestoneName() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
