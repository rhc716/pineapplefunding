package com.pineapple.user.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pineapple.user.service.User;
import com.pineapple.user.service.UserServiceInterface;

@Controller
@SessionAttributes({"id", "nickname", "level"})
//id, nickname, level키로 저장된 attribute는 세션객체에 저장 됨
public class UserController {
	@Autowired
    private UserServiceInterface service;
	
	//로그인 요청 ajax처리
	@RequestMapping(value="/login.user", method = RequestMethod.POST)
	public @ResponseBody User login(Locale locale, 
									Model model, 
									@RequestParam("id") String id,
									@RequestParam("pw") String pw
									){
		System.out.println("UserController login 메서드 호출");
		User user = service.getUser(id);
		model.addAttribute("user", user);
		model.addAttribute("id", user.getUserId());
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("level", user.getLevelCode());
		return user;
	}
	
	//회원가입시 닉네임 중복 체크 ajax 요청 처리
	@RequestMapping(value="/checkNick.user", method = RequestMethod.POST)
	public @ResponseBody User checkNick(Locale locale, Model model, @RequestParam("nickname") String nickname){
		System.out.println("UserController checknick : "+service.getUserByNickname(nickname).getNickname());
		return service.getUserByNickname(nickname);
	}
	
	//회원가입시 비밀번호 일치 체크 ajax 요청 처리
	@RequestMapping(value="/checkPw.user", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkPw(Locale locale,
						  Model model,
						  @RequestParam("pw1") String pw1,
						  @RequestParam("pw2") String pw2
			){
				System.out.println("UserController pw1 : "+pw1);
				System.out.println("UserController pw2 : "+pw2);
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("pw1", pw1);
				map.put("pw2", pw2);
			return map;
	}
	
	//회원가입시 아이디 중복 체크 ajax 요청 처리
	@RequestMapping(value="/checkId.user", method = RequestMethod.POST)
	public @ResponseBody User checkId(Locale locale, Model model, @RequestParam("userId") String userId){
		System.out.println("UserController checkid : "+userId);
		return service.getUser(userId);
	}
	
	//회원가입 요청
	@RequestMapping(value="/userinsert.user", method = RequestMethod.POST)
    public String userAdd(User user) { //커맨드 객체
        System.out.println("UserController user : "+user);
        service.addUser(user);
        return "redirect:/"; // 글입력후 "/"로 리다이렉트(재요청)
    }
    
	//회원가입 페이지 요청
	@RequestMapping(value="/userinsert.user", method = RequestMethod.GET)
    public String userAdd() {
        System.out.println("addUserForm 폼 요청");
        return "user/userinsert";
    }
}
