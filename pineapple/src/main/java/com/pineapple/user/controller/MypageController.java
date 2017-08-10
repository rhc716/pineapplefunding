package com.pineapple.user.controller;
import com.pineapple.user.service.Account;
import com.pineapple.user.service.MypageServiceInterface;
import com.pineapple.user.service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageController {
	
	@Autowired
	private MypageServiceInterface mypageservice;
	
	//투자자 권한일 때, 투자자 마이페이지 요청(첫화면-회원정보, 계좌정보)

	@RequestMapping(value="/investormypage.user", method = RequestMethod.GET)
    public String memberBoardList(Model model, @RequestParam(value="userId", required=true) String userId){
    	User user = mypageservice.selectInvestor(userId);
    	Account account = mypageservice.selectAccount(userId);
    	model.addAttribute("user", user);
    	model.addAttribute("account", account);
    	return "user/investormypage";
    }

}
