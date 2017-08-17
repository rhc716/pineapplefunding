package com.pineapple.user.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.pineapple.user.service.User;
import com.pineapple.user.service.UserAndLevel;
import com.pineapple.user.service.UserAndLevelAndEmployeeAndCompanyAndRank;
import com.pineapple.user.service.UserDetail;
import com.pineapple.user.service.UserServiceInterface;

@Controller
@SessionAttributes({"id", "nickname", "level", "rank"})
//id, nickname, level키로 저장된 attribute는 세션객체에 저장 됨
public class UserController {
	@Autowired
    private UserServiceInterface service;

	//회원상세정보입력 페이지 요청
	@RequestMapping(value="/userdetailinsert.user", method=RequestMethod.GET)
	public String userdetailinsertpage(){
		System.out.println("userdetailinsertpage 회원상세정보입력 페이지 요청 처리");
		return "user/userdetailinsert";
	}
	
	//회원상세정보입력 처리
	@RequestMapping(value="/userdetailinsert.user", method=RequestMethod.POST)
	public String userdetailinsert( UserDetail userdetail){
		System.out.println("userdetailinsert 회원상세정보입력 요청 처리");
		service.addUserDetail(userdetail);
		return "redirect:/mypage.user";
	}

	//로그아웃 요청 처리
	@RequestMapping(value="/logout.user", method=RequestMethod.POST)
	public String logout(HttpSession session, SessionStatus status){
		System.out.println("logout 요청 처리");
		//session 종료 처리
		status.setComplete();
		session.setAttribute("userLogin", null);
		session.invalidate();
		System.out.println("session 종료 처리");
		return "redirect:/";
	}
	
	//로그인 페이지 요청
	@RequestMapping(value="/login.user", method=RequestMethod.GET)
	public String login(){
		System.out.println("UserController login 페이지 요청 처리");
		return "redirect:/";
	}
	
	//로그인 요청 처리
	@RequestMapping(value="/login.user", method=RequestMethod.POST)
	public String login(Model model, 
						  HttpSession session,
						  @RequestParam("id") String id,
						  @RequestParam("pw") String pw
						 ){
		System.out.println("UserController login 요청 처리");
		UserAndLevelAndEmployeeAndCompanyAndRank loginUser = service.gettUserByIdLevelnameRankname(id);
		//아이디와 비밀번호 일치여부 확인
		if(loginUser != null){
			if(id.equals(loginUser.getUserId())){
				if(pw.equals(loginUser.getPw())){
					System.out.println("login 아이디, 비밀번호 일치");
					//아이디, 비밀번호 일치할 경우 세션값 설정, @SessionAttributes를 통해 세션 객체에 담을 변수와 값 설정
					session.setAttribute("userLogin", loginUser);
					model.addAttribute("id", loginUser.getUserId());
					model.addAttribute("nickname", loginUser.getNickname());
					model.addAttribute("level", loginUser.getUserlevel().getUserLevelName());
					if(loginUser.getRankcode()!=null){
						if(loginUser.getRankcode().getRankName().equals("경영진")){
							System.out.println(id+"님의 권한명 기업회원, 직급명 경영진 세션 설정 완료");
							model.addAttribute("rank", loginUser.getRankcode().getRankName());
						} else {
							System.out.println(id+"님의 권한명 기업회원, 직급명 일반사원 세션 설정 완료");
							model.addAttribute("rank", loginUser.getRankcode().getRankName());
						}
					} else {
						System.out.println(id+"님의 기업회원 여부 체크; 기업회원 아님");
						model.addAttribute("rank", "");
					}
				} else {
					System.out.println("login 비밀번호 불일치");
					model.addAttribute("msg", "비밀번호가 일치하지 않습니다");
				}
			} else {
				System.out.println("login 아이디 불일치");
				model.addAttribute("msg", "아이디가 일치하지 않습니다");
			}
		} else {
			System.out.println("유효하지 않은 아이디 또는 비밀번호 입력");
			model.addAttribute("msg", "유효하지 않은 아이디 또는 비밀번호가 입력되었습니다");
		}
		return "redirect:/";
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
