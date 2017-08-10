package com.pineapple.invest.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pineapple.funding.service.Funding;
import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.InvestServiceInterface;

@Controller
public class InvestController {
	@Autowired
	private InvestServiceInterface investserviceinterface;
	//투자하기 페이지 요청 investmain.jsp
	@RequestMapping(value="/investmain.invest" , method=RequestMethod.GET)
	public String investMain(Locale locale, Model model){
		System.out.println(model+"<----- InvestController[investMain호출]");
		List<InvestAndFd> fundingList = investserviceinterface.getInvestFunding();
		model.addAttribute("fundingList", fundingList);
		System.out.println(fundingList+"<-----InvestController[fundingList 값 출력]");
		return "invest/investmain";
	}
	//투자하기 페이지에서 펀딩페이지 오픈 investfunding.jsp
	@RequestMapping(value="/investfunding.invest",method=RequestMethod.GET)
	public String investFunding(Locale locale, Model model){
		return "invest/investfunding";
	}
}
