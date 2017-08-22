package com.pineapple.user.controller;
import com.pineapple.user.service.Company;
import com.pineapple.user.service.MypageServiceInterface;
import com.pineapple.user.service.User;
import com.pineapple.user.service.UserDetail;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageServiceInterface mypageservice;
	
	//사원등록시 회사검색 요청 처리
	@RequestMapping(value="/selectcompany.user", method = RequestMethod.POST)
    public @ResponseBody Company searchCompany(HttpSession session, Model model, @RequestParam("comName") String comName) { 
        log.debug("searchCompany 회사검색");
        Company mycompany = mypageservice.getMyCompany(comName);
        if(mycompany != null){
        	log.debug(session.getAttribute("nickname")+"님의 소속회사조회 성공");
        	model.addAttribute("mycompany", mycompany);
        } else {
        	log.debug(session.getAttribute("nickname")+"님의  소속회사조회 실패");
        }
        return mycompany;
    }
	
	//경영진의 회사등록 요청 처리
	@RequestMapping(value="/addnewcompany.user", method = RequestMethod.POST)
    public String addCompany(HttpSession session, Company company) { //커맨드 객체
        log.debug("addCompany 새로운 기업등록 요청 : "+company);
        int result = mypageservice.addCompany(company);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 새로운 기업등록 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 새로운 기업등록 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	//회원상세정보 수정 처리
	@RequestMapping(value="/userdetailmodify.user", method=RequestMethod.POST)
	public String userdetailmodify(HttpSession session, UserDetail userdetail){
		log.debug("userdetailmodify 회원정보수정 처리 요청");
		int result = mypageservice.modifyUserDetail(userdetail);
		if(result != 0){
			log.debug(session.getAttribute("nincname")+"님의 userdetailmodify 회원정보수정 처리 성공");
		} else {
			log.debug(session.getAttribute("nincname")+"님의 userdetailmodify 회원정보수정 처리 실패");
		}
		return "redirect:/mypage.user";
	}
	//마이페이지 회원상세정보 수정 페이지 요청
	@RequestMapping(value="/userdetailmodify.user", method=RequestMethod.GET)
	public @ResponseBody UserDetail userdetailmodify(Model model, @RequestParam("userId") String userId){
		log.debug("userdetailmodify 회원정보수정 페이지 요청");
		User user = mypageservice.getInvestorBasic(userId);
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(userId);
    	if(userdetail != null){
    		log.debug("수정페이지 구현을 위한 회원상세정보 조회 성공");
    		model.addAttribute("userdetail", userdetail);
    	} else {
    		log.debug("수정페이지 구현을 위한 회원상세정보 조회 실패");
    	}
		return userdetail;
	}
	//투자자 마이페이지 분기(회원상세정보조회, 계좌정보조회 기능 포함)
	@RequestMapping(value="/investormypage.user", method=RequestMethod.GET)
	public String investormypage(Model model, HttpSession session){
		log.debug(session.getAttribute("level")+" 권한으로 "+session.getAttribute("nickname")+"님의 investormypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/investormypage";
	}
	//기업회원 중 경영진 마이페이지 분기(회원상세정보조회, 회사등록정보조회 기능 포함)
	@RequestMapping(value="/managermypage.user", method=RequestMethod.GET)
	public String managermypage(Model model, HttpSession session){
		log.debug(session.getAttribute("rank")+" 권한으로 "+session.getAttribute("nickname")+"님의 managermypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
    	Company company = mypageservice.getCompanyByOpenId(session.getAttribute("id").toString());
    	if(company != null){
			log.debug("getCompanyInfoByOpenId 회사개설정보 조회 성공");
			model.addAttribute("company", company);
		} else {
			log.debug("getCompanyInfoByOpenId 회사개설정보 조회 실패");
		}
    	List<Company> result = mypageservice.getAllCompany();
        if(result != null){
        	log.debug(session.getAttribute("nickname")+"님의 전체회사조회 성공");
         	model.addAttribute("allcompany", result);
         } else {
         	log.debug(session.getAttribute("nickname")+"님의  전체회사조회 실패");
         }
		return "user/managermypage";
	}
	//기업회원 중 일반사원 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/employeemypage.user", method=RequestMethod.GET)
	public String employeemypage(Model model, HttpSession session){
		log.debug(session.getAttribute("rank")+" 권한으로 "+session.getAttribute("nickname")+"님의 employeemypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/employeemypage";
	}
	//관리자 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/adminmypage.user", method=RequestMethod.GET)
	public String adminmypage(Model model, HttpSession session){
		log.debug(session.getAttribute("level")+" 권한으로 "+session.getAttribute("nickname")+"님의 adminmypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/adminmypage";
	}	
	//mypage main 페이지 요청 - 권한별 분기 기능 구현
	@RequestMapping(value="/mypage.user", method=RequestMethod.GET)
	public String mypagemain(HttpSession session){
		log.debug("공통 mypage main 페이지 요청 - 권한별 분기 예정");
		String levelResult = null;
		if(session.getAttribute("level").equals("투자자")){
			levelResult = "redirect:/investormypage.user";
		} else if(session.getAttribute("level").equals("기업회원")) {
			if(session.getAttribute("rank").equals("경영진")){
				levelResult = "redirect:/managermypage.user";
			} else {
				levelResult = "redirect:/employeemypage.user";
			}
		} else {
			levelResult = "redirect:/adminmypage.user";
		}
		return levelResult;
	}

}
