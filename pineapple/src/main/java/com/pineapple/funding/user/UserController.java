package com.pineapple.funding.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	@Autowired
    private UserService service;
	
	//회원가입 요청
	@RequestMapping(value="/addUserForm", method = RequestMethod.POST)
    public String userAdd(User user) {//커맨드 객체
        System.out.println("UserController user : "+user);
        service.addUser(user);
        return "redirect:/"; // 글입력후 "/"로 리다이렉트(재요청)
    }
    
	//회원가입 페이지 요청
	@RequestMapping(value="/addUserForm", method = RequestMethod.GET)
    public String userAdd() {
        System.out.println("addUserForm 폼 요청");
        return "user/addUserForm";
    }
}
