package com.pineapple.user.controller;
import com.pineapple.user.service.Company;
import com.pineapple.user.service.Employee;
import com.pineapple.user.service.MypageServiceInterface;
import com.pineapple.user.service.User;
import com.pineapple.user.service.UserDetail;

import java.util.List;
import java.util.Locale;

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
	//기업등록요청시 ajax 활용한 기업명 중복검사 
	@RequestMapping(value="/checkcomname.user", method = RequestMethod.POST)
	public @ResponseBody Company checkComName(Locale locale, @RequestParam("comName") String comName){
		log.debug("checkComName 기업명 중복검사: "+comName);
		return mypageservice.getCompanyByComName(comName);
	}
	
	//사원등록요청 처리(employee 테이블에 insert)
	@RequestMapping(value="/addemployee.user", method = RequestMethod.POST)
    public String addEmployee(HttpSession session, Employee employee) { //커맨드 객체
        log.debug("addEmployee 새로운 사원등록 요청 : "+employee);
        int result = mypageservice.addEmployee(employee);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 새로운 사원등록 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 새로운 사원등록 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	
	//사원등록시 회사검색 요청 처리
	@RequestMapping(value="/selectcompany.user", method = RequestMethod.POST)
    public @ResponseBody Company searchCompany(HttpSession session, Model model, @RequestParam("comName") String comName) { 
        log.debug("searchCompany 회사검색");
        Company mycompany = mypageservice.getMyCompany(comName);
        if(mycompany != null){
        	log.debug(session.getAttribute("nickname")+"님의 소속회사조회 성공");
        	model.addAttribute("mycompany", mycompany);
        } else {
        	log.debug(session.getAttribute("nickname")+"님의  소속회사조회 실패");
        }
        return mycompany;
    }
	//경영진의 회사등록 요청 처리
	@RequestMapping(value="/addnewcompany.user", method = RequestMethod.POST)
    public String addCompany(HttpSession session, Company company) { //커맨드 객체
        log.debug("addCompany 새로운 기업등록 요청 : "+company);
        int result = mypageservice.addCompany(company);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 새로운 기업등록 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 새로운 기업등록 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	//회원상세정보 수정 처리
	@RequestMapping(value="/userdetailmodify.user", method=RequestMethod.POST)
	public String userdetailmodify(HttpSession session, UserDetail userdetail){
		log.debug("userdetailmodify 회원정보수정 처리 요청");
		int result = mypageservice.modifyUserDetail(userdetail);
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
		User user = mypageservice.getInvestorBasic(userId);
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(userId);
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
		log.debug(session.getAttribute("level")+" 권한으로 "+session.getAttribute("nickname")+"님의 investormypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/investormypage";
	}
	//기업회원 중 경영진 마이페이지 분기(회원상세정보조회, 회사등록정보조회, 전체회사조회, 세션아이디로사원조회 기능 포함)
	@RequestMapping(value="/managermypage.user", method=RequestMethod.GET)
	public String managermypage(Model model, HttpSession session){
		log.debug(session.getAttribute("rank")+" 권한으로 "+session.getAttribute("nickname")+"님의 managermypage 페이지로 분기");
		
    	
		return "user/managermypage";
	}
	//기업회원 중 일반사원 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/employeemypage.user", method=RequestMethod.GET)
	public String employeemypage(Model model, HttpSession session){
		log.debug(session.getAttribute("rank")+" 권한으로 "+session.getAttribute("nickname")+"님의 employeemypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/employeemypage";
	}
	//관리자 마이페이지 분기(회원상세정보조회 기능 포함)
	@RequestMapping(value="/adminmypage.user", method=RequestMethod.GET)
	public String adminmypage(Model model, HttpSession session){
		log.debug(session.getAttribute("level")+" 권한으로 "+session.getAttribute("nickname")+"님의 adminmypage 페이지로 분기");
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		return "user/adminmypage";
	}	
	//mypage main 페이지 요청 - 권한별 마이페이지 분기 시점에 필요한 객체 조회 기능 구현(처음 회원가입한 기업회원 레벨의 회원은 rank가 경영진이 아니므로 일반사원 마이페이지로 분기된다)
	@RequestMapping(value="/mypage.user", method=RequestMethod.GET)
	public String mypagemain(HttpSession session, Model model){
		log.debug("공통 mypage main 페이지 요청 - 권한별 분기 예정");
		//모든 권한으로 마이페이지 분기시 회원기본정보와 상세정보 조회
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
		String levelResult = null;
		if(session.getAttribute("level").equals("투자자")){
			levelResult = "user/investormypage";
		} else if(session.getAttribute("level").equals("기업회원")) {
			//기업회원 레벨의 회원이 마이페이지 분기 요청시, 자신의 아이디로 개설한 회사정보조회(회사등록한 경영진만 객체 조회 가능)
	    	List<Company> company = mypageservice.getCompanyByOpenId(session.getAttribute("id").toString());
	    	if(company != null){
				log.debug("getCompanyInfoByOpenId 회사개설정보 조회 성공");
				model.addAttribute("company", company);
			} else {
				log.debug("getCompanyInfoByOpenId 회사개설정보 조회 실패");
			}
	    	//기업회원 레벨의 회원이 마이페이지 분기 요청시, 페이지 로딩시 전체 회사 목록 조회
	    	List<Company> allcompany = mypageservice.getAllCompany();
	        if(allcompany != null){
	        	log.debug(session.getAttribute("nickname")+"님의 전체회사조회 성공");
	         	model.addAttribute("allcompany", allcompany);
	         } else {
	         	log.debug(session.getAttribute("nickname")+"님의  전체회사조회 실패");
	         }
	        //기업회원 레벨의 회원이 마이페이지 분기 요청시, 페이지 로딩시 아이디로 사원등록여부와 사원승인여부 조회
	        List<Employee> employee = mypageservice.getEmployeeById(session.getAttribute("id").toString());
	        if(employee != null){
	        	log.debug(session.getAttribute("nickname")+"님의 사원정보조회 성공");
	         	model.addAttribute("employee", employee);
	         } else {
	         	log.debug(session.getAttribute("nickname")+"님의  사원정보조회 실패");
	         }
	        //기업회원 레벨 중 직급이 경영진인 경우와 일반사원인 경우 마이페이지 분기된다
			if(session.getAttribute("rank").equals("경영진")){
				levelResult = "user/managermypage";
			} else {
				levelResult = "user/employeemypage";
			}
		} else {
			levelResult = "user/adminmypage";
		}
		return levelResult;
	}

}
