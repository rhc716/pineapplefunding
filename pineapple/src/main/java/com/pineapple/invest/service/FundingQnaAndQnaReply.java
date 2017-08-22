package com.pineapple.invest.service;

import java.util.List;

public class FundingQnaAndQnaReply {
	private int qnaFdCode;
	private List<FundingQnaReply> fundingQnaReply;
	public List<FundingQnaReply> getFundingQnaReply() {
		return fundingQnaReply;
	}
	public void setFundingQnaReply(List<FundingQnaReply> fundingQnaReply) {
		this.fundingQnaReply = fundingQnaReply;
	}
	public int getQnaFdCode() {
		return qnaFdCode;
	}
	public void setQnaFdCode(int qnaFdCode) {
		this.qnaFdCode = qnaFdCode;
	}
	@Override
	public String toString() {
		return "FundingQnaAndQnaReply [qnaFdCode=" + qnaFdCode + "]";
	}
	
}
