package com.pineapple.funding.user;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Autowired
    private UserService service;
	
	//회원가입시 아이디 중복체크 ajax 요청 처리
	@RequestMapping(value="/checkid.user", method = RequestMethod.POST)
	public @ResponseBody String checkId(Locale locale, Model model, @RequestParam("userId") String userId){
		System.out.println("UserController checkid : "+userId);
		if(service.getUser(userId) != userId){
			return userId;
		}else{
			return "아이디중복";
		}
		
	}
	
	//회원가입 요청
	@RequestMapping(value="/addUserForm.user", method = RequestMethod.POST)
    public String userAdd(User user) { //커맨드 객체
        System.out.println("UserController user : "+user);
        service.addUser(user);
        return "redirect:/"; // 글입력후 "/"로 리다이렉트(재요청)
    }
    
	//회원가입 페이지 요청
	@RequestMapping(value="/addUserForm.user", method = RequestMethod.GET)
    public String userAdd() {
        System.out.println("addUserForm 폼 요청");
        return "user/addUserForm";
    }
}
