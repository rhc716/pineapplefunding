package com.pineapple.invest.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pineapple.funding.service.FundingDetail;
import com.pineapple.invest.service.FundingQna;
import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.InvestAndFdLikeAndFd;
import com.pineapple.invest.service.InvestServiceInterface;

@Controller
public class InvestController {
	@Autowired
	private InvestServiceInterface investserviceinterface;
	//투자하기 페이지 요청 investmain.jsp
	@RequestMapping(value="/investmain.invest" , method=RequestMethod.GET)
	public String investMain(Locale locale, Model model){
		System.out.println("<----- InvestController[investMain호출]----->");
		List<InvestAndFd> fundingList = investserviceinterface.getInvestFunding();
		model.addAttribute("fundingList", fundingList);
		System.out.println(fundingList+"<-----InvestController[fundingList 값 출력]");
		return "invest/investmain";
	}
	//투자하기 페이지에서 펀딩페이지 오픈 investfunding.jsp
	@RequestMapping(value="/investfunding.invest",method=RequestMethod.GET)
	public String investFunding(Locale locale, Model model,@RequestParam(value="fdCode", required=true) int fdCode){
		System.out.println("<-----InvestController[investFunding호출]----->");
		System.out.println(fdCode+"<-----InvestController[fdCode 값 출력]");
		InvestAndFdLikeAndFd fundingData = investserviceinterface.getInvestFundingone(fdCode);
		model.addAttribute("fundingData", fundingData);
		System.out.println(fundingData+"<-----InvestController[fundingData 값 출력]");
		return "invest/investfunding";
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////
	//REST CONTOROLLER
	//펀딩 하나의 detail 정보 ajax 통신
	@RequestMapping(value="/investfundingdetail.invest",method=RequestMethod.GET)
	public @ResponseBody FundingDetail investfundingdetail(Locale locale, Model model,@RequestParam(value="fdCode", required=true) int fdCode){
		System.out.println("<-----InvestController[investfundingdetail호출]----->");
		System.out.println(fdCode+"<-----InvestController[fdCode 값 출력]");
		FundingDetail fundingdetail = investserviceinterface.getInvestFundingDetail(fdCode);
		System.out.println(fundingdetail+"<-----InvestController[fundingdetail 값 출력]");
		return fundingdetail;
	}
	//펀딩 하나의 Q&A 정보 ajax 통신
	@RequestMapping(value="/investfundingqna.invest",method=RequestMethod.GET)
	public @ResponseBody List<FundingQna> investfundingqna(Locale locale, Model model,@RequestParam(value="fdCode", required=true) int fdCode){
		System.out.println("<-----InvestController[investfundingqna호출]----->");
		System.out.println(fdCode+"<-----InvestController[fdCode 값 출력]");
		List<FundingQna> fundingqna = investserviceinterface.getInvestFundingQna(fdCode);
		model.addAttribute("fundingqna", fundingqna);
		System.out.println(fundingqna+"<-----InvestController[fundingqna 값 출력]");
		return fundingqna;
	}
}
