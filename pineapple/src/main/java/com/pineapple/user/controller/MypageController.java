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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageServiceInterface mypageservice;
	
	//회원상세정보 수정 처리
	@RequestMapping(value="/userdetailmodify.user", method=RequestMethod.POST)
	public String userdetailmodify(HttpSession session, UserDetail userdetail){
		log.debug("userdetailmodify 회원정보수정 처리 요청");
		int result = mypageservice.updateUserDetail(userdetail);
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
		User user = mypageservice.selectInvestorBasic(userId);
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.selectUserDetail(userId);
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
