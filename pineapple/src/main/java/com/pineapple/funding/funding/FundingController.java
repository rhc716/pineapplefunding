package com.pineapple.funding.funding;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FundingController {
	// pmsmain.jsp 뷰 요청
	@RequestMapping(value = "/pmsmain.pms", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "pms/pmsmain";
	} 
	// 펀딩개설하기 페이지 요청
	@RequestMapping(value = "/fundingopen.pms", method = RequestMethod.GET)
	public String fundingopen(Locale locale, Model model) {
		return "pms/funding/fundinginsert";
	}
	// 펀딩상세정보입력 페이지 요청
	@RequestMapping(value = "/fundingdetail.pms", method = RequestMethod.GET)
	public String fundingdetail(Locale locale, Model model) {
		return "pms/funding/fundingdetailinsert";
	}
	// 마일스톤입력 페이지 요청
	@RequestMapping(value = "/milestoneinsert.pms", method = RequestMethod.GET)
	public String milestoneinsert(Locale locale, Model model) {
		return "pms/funding/milestoneinsert";
	}
	// wbsplan입력 페이지 요청
	@RequestMapping(value = "/wbsplan.pms", method = RequestMethod.GET)
	public String wbsplan(Locale locale, Model model) {
		return "pms/funding/wbsplaninsert";
	}
	
	
}
