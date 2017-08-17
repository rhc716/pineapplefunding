package com.pineapple.user.controller;
import com.pineapple.user.service.MypageServiceInterface;
import com.pineapple.user.service.User;
import com.pineapple.user.service.UserDetail;
import com.pineapple.user.service.UserService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	@Autowired
	private MypageServiceInterface mypageservice;
	private UserService service;
	
	//투자자 마이페이지 분기
	@RequestMapping(value="/investormypage.user", method=RequestMethod.GET)
	public String investormypage(Model model, HttpSession session){
		System.out.println("investormypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
		return "user/investormypage";
	}
	//기업회원 중 경영진 마이페이지 분기
	@RequestMapping(value="/managermypage.user", method=RequestMethod.GET)
	public String managermypage(Model model, HttpSession session){
		System.out.println("managermypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
		return "user/managermypage";
	}
	//기업회원 중 일반사원 마이페이지 분기
	@RequestMapping(value="/employeemypage.user", method=RequestMethod.GET)
	public String employeemypage(Model model, HttpSession session){
		System.out.println("employeemypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
		return "user/employeemypage";
	}
	//관리자 마이페이지 분기
	@RequestMapping(value="/adminmypage.user", method=RequestMethod.GET)
	public String adminmypage(Model model, HttpSession session){
		System.out.println("adminmypage 페이지 요청");
		User user = mypageservice.selectInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
		return "user/adminmypage";
	}	
	//mypage main 페이지 요청
	@RequestMapping(value="/mypage.user", method=RequestMethod.GET)
	public String mypagemain(HttpSession session){
		System.out.println("mypage main 페이지 요청");
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
