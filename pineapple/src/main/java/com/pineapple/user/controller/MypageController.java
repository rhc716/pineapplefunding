package com.pineapple.user.controller;
import com.pineapple.user.service.MypageServiceInterface;
import com.pineapple.user.service.User;
import com.pineapple.user.service.UserDetail;
import com.pineapple.user.service.UserService;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageServiceInterface mypageservice;
	
	//회원상세정보 수정 처리
	@RequestMapping(value="/userdetailmodify.user", method=RequestMethod.POST)
	public String userdetailmodify(UserDetail userdetail){
		log.debug("userdetailmodify 회원정보수정 처리 요청");
		mypageservice.updateUserDetail(userdetail);
		return "redirect:/mypage.user";
	}
	
	//마이페이지 회원상세정보 수정 페이지 요청
	@RequestMapping(value="/userdetailmodify.user", method=RequestMethod.GET)
	public String userdetailmodify(Model model, HttpSession session){
		log.debug("userdetailmodify 회원정보수정 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.selectUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/mypageall";
	}
	
	//투자자 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/investormypage.user", method=RequestMethod.GET)
	public String investormypage(Model model, HttpSession session){
		log.debug("investormypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.selectUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/investormypage";
	}
	//기업회원 중 경영진 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/managermypage.user", method=RequestMethod.GET)
	public String managermypage(Model model, HttpSession session){
		log.debug("managermypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.selectUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/managermypage";
	}
	//기업회원 중 일반사원 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/employeemypage.user", method=RequestMethod.GET)
	public String employeemypage(Model model, HttpSession session){
		log.debug("employeemypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.selectUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/employeemypage";
	}
	//관리자 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/adminmypage.user", method=RequestMethod.GET)
	public String adminmypage(Model model, HttpSession session){
		log.debug("adminmypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.selectUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/adminmypage";
	}	
	//mypage main 페이지 요청
	@RequestMapping(value="/mypage.user", method=RequestMethod.GET)
	public String mypagemain(HttpSession session){
		log.debug("mypage main 페이지 요청");
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
