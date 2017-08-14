package com.pineapple.user.controller;
import com.pineapple.user.service.MypageServiceInterface;
import com.pineapple.user.service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController {
	
	@Autowired
	private MypageServiceInterface mypageservice;
	
	//투자자 권한일 때, 투자자 마이페이지 요청(첫화면-회원정보, 계좌정보)
	@RequestMapping(value="/investormypage.user", method = RequestMethod.GET)
    public String memberBoardList(Model model, @RequestParam(value="userId", required=true) String userId){
		System.out.println("투자자 마이페이지 요청");
    	User user = mypageservice.selectInvestorBasic(userId);
    	model.addAttribute("user", user);
    	return "user/investormypage";
    }

}
