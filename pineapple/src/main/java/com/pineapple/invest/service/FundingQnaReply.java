package com.pineapple.invest.service;

public class FundingQnaReply {
	private int qnaReCode;
	private int reQnaCode;
	private String qnaReId;
	private String qnaReContent;
	private String qnaReTime;
	public int getQnaReCode() {
		return qnaReCode;
	}
	public void setQnaReCode(int qnaReCode) {
		this.qnaReCode = qnaReCode;
	}
	public int getReQnaCode() {
		return reQnaCode;
	}
	public void setReQnaCode(int reQnaCode) {
		this.reQnaCode = reQnaCode;
	}
	public String getQnaReId() {
		return qnaReId;
	}
	public void setQnaReId(String qnaReId) {
		this.qnaReId = qnaReId;
	}
	public String getQnaReContent() {
		return qnaReContent;
	}
	public void setQnaReContent(String qnaReContent) {
		this.qnaReContent = qnaReContent;
	}
	public String getQnaReTime() {
		return qnaReTime;
	}
	public void setQnaReTime(String qnaReTime) {
		this.qnaReTime = qnaReTime;
	}
	@Override
	public String toString() {
		return "FundingQnaReply [qnaReCode=" + qnaReCode + ", reQnaCode=" + reQnaCode + ", qnaReId=" + qnaReId
				+ ", qnaReContent=" + qnaReContent + ", qnaReTime=" + qnaReTime + "]";
	}
	
}
