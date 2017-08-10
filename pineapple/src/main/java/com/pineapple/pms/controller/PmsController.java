package com.pineapple.pms.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pineapple.funding.service.FundingService;

@Controller
public class PmsController {

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
		

}
