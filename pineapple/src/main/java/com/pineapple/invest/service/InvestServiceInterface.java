package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingDetail;
@Transactional
public interface InvestServiceInterface {
	//조건 검색으로 펀딩 리스트 조회 Service
	List<InvestAndFd> getInvestFundingChoose(HashMap<String, String[]> map);
	//하나의 펀딩 Data 불러오는 Service(투자하기 list 에서 펀딩클릭시)
	InvestAndFdLikeAndFd getInvestFundingone(HashMap<String, Object> map);
	//하나의 펀딩 Detail 불러오는 Service
	FundingDetail getInvestFundingDetail(int fdCode);
	//하나의 펀딩에 투자 예약하는 Service
	int addInvestment(Investment investment);
	//하나의 펀딩에 투자 취소시 Data 요청하는 Service
	Investment getInvestmentModifyData(HashMap<String, Object> map);
	//하나의 펀딩에 투자 취소하는 Service
	int removeInvestment(int investCode);
	//하나의 펀딩에 결제하기 클릭시 Data 요청 Service
	InvestAndFundingAndMoney getinvestmentFundingAndMoney(HashMap<String, Object> map);
	//하나의 펀딩에 결제하기
	int addMoneyflow(Moneyflow moneyflow);
	//펀딩 보고서 list
	List<FundingAndFdFile> getFundingReportyList(int fdCode);
	//하나의 펀딩 Q&A 불러오는 Service
	List<FundingQna> getInvestFundingQna(int fdCode);
	//하나의 펀딩 Q&A 댓글 불러오는 Service
	List<FundingQnaReply> getInvestFundingQnaReply(int qnaCode);
	//하나의 펀딩 Q&A 글 입력하는 Service
	int addInvestFundingQna(FundingQna fundingqna);
	//하나의 펀딩 Q&A 글 수정하는 Service
	int modifyInvestFundingQna(FundingQna fundingqna);
	//하나의 펀딩 Q&A 글 삭제하는 Service
	int removeInvestFundingQna(int qnaCode);
	//하나의 펀딩 Q&A 댓글 입력하는 Service
	int addInvestFundingQnaReply(FundingQnaReply fundingqnareply);
	//하나의 펀딩 Q&A 댓글 수정하는 Service
	int modifyInvestFundingQnaReply(FundingQnaReply fundingqnareply);
	//하나의 펀딩 Q&A 댓글 삭제하는 Service
	int removeInvestFundingQnaReply(int qnaReCode);
	
	
	/////////PMS Dividend ////////////
	List<Funding> getPMSDividendpay(String id);
	/////////PMS Assignment //////////
	List<InvestAndFd> getPMSAssignmentlist();
	List<InvestAndFd> getPMSAssignmentlistAdd(int numberOfRequests);
	
	
	
	////////MY Page Investor////////////
	//자신의 펀딩 Q&A 글 조회
	List<MyInvestorFundingQna> getInvestorQna(String qnaFdId);
	//자신의 펀딩 Q&A 댓글 조회
	List<FundingQnaReply> getInvestorQnaReply(int qnaCode);
	//자신의 투자 list 조회
	List<InvestorInvestList> getInvestorInvestMentList(String id);
	
}