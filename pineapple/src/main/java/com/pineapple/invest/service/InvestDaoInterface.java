package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndCompanyAndMileStone;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingDetail;
import com.pineapple.user.service.FundingAndCompany;

public interface InvestDaoInterface {
	//조건 검색으로 펀딩 리스트 조회 Dao
	List<InvestAndFd> investFundingChooseSelect(HashMap<String, String[]> map);
	//하나의 펀딩 data 불러오는 Dao
	InvestAndFdLikeAndFd investFundingDataSelect(HashMap<String, Object> map);
	//하나의 펀딩 Detail 불러오는 Dao
	FundingDetail investFundingDetailSelect(int fdCode);
	//하나의 펀딩에 투자예약하는 Dao
	int investmentinsert(Investment investment);
	//하나의 펀딩에 투자예약취소시 Data 요청 Dao
	Investment investmentDeleteData(HashMap<String, Object> map);
	//하나의 펀딩에 투자예약취소하는 Dao
	int investmentDelete(int investCode);
	//투자예약한 invest 결제하기 Data 조회 Dao
	InvestAndFundingAndMoney investmentFundingAndMoneyData(HashMap<String, Object> map);
	//투자예약한 invest 결제하기
	int moneyflowInsert(Moneyflow moneyflow);
	//펀딩 보고서 list
	List<FundingAndFdFile> fundingReportFilelistSelect(int fdCode);
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
	
	/////////PMS Dividend ////////////
	List<Funding> pmsDividendpaySelect(String id);
	/////////PMS Assignment //////////
	List<InvestAndFd> pmsAssignmentSelect();
	List<InvestAndFd> pmsAssignmentAddSelect(int numberOfRequests);
	FundingAndCompanyAndMileStone pmsAssignmentFundingData(int fdCode);
	//배정하기
	int pmsAssignmentInsert(Moneyflow moneyflow);
	//수수료받기
	int pmsFeesInsert(Moneyflow moneyflow);
	//환불대상 list 조회
	List<Investment> pmsRefundSelect(int fdCode,int numberOfRequests);
	//펀딩 상태 (모집실패 -> 환불완료)
	int pmsRefundFundingStatusUpdate(int fdCode);
	//펀딩의 투자한 목록 조회
	List<Moneyflow> pmsRefundidlistSelect(int fdCode);
	//펀딩투자한 목록 조회 토대로 환불입력
	int pmsRefundInsert(List<Moneyflow> investmentidlist);
	
	
	/////////MY Page Investor/////////
	//자신의 펀딩 Q&A 글 조회
	List<MyInvestorFundingQna> investorQnaSelect(String qnaFdId);
	//자신의 투자 list 조회
	List<InvestorInvestList> investorInvestListSelect(String id);
}