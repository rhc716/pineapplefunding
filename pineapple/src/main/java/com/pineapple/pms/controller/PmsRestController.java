package com.pineapple.pms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingService;
import com.pineapple.pms.service.WbsMs;
import com.pineapple.pms.service.WbsPlan;
import com.pineapple.pms.service.WbsPlanHuman;
import com.pineapple.pms.service.PmsService;


@RestController
public class PmsRestController {
	private Logger log = Logger.getLogger(this.getClass());

	// 컨트롤러 ~ 서비스쪽까지 네이밍규칙 add, modify, remove, get
	// 입력, 수정인지 단순 페이지요청인지는 Get, Post로 구분함
	@Autowired
    private FundingService fservice;
	@Autowired
	private PmsService service;
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/wbsfundinglist.pms", method = RequestMethod.GET)
	public List<Funding> Wbsfunding(String userId) {
		log.debug("RestPmsController의 Wbsfunding호출 성공");
		log.debug("userId : " + userId);
		List<Funding> fdlist = fservice.getMyFundinglist(userId);
		log.debug("컨트롤러에서 받은 리턴값 : " +fdlist);
		return fdlist;
	}
	
	//마일스톤리스트 확인
	@RequestMapping(value = "/WbsMs.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public List<WbsMs> WbsMs(String fdCode) {
		log.debug("펀딩코드"+fdCode);
		log.debug("RestPmsController의 WbsMs호출 성공");
		List<WbsMs> mslist = service.wbsmsview(fdCode);
		log.debug("mslist확인"+mslist);
		return mslist;
	}
	
	//wbs플랜리스트 확인
	@RequestMapping(value = "/Wbsplanlist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public List<WbsPlan> Wbsplan(String milestoneCode) {
		log.debug("마일스톤코드"+milestoneCode);
		log.debug("RestPmsController의 Wbsplan호출 성공");
		List<WbsPlan> wbsplan = service.wbsplanlist(milestoneCode);
		log.debug("wbsplan확인"+wbsplan);
		return wbsplan;
	}
	
	
	// wbsplan 인원 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanhumanlist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public List<WbsPlanHuman> wbsplanhumanlist(String wbsplancode){
		log.debug("PmsController의 wbsplanhumanlist호출 성공");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanHuman> wbsplanhumanlist = new ArrayList<WbsPlanHuman>();
		wbsplanhumanlist = service.getMyWbsPlanHumanList(wbsplancode);
		return wbsplanhumanlist;
	}
	
	//wbsplanhuman 삭제
	@RequestMapping(value = "/wbsplanhumandelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanhumandelete(String wphCode) {
		log.debug("PmsController의 wbsplanhumandelete호출 성공");
		log.debug("wbh코드" + wphCode);
		service.deletewbsplanhuman(wphCode);
	}
}
