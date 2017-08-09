package com.pineapple.funding.funding;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pineapple.funding.user.UserService;

@Controller
public class FundingController {
	// 컨트롤러 ~ 서비스쪽까지 네이밍규칙 add, modify, remove, get
	// 입력인지 페이지요청인지는 Get, Post로 구분함
	@Autowired
    private FundingService service;
	
	// pmsmain.jsp 뷰 요청
	@RequestMapping(value = "/pmsmain.pms", method = RequestMethod.GET)
	public String pmsMain(Locale locale, Model model) {
		System.out.println("FundingController의 pmsMain호출 성공");
		return "pms/pmsmain";
	} 
	// 펀딩개설하기 페이지 요청
	@RequestMapping(value = "/fundinginsert.pms", method = RequestMethod.GET)
	public String addFunding(Locale locale, Model model) {
		System.out.println("FundingController의 addFunding호출 성공");
		return "pms/funding/fundinginsert";
	}
	// 펀딩상세정보입력 페이지 요청
	@RequestMapping(value = "/fundingdetail.pms", method = RequestMethod.GET)
	public String addFundingDetail(Locale locale, Model model) {
		System.out.println("FundingController의 addFundingDetail호출 성공");
		return "pms/funding/fundingdetailinsert";
	}
	// 마일스톤입력 페이지 요청
	@RequestMapping(value = "/milestoneinsert.pms", method = RequestMethod.GET)
	public String addMilestone(Locale locale, Model model) {
		System.out.println("FundingController의 addMilestone호출 성공");
		return "pms/funding/milestoneinsert";
	}
	// wbsplan입력 페이지 요청
	@RequestMapping(value = "/wbsplaninsert.pms", method = RequestMethod.GET)
	public String addWbsplan(Locale locale, Model model) {
		System.out.println("FundingController의 addWbsplan호출 성공");
		return "pms/funding/wbsplaninsert";
	}
	// wbsplan기타 등등 입력 페이지 요청
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.GET)
	public String addPlanEtc(Locale locale, Model model) {
		System.out.println("FundingController의 addPlanEtc호출 성공");
		return "pms/funding/wbsplanetcinsert";
	}
	 
	// 펀딩개설요청
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.POST)
	public String addFunding(Funding funding, Model model, Locale locale) {
		System.out.println("FundingController의 addFunding호출 성공");
		System.out.println("funding : " + funding);
		service.addFunding(funding);
		return "redirect:/pmsmain.pms";
	}
}
