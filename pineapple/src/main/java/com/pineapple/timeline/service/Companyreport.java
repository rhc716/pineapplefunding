package com.pineapple.timeline.service;

public class Companyreport {
	private int reportCode;
	private int fdCode;
	private String reportSendId;
	private String reportReceiveId;
	private int reportCheck;
	private String reportTitle;
	private String reportContent;
	private String reportTime;
	private String reportFileExtension;
	private String reportServerFileName;
	private int reportFileSize;
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}
	public int getFdCode() {
		return fdCode;
	}
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	public String getReportSendId() {
		return reportSendId;
	}
	public void setReportSendId(String reportSendId) {
		this.reportSendId = reportSendId;
	}
	public String getReportReceiveId() {
		return reportReceiveId;
	}
	public void setReportReceiveId(String reportReceiveId) {
		this.reportReceiveId = reportReceiveId;
	}
	public int getReportCheck() {
		return reportCheck;
	}
	public void setReportCheck(int reportCheck) {
		this.reportCheck = reportCheck;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public String getReportFileExtension() {
		return reportFileExtension;
	}
	public void setReportFileExtension(String reportFileExtension) {
		this.reportFileExtension = reportFileExtension;
	}
	public String getReportServerFileName() {
		return reportServerFileName;
	}
	public void setReportServerFileName(String reportServerFileName) {
		this.reportServerFileName = reportServerFileName;
	}
	public int getReportFileSize() {
		return reportFileSize;
	}
	public void setReportFileSize(int reportFileSize) {
		this.reportFileSize = reportFileSize;
	}
	@Override
	public String toString() {
		return "Companyreport [reportCode=" + reportCode + ", fdCode=" + fdCode + ", reportSendId=" + reportSendId
				+ ", reportReceiveId=" + reportReceiveId + ", reportCheck=" + reportCheck + ", reportTitle="
				+ reportTitle + ", reportContent=" + reportContent + ", reportTime=" + reportTime
				+ ", reportFileExtension=" + reportFileExtension + ", reportServerFileName=" + reportServerFileName
				+ ", reportFileSize=" + reportFileSize + "]";
	}
	
}
