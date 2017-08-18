package com.pineapple.invest.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pineapple.funding.service.FundingDetail;

@Service
public class InvestService implements InvestServiceInterface {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private InvestDaoInterface investdaointerface;
	
	//전체 펀딩 리스트 조회하기
	/* (non-Javadoc)
	 * @see com.pineapple.invest.service.InvestServiceInterface#getInvestFunding()
	 */
	@Override
	public List<InvestAndFd> getInvestFunding(){
		log.debug("------------------InvestService-----------------getinvestFunding()");
		List<InvestAndFd> fdlist =  investdaointerface.investFundingSelect();
		return fdlist;
	}
	//투자하기에서 펀딩클릭시 하나의 펀딩 정보 열람
	@Override
	public InvestAndFdLikeAndFd getInvestFundingone(int fdCode) {
		log.debug("------------------InvestService-----------------getInvestFundingone()");
		InvestAndFdLikeAndFd fdonedata = investdaointerface.investFundingDataSelect(fdCode);
		return fdonedata;
	}
	//투자하기에서 펀딩클릭시 하나의 펀딩에 대한 Detail 정보열람
	@Override
	public FundingDetail getInvestFundingDetail(int fdCode) {
		log.debug("------------------InvestService-----------------getInvestFundingDetail()");
		FundingDetail fdonedetail = investdaointerface.investFundingDetailSelect(fdCode);
		return fdonedetail;
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
		return investdaointerface.investFundingQnaInsert(fundingqna);
	}
	//투자하기에서 펀딩 클릭후 펀딩 Q&A에 대한 글 수정
	@Override
	public int modifyInvestFundingQna(int qnaCode) {
		log.debug("------------------InvestService-----------------modifyInvestFundingQna()");
		return investdaointerface.investFundingQnaUpdate(qnaCode);
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
		return investdaointerface.investFundingQnaReplyInsert(fundingqnareply);
	}
}
