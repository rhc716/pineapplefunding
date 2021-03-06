package com.pineapple.invest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndCompanyAndMileStone;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingDetail;
import com.pineapple.invest.service.FundingQna;
import com.pineapple.invest.service.FundingQnaReply;
import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.InvestAndFdLikeAndFd;
import com.pineapple.invest.service.InvestAndFundingAndMoney;
import com.pineapple.invest.service.InvestServiceInterface;
import com.pineapple.invest.service.Investment;
import com.pineapple.invest.service.InvestorInvestList;
import com.pineapple.invest.service.MyInvestorFundingQna;
import com.pineapple.invest.service.Moneyflow;

@Controller
public class InvestController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private InvestServiceInterface investserviceinterface;
	//투자하기 페이지 요청 investmain.jsp
	@RequestMapping(value="/investmain.invest" , method=RequestMethod.GET)
	public String investMain(Locale locale, Model model){
		log.debug("<----- InvestController[investMain호출]----->");
		return "invest/investmain";
	}
	//펀딩리스트 조건 검색
	@RequestMapping(value="/investfdchoosemain.invest" , method=RequestMethod.GET)
	public String investFdChooseMain(Locale locale, Model model,HttpServletRequest request,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- InvestController[investFdTitleMain호출]----->");
		log.debug(numberOfRequests+"<-----[numberOfRequests]");
		String[] fundingtitlename = request.getParameterValues("fundingtitlename");
		String[] fdarea = request.getParameterValues("fdarea");
		String[] fdtype = request.getParameterValues("fdtype");
		String[] fddividend = request.getParameterValues("fddividend");
		String[] fdstatus = request.getParameterValues("fdstatus");
		HashMap<String, Object> map = new HashMap<>();
		map.put("fundingtitlename", fundingtitlename);
		map.put("fdarea", fdarea);
		map.put("fdtype", fdtype);
		map.put("fddividend", fddividend);
		map.put("fdstatus", fdstatus);
		map.put("numberOfRequests", numberOfRequests);
		map.put("numberOfRequests2", numberOfRequests+1);
		List<InvestAndFd> fundingListChoose = investserviceinterface.getInvestFundingChoose(map);
		model.addAttribute("fundingListChoose", fundingListChoose);
		log.debug(fundingListChoose+"<-----InvestController[fundingListChoose 값 출력]");
		return "invest/investfdchoosemain";
	}
	//투자하기 페이지에서 펀딩페이지 오픈 investfunding.jsp
	@RequestMapping(value="/investfunding.invest",method=RequestMethod.GET)
	public String investFunding(Locale locale, Model model,@RequestParam(value="fdCode") int fdCode,HttpSession session){
		log.debug("<-----InvestController[investFunding호출]----->");
		log.debug(fdCode+"<-----InvestController[fdCode 값 출력]");
		log.debug(session+"<-----InvestController[session 값 출력]");
		String idcheck = "";
		if(session.getAttribute("id") != null){
			idcheck = session.getAttribute("id").toString();
		}
		log.debug(idcheck+"<-----InvestController[id 값 출력]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fdCode", fdCode);
		map.put("id", idcheck);
		InvestAndFdLikeAndFd fundingData = investserviceinterface.getInvestFundingone(map);
		model.addAttribute("fundingData", fundingData);
		log.debug(fundingData+"<-----InvestController[fundingData 값 출력]");
		return "invest/investfunding";
	}
	//투자하기 페이지에서 투자예약하기
	@RequestMapping(value="/investmentinsert.invest",method=RequestMethod.POST)
	public String investmentAdd(Locale locale,Model model,Investment investment){
		log.debug("<-----InvestController[investAdd호출]----->");
		log.debug(investment+"<-----InvestController[investment 값 출력]");
		int investmentadd = investserviceinterface.addInvestment(investment);
		model.addAttribute("fdCode",investment.getInvestFdCode());
		log.debug(investmentadd+"<-----InvestController[investmentadd 값 출력]");
		return "redirect:/investfunding.invest";
	}
	//투자하기 페이지에서 투자 예약 취소 클릭시 Data 요청 
	@RequestMapping(value="/investdeletedata.invest",method=RequestMethod.GET)
	public String investmentRemoveData(Locale locale,Model model,HttpSession session,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investmentRemoveData호출]----->");
		log.debug(session.getAttribute("id").toString()+"<-----InvestController[id 값 출력]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fdCode", fdCode);
		map.put("id", session.getAttribute("id").toString());
		Investment investmentdeletedata = investserviceinterface.getInvestmentModifyData(map);
		model.addAttribute("investmentdeletedata",investmentdeletedata);
		log.debug(investmentdeletedata+"<-----InvestController[investmentdeletedata 값 출력]");
		return "invest/investajax/investmentdeletedata";
	}
	//투자하기 페이지에서 투자 예약 취소
	@RequestMapping(value="/investmentdelete.invest",method=RequestMethod.POST)
	public String investmentRemove(Locale locale,Model model,@RequestParam(value="investCode") int investCode,@RequestParam(value="investfdCode")int investfdCode){
		log.debug("<-----InvestController[investmentRemove호출]----->");
		int investmentdeletedata = investserviceinterface.removeInvestment(investCode);
		model.addAttribute("fdCode",investfdCode);
		log.debug(investmentdeletedata+"<-----InvestController[investmentdeletedata 값 출력]");
		return "redirect:/investfunding.invest";
	}
	//투자하기 페이지에서 결제하기 클릭시 Data 요청 
	@RequestMapping(value="/investmoneydata.invest",method=RequestMethod.GET)
	public String investmentMoneyData(Locale locale,Model model,HttpSession session,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investmentMoneyData호출]----->");
		log.debug(session.getAttribute("id").toString()+"<-----InvestController[id 값 출력]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fdCode", fdCode);
		map.put("id", session.getAttribute("id").toString());
		InvestAndFundingAndMoney investmentmoneydata = investserviceinterface.getinvestmentFundingAndMoney(map);
		model.addAttribute("investmentmoneydata",investmentmoneydata);
		log.debug(investmentmoneydata+"<-----InvestController[investmentmoneydata 값 출력]");
		return "invest/investajax/investmentmoneydata";
	}
	//투자하기 페이지에서 결제하기 
	@RequestMapping(value="/investmentmoney.invest",method=RequestMethod.POST)
	public String moneyflowAdd(Locale locale,Model model,Moneyflow moneyflow){
		log.debug("<-----InvestController[investAdd호출]----->");
		log.debug(moneyflow+"<-----InvestController[moneyflow 값 출력]");
		int moneyflowinsert = investserviceinterface.addMoneyflow(moneyflow);
		model.addAttribute("fdCode",moneyflow.getMfFdCode());
		log.debug(moneyflowinsert+"<-----InvestController[moneyflowinsert 값 출력]");
		return "redirect:/investfunding.invest";
	}
	//투자하기 페이지에서 보고서 list 호출
	@RequestMapping(value = "/getfundingfilelist.invest", method = RequestMethod.GET)
	public String getFundingFileList(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
		log.debug("<-----InvestController[getFundingFileList호출]----->");
		List<FundingAndFdFile> fundingreportlist = investserviceinterface.getFundingReportyList(fdCode);
		model.addAttribute("fundingreportlist",fundingreportlist);
		log.debug(fundingreportlist+"<-----InvestController[fundingreportlist 값 출력]");
		return "invest/investajax/investreportdata";
	}
	//펀딩페이지에서 Q&A입력
	@RequestMapping(value="/investquestion.invest",method=RequestMethod.POST)
	public String investQuestion(Locale locale, Model model,FundingQna fundingqna){
		log.debug("<-----InvestController[investquestion호출]----->");
		log.debug(fundingqna+"<-----InvestController[fundingqna 값 출력]");
		int qnainsert = investserviceinterface.addInvestFundingQna(fundingqna);
		log.debug(qnainsert+"<-----InvestController[qnainsert 값 출력]");
		model.addAttribute("fdCode",fundingqna.getQnaFdCode());
		return "redirect:/investfunding.invest";
	}
	
	//펀딩페이지에서 Q&A삭제
	@RequestMapping(value="/investqnadelete.invest",method=RequestMethod.GET)
	public String investQuestionRemove(Locale locale, Model model,@RequestParam(value="qnaCode") int qnaCode,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investQuestionRemove호출]----->");
		log.debug(qnaCode+"<-----InvestController[qnaCode 값 출력]");
		int qnadelete = investserviceinterface.removeInvestFundingQna(qnaCode);
		log.debug(qnadelete+"<-----InvestController[qnadelete 값 출력]");
		model.addAttribute("fdCode",fdCode);
		return "redirect:/investfunding.invest";
	}
	//펀딩페이지에서 Q&A수정
	@RequestMapping(value="/investqnaupdate.invest",method=RequestMethod.POST)
	public String investQuestionModify(Locale locale, Model model,FundingQna fundingqna){
		log.debug("<-----InvestController[investQuestionModify호출]----->");
		log.debug(fundingqna+"<-----InvestController[fundingqna 값 출력]");
		int qnaupdate = investserviceinterface.modifyInvestFundingQna(fundingqna);
		log.debug(qnaupdate+"<-----InvestController[qnaupdate 값 출력]");
		model.addAttribute("fdCode",fundingqna.getQnaFdCode());
		return "redirect:/investfunding.invest";
	}
	//펀딩페이지에서 Q&A댓글입력
	@RequestMapping(value="/investanswer.invest",method=RequestMethod.POST)
	public String investAnswer(Locale locale, Model model,FundingQnaReply fundingqnareply,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investAnswer호출]----->");
		log.debug(fundingqnareply+"<-----InvestController[fundingqnareply 값 출력]");
		int qnareplyinsert = investserviceinterface.addInvestFundingQnaReply(fundingqnareply);
		log.debug(qnareplyinsert+"<-----InvestController[qnareplyinsert 값 출력]");
		model.addAttribute("fdCode",fdCode);
		return "redirect:/investfunding.invest";
	}
	//펀딩페이지에서 Q&A댓글삭제
	@RequestMapping(value="/investqnaredelete.invest",method=RequestMethod.GET)
	public String investAnswerRemove(Locale locale,Model model,@RequestParam(value="qnaReCode")int qnaReCode,@RequestParam(value="fdCode")int fdCode){
		log.debug("<-----InvestController[investAnswerRemove호출]----->");
		log.debug(qnaReCode+"<-----InvestController[qnaReCode 값 출력]");
		int qnareplydelete = investserviceinterface.removeInvestFundingQnaReply(qnaReCode);
		log.debug(qnareplydelete+"<-----InvestController[qnareplydelete 값 출력]");
		model.addAttribute("fdCode",fdCode);
		return "redirect:/investfunding.invest";
	}
	//펀딩페이지에서 Q&A댓글수정
	@RequestMapping(value="/investqnareupdate.invest",method=RequestMethod.POST)
	public String investAnswerModify(Locale locale, Model model, FundingQnaReply fundingqnareply,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investAnswerModify호출]----->");
		log.debug(fundingqnareply+"<-----InvestController[fundingqna 값 출력]");
		int qnareplyupdate = investserviceinterface.modifyInvestFundingQnaReply(fundingqnareply);
		log.debug(qnareplyupdate+"<-----InvestController[qnareplyupdate 값 출력]");
		model.addAttribute("fdCode",fdCode);
		return "redirect:/investfunding.invest";
	}
	//////////////////////////////////////ajax 통신/////////////////////////////////
	//펀딩 하나의 Q&A 정보 ajax 통신
	@RequestMapping(value="/investfundingqna.invest",method=RequestMethod.GET)
	public String investFuningQna(Locale locale, Model model,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investfundingqna호출]----->");
		log.debug(fdCode+"<-----InvestController[fdCode 값 출력]");
		List<FundingQna> fundingqna = investserviceinterface.getInvestFundingQna(fdCode);
		model.addAttribute("fundingqna", fundingqna);
		log.debug(fundingqna+"<-----InvestController[fundingqna 값 출력]");
		return "invest/investajax/investqna";
	}
	//펀딩 하나의 Q&A의 댓글 ajax 통신
	@RequestMapping(value="/investfundingqnareply.invest",method=RequestMethod.GET)
	public String investFundingQnaReply(Locale locale, Model model,@RequestParam(value="qnaCode") int qnaCode){
		log.debug("<-----InvestController[investFundingQnaReply호출]----->");
		log.debug(qnaCode+"<-----InvestController[qnaCode 값 출력]");
		List<FundingQnaReply> fundingqnareply = investserviceinterface.getInvestFundingQnaReply(qnaCode);
		model.addAttribute("fundingqnareply",fundingqnareply);
		log.debug(fundingqnareply+"<-----InvestController[fundingqnareply 값 출력]");
		return "invest/investajax/investqnareply";
	}
	
	
	/////////////////////////////////MY Page Investor////////////////////////////////
	//자신의 펀딩 Q&A 글 조회
	@RequestMapping(value="/investorfundingqna.invest",method=RequestMethod.GET)
	public String investorFundingQna(Locale locale, Model model,HttpSession session){
		String qnaFdId = session.getAttribute("id").toString();
		log.debug("<-----InvestController[investorFundingQna호출]----->");
		log.debug(qnaFdId+"<-----InvestController[session ID 값 출력]");
		List<MyInvestorFundingQna> investorqnalist = investserviceinterface.getInvestorQna(qnaFdId);
		model.addAttribute("investorqnalist",investorqnalist);
		log.debug(investorqnalist+"<-----InvestController[investorqnalist 값 출력]");
		return "user/investormypageajax/investorqna";
	}
	//자신의 펀딩 Q&A 글 수정
	@RequestMapping(value="/investorqnaupdate.invest",method=RequestMethod.POST)
	public String investorFundingQnaModify(Locale locale, Model model,FundingQna fundingqna){
		log.debug("<-----InvestController[investQuestionModify호출]----->");
		log.debug(fundingqna+"<-----InvestController[fundingqna 값 출력]");
		int qnaupdate = investserviceinterface.modifyInvestFundingQna(fundingqna);
		log.debug(qnaupdate+"<-----InvestController[qnaupdate 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신의 펀딩 Q&A 글 삭제
	@RequestMapping(value="/investorqnadelete.invest",method=RequestMethod.GET)
	public String investorQnaRemove(Locale locale, Model model,@RequestParam(value="qnaCode") int qnaCode){
		log.debug("<-----InvestController[investQuestionRemove호출]----->");
		log.debug(qnaCode+"<-----InvestController[qnaCode 값 출력]");
		int qnadelete = investserviceinterface.removeInvestFundingQna(qnaCode);
		log.debug(qnadelete+"<-----InvestController[qnadelete 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신의 펀딩 Q&A 댓글 조회
	@RequestMapping(value="/investorfundingqnareply.invest",method=RequestMethod.GET)
	public String investorFundingQnaReply(Locale locale, Model model,@RequestParam(value="qnaCode")int qnaCode){
		log.debug("<-----InvestController[investorFundingQnaReply호출]----->");
		log.debug(qnaCode+"<-----InvestController[qnaCode 값 출력]");
		List<FundingQnaReply> investorqnareplylist = investserviceinterface.getInvestorQnaReply(qnaCode);
		model.addAttribute("investorqnareplylist",investorqnareplylist);
		log.debug(investorqnareplylist+"<-----InvestController[investorqnareplylist 값 출력]");
		return "user/investormypageajax/investorqnareply";
	}
	//자신의 펀딩 Q&A 댓글 수정
	@RequestMapping(value="/investorqnarelyupdate.invest",method=RequestMethod.POST)
	public String investorQnaReplyModify(Locale locale, Model model, FundingQnaReply fundingqnareply){
		log.debug("<-----InvestController[investorQnaReplyModify호출]----->");
		log.debug(fundingqnareply+"<-----InvestController[fundingqnareply 값 출력]");
		int qnareplyupdate = investserviceinterface.modifyInvestFundingQnaReply(fundingqnareply);
		log.debug(qnareplyupdate+"<-----InvestController[qnareplyupdate 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신의 펀딩 Q&A 댓글 삭제
	@RequestMapping(value="/investorqnareplydelete.invest",method=RequestMethod.GET)
	public String investorQnaReplyRemove(Locale locale,Model model,@RequestParam(value="qnaReCode")int qnaReCode){
		log.debug("<-----InvestController[investorQnaReplyDelete호출]----->");
		log.debug(qnaReCode+"<-----InvestController[qnaReCode 값 출력]");
		int qnareplydelete = investserviceinterface.removeInvestFundingQnaReply(qnaReCode);
		log.debug(qnareplydelete+"<-----InvestController[qnareplydelete 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신의 투자 list 조회
	@RequestMapping(value="/investorinvestment.invest", method=RequestMethod.GET)
	public String getInvestorInvestMentList(Model model, HttpSession session){
		log.debug("<-----InvestController[getInvestorInvestMentList호출]----->");
		List<InvestorInvestList> investorinvest = investserviceinterface.getInvestorInvestMentList(session.getAttribute("id").toString());
		model.addAttribute("investorinvest", investorinvest);
		log.debug(investorinvest+"<-----InvestController[investorinvest 값 출력]");
		return "user/investormypageajax/investormypage";
	}
	
	
	
	
	
	////////////////////////////////////PSM (DIVIDEND PAY)/////////////////////////////////////////////
	//자신의 진행중 펀딩 조회
	@RequestMapping(value = "/myfundingdividendpay.invest", method = RequestMethod.GET)
	public String getMyFundingDividendpay(Locale locale, Model model,HttpSession session) {
		log.debug("<-----InvestController[myFundingDetailList호출]----->");
		List<Funding> getMyFundingDividendpay = investserviceinterface.getPMSDividendpay(session.getAttribute("id").toString());
		model.addAttribute("getMyFundingDividendpay", getMyFundingDividendpay);
		log.debug(getMyFundingDividendpay+"<-----InvestController[getMyFundingDividendpay 값 출력]");
		return "pms/companyuser/myfundingdividendpay";
	}
	//자신의 펀딩의 투자자 조회
	@RequestMapping(value = "/mydividendpayinvestlist.invest", method = RequestMethod.GET)
	public String getMyFundingDividendpayInvest(Locale locale, Model model,HttpSession session) {
		log.debug("<-----InvestController[getMyFundingDividendpayInvest호출]----->");
/*		List<Funding> getMyFundingDividendpay = investserviceinterface.getPMSDividendpay(session.getAttribute("id").toString());
		model.addAttribute("getMyFundingDividendpay", getMyFundingDividendpay);
		log.debug(getMyFundingDividendpay+"<-----InvestController[getMyFundingDividendpay 값 출력]");*/
		return "pms/companyuser/myfundingdividendpayinvestlist";
	}
	
	
	////////////////////////////////////PSM (Assignment)/////////////////////////////////////////////
	//결제모집중인 펀딩 list 조회
	@RequestMapping(value = "/fundingassignmentmain.invest", method = RequestMethod.GET)
	public String getFundingAssignmentmain(Locale locale, Model model) {
		log.debug("<-----InvestController[getFundingAssignmentmain호출]----->");
		return "pms/adminuser/fundingassignmentlist";
	}
	//배당하기 페이지 이동 
	@RequestMapping(value = "/fundingassignmentinsertpage.invest", method = RequestMethod.GET)
	public String getFundingAssignmentInsert(Locale locale, Model model,@RequestParam(value="fdCode") int fdCode) {
		log.debug("<-----InvestController[getFundingAssignmentInsert호출]----->");
		FundingAndCompanyAndMileStone getFundingAssignmentInsert = investserviceinterface.getPMSAssignmentFundingData(fdCode);
		model.addAttribute("getFundingAssignmentInsert",getFundingAssignmentInsert);
		log.debug(getFundingAssignmentInsert+"<-----InvestController[getFundingAssignmentInsert 값 출력]");
		return "pms/adminuser/fundingassignmentaddpage";
	}
	//배정하기
	@RequestMapping(value = "/fundingassignmentinsert.invest", method = RequestMethod.POST)
	public String addAssignment(Locale locale, Model model,Moneyflow moneyflow){
		log.debug("<-----InvestController[addAssignment호출]----->");
		int addAssignment = investserviceinterface.addPMSAssignment(moneyflow);
		log.debug(addAssignment+"<-----InvestController[addAssignment 값 출력]");
		return "redirect:/fundingassignmentmain.invest";
	}
	//환불하기로 이동 refund
	@RequestMapping(value = "/fundingrefundmain.invest", method = RequestMethod.GET)
	public String getFundingRefundmain(Locale locale, Model model) {
		log.debug("<-----InvestController[getFundingRefundmain호출]----->");
		return "pms/adminuser/fundingReFundlist";
	}
	//투자자 리스트 한번에 다 환불하기 
	@RequestMapping(value = "/fundingrefundinsert.invest", method = RequestMethod.GET)
	public String getFundingRefundinsert(Locale locale, Model model,@RequestParam(value="fdCode")int fdCode) {
		log.debug("<-----InvestController[getFundingRefundinsert호출]----->");
		int investorrefund = investserviceinterface.addrefund(fdCode);
		log.debug(investorrefund+"<-----InvestController[investorrefund 값 출력]");
		return "redirect:/fundingassignmentmain.invest";
	}
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	//REST CONTOROLLER
	//펀딩 하나의 detail 정보 ajax 통신
	@RequestMapping(value="/investfundingdetail.invest",method=RequestMethod.GET)
	public @ResponseBody FundingDetail investFundingDetail(Locale locale, Model model,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investfundingdetail호출]----->");
		log.debug(fdCode+"<-----InvestController[fdCode 값 출력]");
		FundingDetail fundingdetail = investserviceinterface.getInvestFundingDetail(fdCode);
		log.debug(fundingdetail+"<-----InvestController[fundingdetail 값 출력]");
		return fundingdetail;
	}
	//배정하기 펀딩 list 조회 요청 ajax
	@RequestMapping(value="/fundingassignmentlist.invest",method=RequestMethod.GET)
	public @ResponseBody List<InvestAndFd> getFundingAssignmentList(Locale locale, Model model){
		log.debug("<-----InvestController[getFundingAssignmentList호출]----->");
		List<InvestAndFd> getfundingassignmentlist = investserviceinterface.getPMSAssignmentlist();
		log.debug(getfundingassignmentlist+"<-----InvestController[getfundingassignmentlist 값 출력]");
		return getfundingassignmentlist;
	}
	//배정하기 펀딩 list 추가 요청
	@RequestMapping(value="/fundingassignmentaddlist.invest",method=RequestMethod.GET)
	public @ResponseBody List<InvestAndFd> getFundingAssignmentAddList(Locale locale, Model model,@RequestParam(value="numberOfRequests")int numberOfRequests){
		log.debug("<-----InvestController[getFundingAssignmentAddList호출]----->");
		List<InvestAndFd> getFundingAssignmentAddList = investserviceinterface.getPMSAssignmentlistAdd(numberOfRequests);
		log.debug(getFundingAssignmentAddList+"<-----InvestController[getFundingAssignmentAddList 값 출력]");
		return getFundingAssignmentAddList;
	}
	//환불대상 list 조회
	@RequestMapping(value="/fundingrefundlist.invest",method=RequestMethod.GET)
	public @ResponseBody List<Investment> getFundingRefundList(Model model, Locale locale
			, @RequestParam("fdCode") int fdCode
			, @RequestParam(value="numberOfRequests", required=false, defaultValue="0") int numberOfRequests){
		log.debug("<-----InvestController[getFundingAssignmentAddList호출]----->");
		List<Investment> getFundingRefundList = investserviceinterface.getPMSRefundlist(fdCode,numberOfRequests);
		log.debug(getFundingRefundList+"<-----InvestController[getFundingRefundList 값 출력]");
		return getFundingRefundList;
	}

}
