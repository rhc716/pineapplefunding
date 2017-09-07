package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;

import com.pineapple.funding.service.FundingDetail;

public interface InvestDaoInterface {
	//전체펀딩리스트 조회Dao
	List<InvestAndFd> investFundingSelect();
	//조건 검색으로 펀딩 리스트 조회 Dao
	List<InvestAndFd> investFundingChooseSelect(HashMap<String, String[]> map);
	//하나의 펀딩 data 불러오는 Dao
	InvestAndFdLikeAndFd investFundingDataSelect(int fdCode);
	//하나의 펀딩 Detail 불러오는 Dao
	FundingDetail investFundingDetailSelect(int fdCode);
	//하나의 펀딩에 투자예약하는 Dao
	int investmentinsert(Investment investment);
	//하나의 펀딩의 Q&A 불러오는 Dao
	List<FundingQna> investFundingQnaSelect(int fdCode);
	//하나의 펀딩 Q&A의 댓글 불러오는 Dao
	List<FundingQnaReply> investFundingQnaReplySelect(int qnaCode);
	//하나의 펀딩의 Q&A의 글 입력 Dao
	int investFundingQnaInsert(FundingQna fundingqna);
	//하나의 펀딩의 Q&A의 글 수정 Dao
	int investFundingQnaUpdate(FundingQna fundingqna);
	//하나의 펀딩의 Q&A의 글 삭제 Dao
	int investFundingQnaDelete(int qnaCode);
	//하나의 펀딩의 Q&A의 글 삭제시 댓글 같이 삭제 Dao
	int investFundingQnaAllReplyDelete(int qnaCode);
	//하나의 펀딩의 Q&A의 댓글 입력 Dao
	int investFundingQnaReplyInsert(FundingQnaReply fundingqnareply);	
	//하나의 펀딩의 Q&A의 댓글 수정 Dao
	int investFundingQnaReplyUpdate(FundingQnaReply fundingqnareply);
	//하나의 펀딩의 Q&A의 댓글 삭제 Dao
	int investFundingQnaReplyDelete(int qnaReCode);
	
	
	/////////MY Page Investor/////////
	//자신의 펀딩 Q&A 글 조회
	List<MyInvestorFundingQna> investorQnaSelect(String qnaFdId);
}