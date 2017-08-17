package com.pineapple.invest.service;

import java.util.List;

import com.pineapple.funding.service.FundingDetail;

public interface InvestDaoInterface {
	//전체펀딩리스트 조회Dao
	List<InvestAndFd> investFundingSelect();
	//하나의 펀딩 data 불러오는 Dao
	InvestAndFdLikeAndFd investFundingDataSelect(int fdCode);
	//하나의 펀딩 Detail 불러오는 Dao
	FundingDetail investFundingDetailSelect(int fdCode);
	//하나의 펀딩의 Q&A 불러오는 Dao
	List<FundingQna> investFundingQnaSelect(int fdCode);
	//하나의 펀딩 Q&A의 댓글 불러오는 Dao
	List<FundingQnaReply> investFundingQnaReplySelect(int qnaReCode);
	
}