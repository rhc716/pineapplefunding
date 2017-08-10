package com.pineapple.funding.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingService;



@Controller
public class FundingController { 
	// 컨트롤러 ~ 서비스쪽까지 네이밍규칙 add, modify, remove, get
	// 입력, 수정인지 단순 페이지요청인지는 Get, Post로 구분함
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
		return "pms/companyuser/fundinginsert";
	}
	// 펀딩상세정보입력 페이지 요청
	@RequestMapping(value = "/fundingdetail.pms", method = RequestMethod.GET)
	public String addFundingDetail(Locale locale, Model model) {
		System.out.println("FundingController의 addFundingDetail호출 성공");
		return "pms/companyuser/fundingdetailinsert";
	}
	// 마일스톤입력 페이지 요청
	@RequestMapping(value = "/milestoneinsert.pms", method = RequestMethod.GET)
	public String addMilestone(Locale locale, Model model) {
		System.out.println("FundingController의 addMilestone호출 성공");
		return "pms/companyuser/milestoneinsert";
	}
	// wbsplan입력 페이지 요청
	@RequestMapping(value = "/wbsplaninsert.pms", method = RequestMethod.GET)
	public String addWbsplan(Locale locale, Model model) {
		System.out.println("FundingController의 addWbsplan호출 성공");
		return "pms/companyuser/wbsplaninsert";
	}
	// wbsplan기타 등등 입력 페이지 요청
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.GET)
	public String addPlanEtc(Locale locale, Model model) {
		System.out.println("FundingController의 addPlanEtc호출 성공");
		return "pms/companyuser/wbsplanetcinsert";
	}
	
	// wbsplan기타 등등 입력 페이지 요청
		@RequestMapping(value = "/myfundinglistpage.pms", method = RequestMethod.GET)
		public String myfundinglistpage(Locale locale, Model model) {
			System.out.println("FundingController의 myfundinglistpage호출 성공");
			return "pms/companyuser/myfundinglist";
	}
		
	////////////////////////////////////////////////위에는///페이지요청//////////////////////////////////////////////////////
		
	// 펀딩개설요청 ( 기업회원 경영자 )
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.POST)
	public String addFunding(Funding funding, Model model, Locale locale) {
		System.out.println("FundingController의 addFunding호출 성공");
		System.out.println("funding : " + funding);
		service.addFunding(funding);
		return "redirect:/pmsmain.pms";
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/selectmyfundinglist.pms", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Funding> getMyFundingList(Model model, Locale locale, @RequestParam("userId") String userId) {
		System.out.println("FundingController의 getMyFundingList호출 성공");
		System.out.println("userId : " + userId);
		
		
		return null;
	}
}
