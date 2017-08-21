package com.pineapple.user.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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

import com.pineapple.user.service.Account;
import com.pineapple.user.service.User;
import com.pineapple.user.service.UserAndLevel;
import com.pineapple.user.service.UserAndLevelAndEmployeeAndCompanyAndRank;
import com.pineapple.user.service.UserDetail;
import com.pineapple.user.service.UserServiceInterface;

@Controller
@SessionAttributes({"id", "nickname", "level", "rank"})
//id, nickname, level키로 저장된 attribute는 세션객체에 저장 됨
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private UserServiceInterface service;
	
	//계좌 수정 요청 처리
	@RequestMapping(value="/changeaccount.user", method = RequestMethod.POST)
    public String changeAccount(HttpSession session, Account account) { //커맨드 객체
        log.debug("UserController changeAccount 계좌수정 요청 : "+account);
        int result = service.changeAccountByAccountCode(account);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 계좌수정 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 계좌수정 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	
	//마이페이지 계좌정보 수정 페이지 요청
	@RequestMapping(value="/changeaccountpage.user", method=RequestMethod.GET)
	public @ResponseBody Account changeAccount(Model model, @RequestParam("accountCode") int accountCode){
		log.debug("UserController changeAccountPage 회원계좌정보수정 페이지 요청");
		Account account = service.getAccountByAccountCode(accountCode);
		if(account != null){
			log.debug("UserController changeAccountPage 회원계좌정보 조회 성공");
			model.addAttribute("account", account);
		} else {
			log.debug("UserController changeAccountPage 회원계좌정보 조회 실패");
		}
		return account;
	}
	
	//계좌 삭제 요청 처리
	@RequestMapping(value="/deleteaccount.user", method = RequestMethod.POST)
    public String deleteAccount(HttpSession session, @RequestParam("accountCode") int accountCode) { //커맨드 객체
        log.debug("UserController deleteAccount 계좌삭제 요청 : "+session.getAttribute("id").toString());
        Account account = service.getAccountByAccountCode(accountCode);
        String redirect = null;
        if(account != null){
        	 log.debug("삭제요청된 "+session.getAttribute("nickname")+"님의 계좌 조회 성공");
        	 int deleteresult = service.removeAccountByAccountCode(accountCode);
        	 if(deleteresult == 1){
             	log.debug(session.getAttribute("nickname")+"님의 계좌 삭제 성공");
             	redirect = "redirect:/mypage.user";
             } else {
             	log.debug(session.getAttribute("nickname")+"님의 계좌 삭제 실패");
             	redirect = "redirect:/mypage.user";
             }
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 계좌가 존재하지 않습니다");
        	redirect = "redirect:/mypage.user";
        }
        return redirect; // 글입력후 "/"로 리다이렉트(재요청)
    }
	
	//투자자, 사이트관리자의 계좌 등록 요청 처리
	@RequestMapping(value="/addnewaccount.user", method = RequestMethod.POST)
    public String addAccount(HttpSession session, Account account) { //커맨드 객체
        log.debug("UserController addAccount 새로운 계좌등록 요청 : "+account);
        int result = service.addAccount(account);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 새로운 계좌등록 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 새로운 계좌등록 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	
	//비밀번호 변경 요청 처리(두개의 변수를 파라미터맵을 사용하여 입력한 뒤 업데이트, Map객체 이용)
	@RequestMapping(value="/changepw.user", method = RequestMethod.POST)
    public String changePw(HttpSession session, @RequestParam("newpw2") String pw) { //커맨드 객체
        log.debug("UserController session에 입력된 id로 회원정보 update : "+session.getAttribute("id").toString());
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userId", session.getAttribute("id").toString());
        map.put("pw", pw);
        int result = service.modifyUserPw(map);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 비밀번호 변경 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 비밀번호 변경 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/mypage.user"로 리다이렉트(재요청)
    }
	
	//회원정보 중 비밀번호 변경시 비밀번호 일치확인 요청 처리
	@RequestMapping(value="/checkNewPw.user", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkNewPw(Locale locale,
						  Model model,
						  @RequestParam("newpw1") String pw1,
						  @RequestParam("newpw2") String pw2
			){
				log.debug("UserController newpw1 : "+pw1);
				log.debug("UserController newpw2 : "+pw2);
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("newpw1", pw1);
				map.put("newpw2", pw2);
			return map;
	}
	
	//회원상세정보입력 페이지 요청(회원상세정보 조회/수정은 mypage part에서 구현)
	@RequestMapping(value="/userdetailinsert.user", method=RequestMethod.GET)
	public String userdetailinsertpage(HttpSession session){
		log.debug("userdetailinsertpage 회원상세정보입력 페이지 요청 처리");
		String redirect = null;
		if(service.getUserDetail(session.getAttribute("id").toString())!=null){
			redirect = "redirect:/mypage.user";
		} else {
			redirect = "user/userdetailinsert";
		}
		return redirect;
	}
	
	//회원상세정보입력 처리
	@RequestMapping(value="/userdetailinsert.user", method=RequestMethod.POST)
	public String userdetailinsert(UserDetail userdetail){
		log.debug("userdetailinsert 회원상세정보입력 요청 처리");
		service.addUserDetail(userdetail);
		return "redirect:/mypage.user";
	}

	//로그아웃 요청 처리
	@RequestMapping(value="/logout.user", method=RequestMethod.POST)
	public String logout(HttpSession session, SessionStatus status, Model model){
		log.debug("logout 요청 처리");
		//session 종료 처리
		session.setAttribute("userLogin", null);
		model.addAttribute("id", null);
		model.addAttribute("nickname", null);
		model.addAttribute("level", null);
		model.addAttribute("rank", null);
		status.setComplete();
		session.invalidate();
		log.debug("session 종료 처리");
		return "redirect:/";
	}
	
	//로그인 페이지 요청
	@RequestMapping(value="/login.user", method=RequestMethod.GET)
	public String login(){
		log.debug("UserController login 페이지 요청 처리");
		return "redirect:/";
	}
	
	//로그인 요청 처리
	@RequestMapping(value="/login.user", method=RequestMethod.POST)
	public String login(Model model, 
						  HttpSession session,
						  @RequestParam("id") String id,
						  @RequestParam("pw") String pw
						 ){
		log.debug("UserController login 요청 처리");
		UserAndLevelAndEmployeeAndCompanyAndRank loginUser = service.gettUserByIdLevelnameRankname(id);
		//아이디와 비밀번호 일치여부 확인
		if(loginUser != null){
			if(id.equals(loginUser.getUserId())){
				if(pw.equals(loginUser.getPw())){
					log.debug("login 아이디, 비밀번호 일치");
					//아이디, 비밀번호 일치할 경우 세션값 설정, @SessionAttributes를 통해 세션 객체에 담을 변수와 값 설정
					session.setAttribute("userLogin", loginUser);
					model.addAttribute("id", loginUser.getUserId());
					model.addAttribute("nickname", loginUser.getNickname());
					model.addAttribute("level", loginUser.getUserlevel().getUserLevelName());
					if(loginUser.getRankcode()!=null){
						if(loginUser.getRankcode().getRankName().equals("경영진")){
							log.debug(id+"님의 권한명 기업회원, 직급명 경영진 세션 설정 완료");
							model.addAttribute("rank", loginUser.getRankcode().getRankName());
						} else {
							log.debug(id+"님의 권한명 기업회원, 직급명 일반사원 세션 설정 완료");
							model.addAttribute("rank", loginUser.getRankcode().getRankName());
						}
					} else {
						log.debug(id+"님의 기업회원 여부 체크; 기업회원 아님");
						model.addAttribute("rank", "");
					}
				} else {
					log.debug("login 비밀번호 불일치");
					model.addAttribute("msg", "비밀번호가 일치하지 않습니다");
				}
			} else {
				log.debug("login 아이디 불일치");
				model.addAttribute("msg", "아이디가 일치하지 않습니다");
			}
		} else {
			log.debug("유효하지 않은 아이디 또는 비밀번호 입력");
			model.addAttribute("msg", "유효하지 않은 아이디 또는 비밀번호가 입력되었습니다");
		}
		return "redirect:/";
	}
	
	//회원가입시 닉네임 중복 체크 ajax 요청 처리
	@RequestMapping(value="/checkNick.user", method = RequestMethod.POST)
	public @ResponseBody User checkNick(Locale locale, Model model, @RequestParam("nickname") String nickname){
		log.debug("UserController checknick : "+service.getUserByNickname(nickname).getNickname());
		return service.getUserByNickname(nickname);
	}
	
	//회원가입시 비밀번호 일치 체크 ajax 요청 처리
	@RequestMapping(value="/checkPw.user", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkPw(Locale locale,
						  Model model,
						  @RequestParam("pw1") String pw1,
						  @RequestParam("pw2") String pw2
			){
				log.debug("UserController pw1 : "+pw1);
				log.debug("UserController pw2 : "+pw2);
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("pw1", pw1);
				map.put("pw2", pw2);
			return map;
	}
	
	//회원가입시 아이디 중복 체크 ajax 요청 처리
	@RequestMapping(value="/checkId.user", method = RequestMethod.POST)
	public @ResponseBody User checkId(Locale locale, Model model, @RequestParam("userId") String userId){
		log.debug("UserController checkid : "+userId);
		return service.getUser(userId);
	}
	
	//회원가입 요청
	@RequestMapping(value="/userinsert.user", method = RequestMethod.POST)
    public String userAdd(User user) { //커맨드 객체
        log.debug("UserController user : "+user);
        service.addUser(user);
        return "redirect:/"; // 글입력후 "/"로 리다이렉트(재요청)
    }
    
	//회원가입 페이지 요청
	@RequestMapping(value="/userinsert.user", method = RequestMethod.GET)
    public String userAdd() {
        log.debug("addUserForm 폼 요청");
        return "user/userinsert";
    }
}
