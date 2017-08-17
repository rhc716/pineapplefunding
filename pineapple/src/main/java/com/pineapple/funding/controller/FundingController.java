package com.pineapple.funding.controller;

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

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndFdDetail;
import com.pineapple.funding.service.FundingDetail;
import com.pineapple.funding.service.FundingService;



@Controller
public class FundingController { 
	private Logger log = Logger.getLogger(this.getClass());

	// 컨트롤러 ~ 서비스쪽까지 네이밍규칙 add, modify, remove, get
	// 입력, 수정인지 단순 페이지요청인지는 Get, Post로 구분함
	@Autowired
    private FundingService service;
	
	// pmsmain.jsp 뷰 요청
	@RequestMapping(value = "/pmsmain.pms", method = RequestMethod.GET)
	public String pmsMain(Locale locale, Model model) {
		log.debug("FundingController의 pmsMain호출 성공");
		return "pms/pmsmain";
	} 
	// 펀딩개설하기 페이지 요청
	@RequestMapping(value = "/fundinginsert.pms", method = RequestMethod.GET)
	public String addFunding(Locale locale, Model model) {
		log.debug("FundingController의 addFunding호출 성공");
		return "pms/companyuser/fundinginsert";
	}
	// 펀딩상세정보입력 페이지 요청
	@RequestMapping(value = "/addfundingdetail.pms", method = RequestMethod.GET)
	public String addFundingDetail(Locale locale, Model model) {
		log.debug("FundingController의 addFundingDetail호출 성공");
		return "pms/companyuser/fundingdetailinsert";
	}
	// 마일스톤입력 페이지 요청
	@RequestMapping(value = "/milestoneinsert.pms", method = RequestMethod.GET)
	public String addMilestone(Locale locale, Model model) {
		log.debug("FundingController의 addMilestone호출 성공");
		return "pms/companyuser/milestoneinsert";
	}
	
	// 펀딩조회하기 페이지 요청
	@RequestMapping(value = "/myfundinglistpage.pms", method = RequestMethod.GET)
	public String myfundinglistpage(Locale locale, Model model) {
		log.debug("FundingController의 myfundinglistpage호출 성공");
		return "pms/companyuser/myfundinglist";
	}

	// 펀딩상세 리스트 페이지 요청
	@RequestMapping(value = "/myfundingdetaillist.pms", method = RequestMethod.GET)
	public String myfundingdetaillist(Locale locale, Model model) {
		log.debug("FundingController의 myfundingdetaillist호출 성공");
		return "pms/companyuser/myfundingdetaillist";
	}
////////////////////////////////////////////////위에는///페이지요청//////////////////////////////////////////////////////
	
	// 펀딩개설요청 ( 기업회원 경영자 )
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.POST)
	public String addFunding(Funding funding, Model model, Locale locale) {
		log.debug("FundingController의 addFunding호출 성공");
		log.debug("funding : " + funding);
		service.addFunding(funding);
		return "redirect:/pmsmain.pms";
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/selectmyfundinglist.pms", method = RequestMethod.GET)
	public @ResponseBody List<Funding> getMyFundingList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getMyFundingList호출 성공");
		log.debug("userId : " + userId);
		log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyFundinglist(userId));
		return service.getMyFundinglist(userId);
	}
	
	// 펀딩삭제 ( 기업회원 경영자 )
	@RequestMapping(value = "/deletefunding.pms", method = RequestMethod.GET)
	public @ResponseBody int removeFunding(Model model, Locale locale, @RequestParam("delfdCode") int delfdCode) {
		log.debug("FundingController의 removeFunding호출 성공");
		log.debug("delfdCode : " + delfdCode);
		int result = service.removeFunding(delfdCode);
		log.debug("result : " + result);
		return result;
		
	}
	
	// 펀딩수정 ( 기업회원 경영자 )
	@RequestMapping(value = "/modifyfunding.pms", method = RequestMethod.POST)
	public String modifyfunding(Model model, Locale locale, Funding funding, @RequestParam("fdCode") int fdCode) {
		log.debug("FundingController의 modifyfunding호출 성공");
		log.debug("fdCode : " + fdCode);
		log.debug("funding : " + funding);
		service.modifyFunding(funding, fdCode);
		return "pms/companyuser/myfundinglist";
	}
	
	// 내가 소속된 회사 펀딩, 펀딩상세 정보 담은 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/selectmyfundingdetaillist.pms", method = RequestMethod.GET)
	public @ResponseBody List<FundingAndFdDetail> getMyFundingDetailList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getMyFundingDetailList호출 성공");
		log.debug("userId : " + userId);
		log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyFundingDetailList(userId));
		return service.getMyFundingDetailList(userId);
	}
	
	//펀딩상세수정 ( 기업회원 경영자 )
	@RequestMapping(value = "/modifyfundingdetail.pms", method = RequestMethod.POST)
	public String modifyfundingdetail(Model model, Locale locale, FundingDetail fundingdetail) {
		log.debug("FundingController의 modifyfundingdetail호출 성공");
		log.debug("fundingdetail : " + fundingdetail);
		service.modifyFundingDetail(fundingdetail);
		return "pms/companyuser/myfundingdetaillist";
	}
	
}