package com.pineapple.invest.service;

public class FundingQnaAndQnaReply {
	private int qnaFdCode;
	private int qnaReCode;
	private int reQnaCode;
	private String qnaReId;
	private String qnaReContent;
	private String qnaReTime;
	public int getQnaFdCode() {
		return qnaFdCode;
	}
	public void setQnaFdCode(int qnaFdCode) {
		this.qnaFdCode = qnaFdCode;
	}
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
		return "FundingQnaAndQnaReply [qnaFdCode=" + qnaFdCode + ", qnaReCode=" + qnaReCode + ", reQnaCode=" + reQnaCode
				+ ", qnaReId=" + qnaReId + ", qnaReContent=" + qnaReContent + ", qnaReTime=" + qnaReTime + "]";
	}
	
}
