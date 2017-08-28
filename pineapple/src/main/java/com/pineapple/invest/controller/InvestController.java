package com.pineapple.invest.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pineapple.funding.service.FundingDetail;
import com.pineapple.invest.service.FundingQna;
import com.pineapple.invest.service.FundingQnaReply;
import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.InvestAndFdLikeAndFd;
import com.pineapple.invest.service.InvestServiceInterface;
import com.pineapple.invest.service.Investment;

@Controller
public class InvestController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private InvestServiceInterface investserviceinterface;
	//투자하기 페이지 요청 investmain.jsp
	@RequestMapping(value="/investmain.invest" , method=RequestMethod.GET)
	public String investMain(Locale locale, Model model){
		log.debug("<----- InvestController[investMain호출]----->");
		List<InvestAndFd> fundingList = investserviceinterface.getInvestFunding();
		model.addAttribute("fundingList", fundingList);
		log.debug(fundingList+"<-----InvestController[fundingList 값 출력]");
		return "invest/investmain";
	}
	//투자하기 페이지에서 펀딩페이지 오픈 investfunding.jsp
	@RequestMapping(value="/investfunding.invest",method=RequestMethod.GET)
	public String investFunding(Locale locale, Model model,@RequestParam(value="fdCode") int fdCode){
		log.debug("<-----InvestController[investFunding호출]----->");
		log.debug(fdCode+"<-----InvestController[fdCode 값 출력]");
		InvestAndFdLikeAndFd fundingData = investserviceinterface.getInvestFundingone(fdCode);
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
		//↓고려사항 선생님
		//프로세스 처리 dao 
		//정상 처리가 되었다면은?
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

}
