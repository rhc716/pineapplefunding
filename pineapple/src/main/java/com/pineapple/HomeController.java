package com.pineapple;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.user.service.MypageServiceInterface;


@Controller
public class HomeController {
private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageServiceInterface mypageservice;
	
	//사이트 메인 페이지 최신순, 인기순(펀딩결제금액순) 펀딩리스트 조회
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.debug("getFundingOrderbyDateAndTotal 메인페이지 펀딩리스트 최신순, 인기순 조회 요청");
		List<InvestAndFd> fdorderbydate = mypageservice.getFundingOrderbyDate();
		if(fdorderbydate != null){
			log.debug("메인페이지 펀딩리스트 최신순 조회 성공");
			model.addAttribute("fdorderbydate", fdorderbydate);
		} else {
			log.debug("메인페이지 펀딩리스트 최신순 조회 실패");
		}
		List<InvestAndFd> fdorderbytotal = mypageservice.getFundingOrderbyTotal();
		if(fdorderbytotal != null){
			log.debug("메인페이지 펀딩리스트 인기순 조회 성공");
			model.addAttribute("fdorderbytotal", fdorderbytotal);
		} else {
			log.debug("메인페이지 펀딩리스트 인기순 조회 실패");
		}
		return "main";
	}
	
}
