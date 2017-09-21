package com.pineapple.invest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndCompanyAndMileStone;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingDetail;
import com.pineapple.user.service.FundingAndCompany;


@Repository
public class InvestDao implements InvestDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	//조건 검색으로 펀딩 리스트 조회 Dao
	@Override
	public List<InvestAndFd> investFundingChooseSelect(HashMap<String, Object> map) {
		log.debug("InvestDao-----investFundingChooseSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectInvestFundingListChoose",map);
	}
	//하나의 펀딩 정보 열람
	@Override
	public InvestAndFdLikeAndFd investFundingDataSelect(HashMap<String, Object> map){
		log.debug("InvestDao-----investFundingDataSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectInvestAndFdLikeAndFd",map);
	}
	//하나의 펀딩 Detail 열람
	@Override
	public FundingDetail investFundingDetailSelect(int fdCode) {
		log.debug("InvestDao-----investFundingDetailSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectFundingDetail",fdCode);
	}
	//하나의 펀딩에서 투자예약하기
	public int investmentinsert(Investment investment){
		log.debug("InvestDao-----investinsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertInvestment",investment);
	}
	//하나의 펀딩에서 투자취소하기시 Data 요청
	@Override
	public Investment investmentDeleteData(HashMap<String, Object> map) {
		log.debug("InvestDao-----investmentDeleteData");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectInvestmentDeleteData",map);
	}
	//하나의 펀딩에서 투자 취소하기
	@Override 
	public int investmentDelete(int investCode) {
		log.debug("InvestDao-----investmentDeleteData");
		return sqlSessionTemplate.delete("com.pineapple.invest.service.InvestMapper.deleteinvestment",investCode);
	}
	//하나의 펀딩에서 투자예약후 결제하기 클릭시 Data 요청
	@Override
	public InvestAndFundingAndMoney investmentFundingAndMoneyData(HashMap<String, Object> map) {
		log.debug("InvestDao-----investmentFundingAndMoneyData");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectMyinvestData",map);
	}
	//하나의 펀딩에서 투자예약후 결제하기  insertMoneyflow
	@Override
	public int moneyflowInsert(Moneyflow moneyflow) {
		log.debug("InvestDao-----moneyflowInsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertMoneyflow",moneyflow);
	}
	//하나의 펀딩에서 투자예약후 결제할때 invest 업데이트
	@Override
	public int moneyflowInvestUpdate(int mfInvestCode) {
		log.debug("InvestDao-----moneyflowInsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.updateinvestpay",mfInvestCode);
	}
	//펀딩 보고서 list
	@Override
	public List<FundingAndFdFile> fundingReportFilelistSelect(int fdCode) {
		log.debug("InvestDao-----fundingReportFilelistSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectFundingReportList",fdCode);
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
	
	
	/////////PMS Dividend ////////////
	@Override
	public List<Funding> pmsDividendpaySelect(String id) {
		log.debug("InvestDao-----pmsDividendpaySelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectPMSDividendpay", id);
	}
	/////////PMS Assignment //////////
	@Override
	public List<InvestAndFd> pmsAssignmentSelect() {
		log.debug("InvestDao-----pmsAssignmentSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectsendAssignmentlist");
	}
	@Override
	public List<InvestAndFd> pmsAssignmentAddSelect(int numberOfRequests) {
		log.debug("InvestDao-----pmsAssignmentAddSelect");
		numberOfRequests = numberOfRequests*10;
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectsendAssignmentlist",numberOfRequests);
	}
	@Override  
	public FundingAndCompanyAndMileStone pmsAssignmentFundingData(int fdCode) {
		log.debug("InvestDao-----pmsAssignmentFundingData");
		return sqlSessionTemplate.selectOne("com.pineapple.invest.service.InvestMapper.selectFundingAndCompanyData",fdCode);
	}
	//배정하기
	@Override
	public int pmsAssignmentInsert(Moneyflow moneyflow) {
		log.debug("InvestDao-----pmsAssignmentInsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertAssignment",moneyflow);
	}
	//수수료 받기
	@Override
	public int pmsFeesInsert(Moneyflow moneyflow) {
		log.debug("InvestDao-----pmsFeesInsert");
		return sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertFees",moneyflow);
	}
	//환불대상 조회
	@Override
	public List<Investment> pmsRefundSelect(int fdCode, int numberOfRequests) {
		log.debug("InvestDao-----pmsRefundSelect");
		HashMap<String, Number> map = new HashMap<>();
		// numberOfRequests가 입력됐을때 즉 더보기 버튼을 눌렀을때는 0이 아닐때 이므로 그때에만 map에 저장해줌. 
		if(numberOfRequests==0){
			map.put("fdCode", fdCode);
		}else{
			map.put("fdCode", fdCode);
			// 5를 곱해서 넣어줘야 limit의 시작점인 페이징x불러온 투자자수가 됨.
			numberOfRequests=numberOfRequests*10; 
			map.put("numberOfRequests", numberOfRequests);
		}
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectInvestmentRefundList",map);
	}
	//펀딩의 투자한 목록 조회
	@Override
	public List<Moneyflow> pmsRefundidlistSelect(int fdCode) {
		log.debug("InvestDao-----pmsRefundidlistSelect");
		return sqlSessionTemplate.selectList("com.pineapple.invest.service.InvestMapper.selectFundingRefundInvestorList",fdCode);
	}
	//펀딩투자한 목록 조회 토대로 환불입력
	@Override
	public int pmsRefundInsert(List<Moneyflow> investmentidlist) {
		log.debug("InvestDao-----pmsRefundInsert");
		int suss = 0;
		for(int i = 0 ; i < investmentidlist.size(); i ++){
		int susscheck = sqlSessionTemplate.insert("com.pineapple.invest.service.InvestMapper.insertInvestorRefund",investmentidlist.get(i));
		suss += susscheck;
		}
		return suss;
	}
	//펀딩투자한 목록 조회 토대로 입금내역 삭제
	@Override
	public int pmsInvestInsert(List<Moneyflow> investmentidlist) {
		log.debug("InvestDao-----pmsInvestInsert");
		int suss = 0;
		for(int i = 0 ; i < investmentidlist.size(); i ++){
		int susscheck = sqlSessionTemplate.delete("com.pineapple.invest.service.InvestMapper.deleteInvestorInvest",investmentidlist.get(i));
		suss += susscheck;
		}
		return suss;
	}
	//펀딩투자한 목록 조회 토대로 투자내역 삭제
	@Override
	public int pmsInvestInsertlist(List<Moneyflow> investmentidlist) {
		log.debug("InvestDao-----pmsInvestInsert");
		int suss = 0;
		for(int i = 0 ; i < investmentidlist.size(); i ++){
		int susscheck = sqlSessionTemplate.delete("com.pineapple.invest.service.InvestMapper.deleteInvestorInvestlist",investmentidlist.get(i));
		suss += susscheck;
		}
		return suss;
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



