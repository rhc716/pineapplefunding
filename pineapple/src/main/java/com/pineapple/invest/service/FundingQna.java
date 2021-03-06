package com.pineapple.invest.service;

public class FundingQna {
	private int qnaCode;
	private String qnaFdId;
	private int qnaFdCode;
	private String qnaFdTitle;
	private String qnaFdContent;
	private String qnaFdTime;
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getQnaFdId() {
		return qnaFdId;
	}
	public void setQnaFdId(String qnaFdId) {
		this.qnaFdId = qnaFdId;
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
	@Override
	public String toString() {
		return "FundingQna [qnaCode=" + qnaCode + ", qnaFdId=" + qnaFdId + ", qnaFdCode=" + qnaFdCode + ", qnaFdTitle="
				+ qnaFdTitle + ", qnaFdContent=" + qnaFdContent + ", qnaFdTime=" + qnaFdTime + "]";
	}

}
