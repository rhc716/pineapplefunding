package com.pineapple.pms.controller;

import java.util.ArrayList;
import java.util.List;
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
import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.pms.service.PmsService;
import com.pineapple.pms.service.WbsPlan;

@Controller
public class PmsController {

	
	@Autowired
    private PmsService service;
	
	// wbsplan입력 페이지 요청
	@RequestMapping(value = "/wbsplaninsert.pms", method = RequestMethod.GET)
	public String addWbsplan(Locale locale, Model model) {
		System.out.println("PmsController의 addWbsplan호출 성공");
		return "pms/companyuser/wbsplaninsert";
	}
	// wbsplan기타 등등 입력 페이지 요청
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.GET)
	public String addPlanEtc(Locale locale, Model model) {
		System.out.println("PmsController의 addPlanEtc호출 성공");
		return "pms/companyuser/wbsplanetcinsert";
	}
	
	//wbsplan 리스트 불러오기
	@RequestMapping(value = "/wbsplanlist.pms", method = RequestMethod.GET)
	public String WbsPlanList(Locale locale, Model model) {
		System.out.println("PmsController의 wbsplanlist호출 성공");
		List<WbsPlan> wbsplanlist = service.getMyWbsPlanList();
		model.addAttribute("wbsplanlist", wbsplanlist);
		System.out.println(wbsplanlist+"<-----PmsController[wbsplanlist 값 출력]");
		return "pms/companyuser/wbsplanlist";
	}
	
	
	// wbsplanhuman 입력 페이지 요청
	@RequestMapping(value = "/wbsplaninserthuman.pms", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		System.out.println("PmsController의 wbsplaninserthuman호출 성공");
		return "pms/companyuser/wbsplaninserthuman";
	}
	
	
		
////////////////////////////////////////////////위에는///페이지요청//////////////////////////////////////////////////////
		
		// WbsPlan 생성
		@RequestMapping(value = "/wbsplaninsert.pms", method = RequestMethod.POST)
		public String addWbsplan(WbsPlan wbsplan, Model model, Locale locale) {
			System.out.println("PmsController의 addWbsplan호출 성공");
			System.out.println("WbsPlan : " + wbsplan);
			service.addWbsplan(wbsplan);
			return "redirect:/pmsmain.pms";
		}
		
	/*	// 내가 속한 회사의 WbsPlan 리스트 확인
		 @RequestMapping(value="/wbsplanlist", method = RequestMethod.GET)
		public @ResponseBody ArrayList<WbsPlan> getMyWbsPlan(Model model, Locale locale, @RequestParam("userId") String userId) {
			System.out.println("PmsController의 getMyWbsPlan호출 성공");
			return null;
		}
		*/

}
