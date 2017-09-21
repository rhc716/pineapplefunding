package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndCompanyAndMileStone;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingDetail;

@Service
public class InvestService implements InvestServiceInterface {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private InvestDaoInterface investdaointerface;
	
	//조건 검색으로 펀딩 리스트 조회 Service
	@Override
	public List<InvestAndFd> getInvestFundingChoose(HashMap<String, Object> map) {
		log.debug("------------------InvestService-----------------getInvestFundingChoose()");
		List<InvestAndFd> fdchooselist =  investdaointerface.investFundingChooseSelect(map);
		return fdchooselist;
	}
	//투자하기에서 펀딩클릭시 하나의 펀딩 정보 열람
	@Override
	public InvestAndFdLikeAndFd getInvestFundingone(HashMap<String, Object> map) {
		log.debug("------------------InvestService-----------------getInvestFundingone()");
		InvestAndFdLikeAndFd fdonedata = investdaointerface.investFundingDataSelect(map);
		return fdonedata;
	}
	//투자하기에서 펀딩클릭시 하나의 펀딩에 대한 Detail 정보열람
	@Override
	public FundingDetail getInvestFundingDetail(int fdCode) {
		log.debug("------------------InvestService-----------------getInvestFundingDetail()");
		FundingDetail fdonedetail = investdaointerface.investFundingDetailSelect(fdCode);
		return fdonedetail;
	}
	//투자하기에서 펀딩클릭후 투자예약하기
	public int addInvestment(Investment investment){
		log.debug("------------------InvestService-----------------getInvestFundingDetail()");
		int addinvestment = investdaointerface.investmentinsert(investment);
		return addinvestment;
	}
	//투자하기에서 펀딩클릭후 투자예약 취소하기 시 Data 요청
	@Override
	public Investment getInvestmentModifyData(HashMap<String, Object> map) {
		log.debug("------------------InvestService-----------------getInvestmentModifyData()");
		Investment getinvestmentmodifydata = investdaointerface.investmentDeleteData(map);
		return getinvestmentmodifydata;
	}
	//투자하기에서 펀딩클릭후 투자예약 취소하기
	@Override 
	public int removeInvestment(int investCode) {
		log.debug("------------------InvestService-----------------removeInvestment()");
		int getinvestmentdelete = investdaointerface.investmentDelete(investCode);
		return getinvestmentdelete;
	}
	//결제하기에서 클릭후 Data 요청
	@Override
	public InvestAndFundingAndMoney getinvestmentFundingAndMoney(HashMap<String, Object> map) {
		log.debug("------------------InvestService-----------------getinvestmentFundingAndMoney()");
		InvestAndFundingAndMoney getinvestmentFundingAndMoney = investdaointerface.investmentFundingAndMoneyData(map);
		return getinvestmentFundingAndMoney;
	}
	//결제하기
	@Override
	public int addMoneyflow(Moneyflow moneyflow) {
		log.debug("------------------InvestService-----------------addMoneyflow()");
		int addMoneyflow = investdaointerface.moneyflowInsert(moneyflow);
		int updateinvestorpay = investdaointerface.moneyflowInvestUpdate(moneyflow.getMfInvestCode());
		return addMoneyflow+updateinvestorpay;
	}
	//펀딩 보고서 list
	@Override
	public List<FundingAndFdFile> getFundingReportyList(int fdCode) {
		log.debug("------------------InvestService-----------------getFundingReportyList()");
		List<FundingAndFdFile> getfundingreportylist = investdaointerface.fundingReportFilelistSelect(fdCode);
		return getfundingreportylist;
	}
	//투자하기에서 펀딩클릭후 펀딩Q&A클릭시 펀딩 Q&A조회
	@Override
	public List<FundingQna> getInvestFundingQna(int fdCode) {
		log.debug("------------------InvestService-----------------getInvestFundingQna()");
		List<FundingQna> fdlistqna = investdaointerface.investFundingQnaSelect(fdCode);
		return fdlistqna;
	}
	//투자하기에서 펀딩클릭후 펀딩Q&A에 대한 답글 조회
	@Override
	public List<FundingQnaReply> getInvestFundingQnaReply(int qnaCode) {
		log.debug("------------------InvestService-----------------getInvestFundingQnaReply()");
		List<FundingQnaReply> fdlistqnareply = investdaointerface.investFundingQnaReplySelect(qnaCode);
		return fdlistqnareply;
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 글 입력
	@Override
	public int addInvestFundingQna(FundingQna fundingqna) {
		log.debug("------------------InvestService-----------------addInvestFundingQna()");
		int addinvestfundingqna = investdaointerface.investFundingQnaInsert(fundingqna);
		return addinvestfundingqna;
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 글 수정
	@Override
	public int modifyInvestFundingQna(FundingQna fundingqna) {
		log.debug("------------------InvestService-----------------modifyInvestFundingQna()");
		int modifyinvestfundingqna = investdaointerface.investFundingQnaUpdate(fundingqna);
		return modifyinvestfundingqna;
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 글 삭제
	@Override
	public int removeInvestFundingQna(int qnaCode) {
		log.debug("------------------InvestService-----------------removeInvestFundingQna()");
		int fundingqnadelete = investdaointerface.investFundingQnaDelete(qnaCode);
		int fundingqnaalldelete = investdaointerface.investFundingQnaAllReplyDelete(qnaCode);
		return fundingqnadelete+fundingqnaalldelete;
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 댓글 입력
	@Override
	public int addInvestFundingQnaReply(FundingQnaReply fundingqnareply) {
		log.debug("------------------InvestService-----------------addInvestFundingQna()");
		int addinvestfundingqnareply = investdaointerface.investFundingQnaReplyInsert(fundingqnareply);
		return addinvestfundingqnareply;
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 댓글 수정
	@Override
	public int modifyInvestFundingQnaReply(FundingQnaReply fundingqnareply) {
		log.debug("------------------InvestService-----------------modifyInvestFundingQnaReply()");
		int modifyinvestfundingqnareply = investdaointerface.investFundingQnaReplyUpdate(fundingqnareply);
		return modifyinvestfundingqnareply;
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 댓글 삭제
	@Override
	public int removeInvestFundingQnaReply(int qnaReCode) {
		log.debug("------------------InvestService-----------------removeInvestFundingQnaReply()");
		int removeinvestfundingqnareply = investdaointerface.investFundingQnaReplyDelete(qnaReCode);
		return removeinvestfundingqnareply;
	}
	
	
	
	/////////PMS Dividend ////////////
	@Override
	public List<Funding> getPMSDividendpay(String id) {
		log.debug("------------------InvestService-----------------getPMSDividendpay()");
		List<Funding> getPMSDividendpay = investdaointerface.pmsDividendpaySelect(id);
		return getPMSDividendpay;
	}
	/////////PMS Assignment //////////
	//배당 list 요청
	@Override
	public List<InvestAndFd> getPMSAssignmentlist() {
		log.debug("------------------InvestService-----------------getPMSAssignmentlist()");
		List<InvestAndFd> getPMSAssignmentlist = investdaointerface.pmsAssignmentSelect();
		return getPMSAssignmentlist;
	}
	//배당 list 추가 요청
	@Override
	public List<InvestAndFd> getPMSAssignmentlistAdd(int numberOfRequests) {
		log.debug("------------------InvestService-----------------getPMSAssignmentlistAdd()");
		List<InvestAndFd> getPMSAssignmentlistAdd = investdaointerface.pmsAssignmentAddSelect(numberOfRequests);
		return getPMSAssignmentlistAdd;
	}
	//배당 Funding 정보 조회
	@Override
	public FundingAndCompanyAndMileStone getPMSAssignmentFundingData(int fdCode) {
		log.debug("------------------InvestService-----------------getPMSAssignmentFundingData()");
		FundingAndCompanyAndMileStone getPMSAssignmentFundingData = investdaointerface.pmsAssignmentFundingData(fdCode);
		return getPMSAssignmentFundingData;
	}
	//배정하기
	@Override
	public int addPMSAssignment(Moneyflow moneyflow) {
		log.debug("------------------InvestService-----------------addPMSAssignment()");
		int addPMSAssignment = investdaointerface.pmsAssignmentInsert(moneyflow);
		moneyflow.setMfAmount((moneyflow.getMfAmount()*5)/100);
		moneyflow.setMfCategory(4);
		int addFees = investdaointerface.pmsFeesInsert(moneyflow);
		return addPMSAssignment+addFees;
	}
	//환불대상 조회
	@Override
	public List<Investment> getPMSRefundlist(int fdCode,int numberOfRequests) {
		log.debug("------------------InvestService-----------------getPMSRefundlist()");
		List<Investment> getPMSRefundlist = investdaointerface.pmsRefundSelect(fdCode,numberOfRequests);
		return getPMSRefundlist;
	}
	//환불 대상사람들 한번에 환불
	@Override
	public int addrefund(int fdCode) {
		log.debug("------------------InvestService-----------------addrefund()");
		//펀딩의 투자한 목록 조회
		List<Moneyflow> getPMSRefundlist = investdaointerface.pmsRefundidlistSelect(fdCode);
		//펀딩투자한 목록 조회 토대로 환불입력
		int pmsRefundInsert = investdaointerface.pmsRefundInsert(getPMSRefundlist);
		//펀딩투자한 목록 조회 토대로 입금내역 삭제
		int pmsInvestInsert = investdaointerface.pmsInvestInsert(getPMSRefundlist);
		//펀딩투자한 목록 조회 토대로 투자내역 삭제
		int pmsInvestInsertlist = investdaointerface.pmsInvestInsertlist(getPMSRefundlist);
		return pmsRefundInsert+pmsInvestInsert+pmsInvestInsertlist;
	}
	
	
	////////////MY Page Investor///////////
	//자신의 펀딩 Q&A 글 조회
	@Override
	public List<MyInvestorFundingQna> getInvestorQna(String qnaFdId) {
		log.debug("------------------InvestService-----------------removeInvestFundingQnaReply()");
		List<MyInvestorFundingQna> getInvestorQnalist = investdaointerface.investorQnaSelect(qnaFdId);
		return getInvestorQnalist;
	}
	//자신의 펀딩 Q&A 댓글 조회
	@Override
	public List<FundingQnaReply> getInvestorQnaReply(int qnaCode) {
		log.debug("------------------InvestService-----------------getInvestFundingQnaReply()");
		List<FundingQnaReply> fdlistqnareply = investdaointerface.investFundingQnaReplySelect(qnaCode);
		return fdlistqnareply;
	}
	//자신의 투자 list 조회
	@Override
	public List<InvestorInvestList> getInvestorInvestMentList(String id) {
		log.debug("------------------InvestService-----------------getInvestorInvestMentList()");
		List<InvestorInvestList> investorinvestment = investdaointerface.investorInvestListSelect(id);
		return investorinvestment;
	}
}
