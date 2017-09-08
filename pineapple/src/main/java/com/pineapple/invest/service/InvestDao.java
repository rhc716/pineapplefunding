package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.funding.service.FundingDetail;


@Repository
public class InvestDao implements InvestDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	//조건 검색으로 펀딩 리스트 조회 Dao
	@Override
	public List<InvestAndFd> investFundingChooseSelect(HashMap<String, String[]> map) {
		log.debug("InvestDao-----investFundingChooseSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectInvestFundingListChoose",map);
	}
	//하나의 펀딩 정보 열람
	@Override
	public InvestAndFdLikeAndFd investFundingDataSelect(int fdCode){
		log.debug("InvestDao-----investFundingDataSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectInvestAndFdLikeAndFd",fdCode);
	}
	//하나의 펀딩 Detail 열람
	@Override
	public FundingDetail investFundingDetailSelect(int fdCode) {
		log.debug("InvestDao-----investFundingDetailSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectFundingDetail",fdCode);
	}
	//하나의 펀딩에서 투하예약하기
	public int investmentinsert(Investment investment){
		log.debug("InvestDao-----investinsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertInvestment",investment);
	}
	//하나의 펀딩 Q&A SELECT
	@Override
	public List<FundingQna> investFundingQnaSelect(int fdCode) {
		log.debug("InvestDao-----investFundingQnaSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectFundingQna",fdCode);
	}
	//하나의 펀딩 Q&A 댓글 SELECT
	@Override
	public List<FundingQnaReply> investFundingQnaReplySelect(int qnaCode) {
		log.debug("InvestDao-----investFundingQnaReplySelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectFundingQnaAndQnaReply",qnaCode);
	}
	//하나의 펀딩 Q&A 글 INSERT
	@Override
	public int investFundingQnaInsert(FundingQna fundingqna) {
		log.debug("InvestDao-----investFundingQnaInsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertFundingQna",fundingqna);
	}
	//하나의 펀딩 Q&A 글 UPDATE
	@Override
	public int investFundingQnaUpdate(FundingQna fundingqna) {
		log.debug("InvestDao-----investFundingQnaUpdate");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.updateFundingQna",fundingqna);
	}
	//하나의 펀딩 Q&A 글 DELETE
	@Override
	public int investFundingQnaDelete(int qnaCode) {
		log.debug("InvestDao-----investFindingQnaDelete");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.deleteFundingQna",qnaCode);
	}
	//하나의 펀딩 Q&A 글 DELETE시 댓글도 같이 DELETE
	@Override
	public int investFundingQnaAllReplyDelete(int qnaCode) {
		log.debug("InvestDao-----investFundingQnaAllReplyDelete");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.deleteFundingQnaAllReply",qnaCode);
	}
	//하나의 펀딩 Q&A 댓글 INSERT
	@Override
	public int investFundingQnaReplyInsert(FundingQnaReply fundingqnareply) {
		log.debug("InvestDao-----investFundingQnaInsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertFundingQnaReply",fundingqnareply);
	}
	//하나의 펀딩 Q&A 댓글 UPDATE
	@Override
	public int investFundingQnaReplyUpdate(FundingQnaReply fundingqnareply) {
		log.debug("InvestDao-----investFundingQnaReplyUpdate");
		return sqlSessionTemplate.update("com.pineapple.invest.service.InvestMapper.updateFundingQnaReply", fundingqnareply);
	}
	//하나의 펀딩 Q&A 댓글 DELETE
	@Override
	public int investFundingQnaReplyDelete(int qnaReCode) {
		log.debug("InvestDao-----investFundingQnaReplyDelete");
		return sqlSessionTemplate.delete("com.pineapple.invest.service.InvestMapper.deleteFundingQnaReply", qnaReCode);
	}
	
	
	
	
	///////////////////////////////My Page Investor/////////////////////
	//자신의 펀딩 Q&A 글 조회
	@Override
	public List<MyInvestorFundingQna> investorQnaSelect(String qnaFdId){
		log.debug("InvestDao-----investorQnaSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectMypageFundingQna", qnaFdId);
	}
	//자신의 투자 list 조회
	@Override
	public List<InvestorInvestList> investorInvestListSelect(String id) {
		log.debug("InvestDao-----investorQnaSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectMpageinvestment", id);
	}
}



