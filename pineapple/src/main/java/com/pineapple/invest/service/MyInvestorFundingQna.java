package com.pineapple.invest.service;

public class MyInvestorFundingQna {
	private int qnaCode;
	private int qnaFdCode;
	private String qnaFdTitle;
	private String qnaFdContent;
	private String qnaFdTime;
	private String comName;
	private String fdTitle;
	private String fdType;
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public int getQnaFdCode() {
		return qnaFdCode;
	}
	public void setQnaFdCode(int qnaFdCode) {
		this.qnaFdCode = qnaFdCode;
	}
	public String getQnaFdTitle() {
		return qnaFdTitle;
	}
	public void setQnaFdTitle(String qnaFdTitle) {
		this.qnaFdTitle = qnaFdTitle;
	}
	public String getQnaFdContent() {
		return qnaFdContent;
	}
	public void setQnaFdContent(String qnaFdContent) {
		this.qnaFdContent = qnaFdContent;
	}
	public String getQnaFdTime() {
		return qnaFdTime;
	}
	public void setQnaFdTime(String qnaFdTime) {
		this.qnaFdTime = qnaFdTime;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getFdTitle() {
		return fdTitle;
	}
	public void setFdTitle(String fdTitle) {
		this.fdTitle = fdTitle;
	}
	public String getFdType() {
		return fdType;
	}
	public void setFdType(String fdType) {
		this.fdType = fdType;
	}
	@Override
	public String toString() {
		return "MyInvestorFundingQna [qnaCode=" + qnaCode + ", qnaFdCode=" + qnaFdCode + ", qnaFdTitle=" + qnaFdTitle
				+ ", qnaFdContent=" + qnaFdContent + ", qnaFdTime=" + qnaFdTime + ", comName=" + comName + ", fdTitle="
				+ fdTitle + ", fdType=" + fdType + "]";
	}
	
}
