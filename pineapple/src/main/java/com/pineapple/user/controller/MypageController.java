package com.pineapple.user.controller;
import com.pineapple.invest.service.InvestorInvestList;
import com.pineapple.user.service.Account;
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
	
	//경영진의 사원등록요청 승인 처리
	@RequestMapping(value="/approveemployee.user", method = RequestMethod.POST)
    public String approveEmployee(HttpSession session, Employee employee) { //커맨드 객체
        log.debug("approveEmployee 사원정보 승인처리 요청 : "+employee);
        int result = mypageservice.modifyEmployeeInfo(employee);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 사원등록요청 승인 처리 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 사원등록요청 승인  처리 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	       
	//경영진의 개별 사원등록요청별 승인 페이지 구성
	@RequestMapping(value="/approveemployeepage.user", method=RequestMethod.GET)
	public @ResponseBody Employee approveEmployeePage(Model model, @RequestParam("emCode") int emCode){
		log.debug("MypageController approveEmployeePage 사원등록승인 페이지 요청");
		Employee employee = mypageservice.getEmployeeByEmCode(emCode);
		if(employee != null){
			log.debug("MypageController approveEmployeePage 승인할 사원정보 조회 성공");
			model.addAttribute("employee", employee);
		} else {
			log.debug("MypageController approveEmployeePage 승인할 사원정보 조회 실패");
		}
		return employee;
	}
	
	//경영진이 마이페이지 사원승인 탭에서, 각 회사 사원정보보기 버튼을 클릭하면 자신이 소속된 기업에 사원등록요청한 사원 목록 조회
	@RequestMapping(value="/getemrequestlist.user", method=RequestMethod.GET)
	public @ResponseBody List<Employee> getEmployeeRequestListByComName(HttpSession session, Model model, @RequestParam("comName") String comName){
		log.debug("MypageController getEmployeeRequestListByComName 기업에 속한 사원등록 목록 요청");
		List<Employee> employeeRequestList = mypageservice.getEmployeeRequestList(comName);
        if(employeeRequestList != null){
        	log.debug(session.getAttribute("nickname")+"님의 기업에 사원등록요청목록 조회 성공");
         	model.addAttribute("employeeRequestList", employeeRequestList);
         } else {
         	log.debug(session.getAttribute("nickname")+"님의  기업에 사원등록요청목록 조회 실패");
         }
		return employeeRequestList;
	}
	
	//사원등록정보 확인 모달에서 사원정보(주로 부서명) 수정하기 요청 처리
	@RequestMapping(value="/changeemployeeinfo.user", method = RequestMethod.POST)
    public String modifyEmployeeInfo(HttpSession session, Employee employee) { //커맨드 객체
        log.debug("modifyEmployeeInfo 사원정보 수정처리 요청 : "+employee);
        int result = mypageservice.modifyEmployeeInfo(employee);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 사원정보 수정 처리 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 사원정보 수정 처리 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	
	//마이페이지 사원정보 수정 페이지 요청
	@RequestMapping(value="/employeechangepage.user", method=RequestMethod.GET)
	public @ResponseBody Employee modifyEmployeePage(Model model, @RequestParam("emCode") int emCode){
		log.debug("MypageController modifyEmployeePage 사원정보수정 페이지 요청");
		Employee employee = mypageservice.getEmployeeByEmCode(emCode);
		if(employee != null){
			log.debug("MypageController changeEmployee 사원정보 조회 성공");
			model.addAttribute("employee", employee);
		} else {
			log.debug("MypageController changeAccountPage 사원정보 조회 실패");
		}
		return employee;
	}
	
	//경영진 마이페이지 개설한 기업정보 수정 요청 처리
	@RequestMapping(value="/changecompanyinfo.user", method = RequestMethod.POST)
    public String modifyCompanyInfo(HttpSession session, Company company) { //커맨드 객체
        log.debug("modifyCompanyInfo 기업정보 수정처리 요청 : "+company);
        int result = mypageservice.modifyCompanyInfo(company);
        if(result == 1){
        	log.debug(session.getAttribute("nickname")+"님의 기업정보 수정 처리 성공");
        } else {
        	log.debug(session.getAttribute("nickname")+"님의 기업정보 수정 처리 실패");
        }
        return "redirect:/mypage.user"; // 글입력후 "/"로 리다이렉트(재요청)
    }
	
	//마이페이지 기업정보 수정 페이지 요청
	@RequestMapping(value="/companychangepage.user", method=RequestMethod.GET)
	public @ResponseBody Company modifyCompanyPage(Model model, @RequestParam("comCode") int comCode){
		log.debug("MypageController modifyCompanyPage 기업정보수정 페이지 요청");
		Company company = mypageservice.getCompanyByComCode(comCode);
		if(company != null){
			log.debug("MypageController modifyCompanyPage 기업정보 조회 성공");
			model.addAttribute("company", company);
		} else {
			log.debug("MypageController modifyCompanyPage 기업정보 조회 실패");
		}
		return company;
	}

	//투자자 투자내역 조회
	@RequestMapping(value="/investorinvestment.user", method=RequestMethod.GET)
	public String getInvestor(Model model, HttpSession session){
		log.debug("MypageController accountchangepage 투자내역 페이지 요청");
		List<InvestorInvestList> investorinvest = mypageservice.getInvestor(session.getAttribute("id").toString());
		model.addAttribute("investorinvest", investorinvest);
		return "user/investormypageajax/investormypage";
	}
	
	//마이페이지 계좌정보 수정 페이지 요청
	@RequestMapping(value="/accountchangepage.user", method=RequestMethod.GET)
	public @ResponseBody Account changeAccount(Model model, @RequestParam("accountCode") int accountCode){
		log.debug("MypageController accountchangepage 회원계좌정보수정 페이지 요청");
		Account account = mypageservice.getAccountByAccountCode(accountCode);
		if(account != null){
			log.debug("MypageController changeAccountPage 회원계좌정보 조회 성공");
			model.addAttribute("account", account);
		} else {
			log.debug("MypageController changeAccountPage 회원계좌정보 조회 실패");
		}
		return account;
	}
	
	//기업등록요청시 ajax 활용한 기업명 중복검사 
	@RequestMapping(value="/checkcomname.user", method = RequestMethod.POST)
	public @ResponseBody Company checkComName(Locale locale, Model model, @RequestParam("comName") String comName){
		log.debug("checkComName 기업명 중복검사: "+comName);
		Company com = mypageservice.getCompanyByComName(comName);
		model.addAttribute("com", com);
		return com;
		
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
	@RequestMapping(value="/searchcomname.user", method = RequestMethod.GET)
    public @ResponseBody Company searchCompany(HttpSession session, Model model, @RequestParam("comName") String comName) { 
        log.debug("searchCompany 회사검색 요청 : "+comName);
        Company comSearchResult = mypageservice.getMyCompany(comName);
        if(comSearchResult != null){
        	log.debug(session.getAttribute("nickname")+"님의 소속회사조회 성공");
        	model.addAttribute("comSearchResult", comSearchResult);
        } else {
        	log.debug(session.getAttribute("nickname")+"님의  소속회사조회 실패");
        }
        return comSearchResult;
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
		User user = mypageservice.getInvestorBasic(session.getAttribute("id").toString());
    	model.addAttribute("user", user);
    	UserDetail userdetail = mypageservice.getUserDetail(session.getAttribute("id").toString());
    	model.addAttribute("userdetail", userdetail);
    	//경영진이 마이페이지 분기 요청시, 자신의 아이디로 개설한 회사정보조회(회사등록한 경영진만 객체 조회 가능)
    	List<Company> companyOpen = mypageservice.getCompanyByOpenId(session.getAttribute("id").toString());
    	if(companyOpen != null){
			log.debug("getCompanyInfoByOpenId 회사개설정보 조회 성공");
			model.addAttribute("companyOpen", companyOpen);
		} else {
			log.debug("getCompanyInfoByOpenId 회사개설정보 조회 실패");
		}
    	//경영진이 마이페이지 분기 요청시, 페이지 로딩하며 전체 회사 목록 조회
    	List<Company> allcompany = mypageservice.getAllCompany();
        if(allcompany != null){
        	log.debug(session.getAttribute("nickname")+"님의 전체회사조회 성공");
         	model.addAttribute("allcompany", allcompany);
         } else {
         	log.debug(session.getAttribute("nickname")+"님의  전체회사조회 실패");
         }
        //경영진이 마이페이지 분기 요청시, 페이지 로딩시하며 자신의 아이디로 사원등록여부와 사원승인여부 조회
        List<Employee> employeeOneId = mypageservice.getEmployeeById(session.getAttribute("id").toString());
        if(employeeOneId != null){
        	log.debug(session.getAttribute("nickname")+"님의 사원정보조회 성공");
         	model.addAttribute("employeeOneId", employeeOneId);
         } else {
         	log.debug(session.getAttribute("nickname")+"님의  사원정보조회 실패");
         }
        //경영진이 마이페이지 분기 요청시, 페이지 로딩시하며 자신의 아이디로 사원등록여부와 사원승인여부 조회
        List<Employee> comMngRank = mypageservice.getEmployeeMngById(session.getAttribute("id").toString());
        if(comMngRank != null){
        	log.debug(session.getAttribute("nickname")+"님의 사원정보조회 성공");
         	model.addAttribute("comMngRank", comMngRank);
         } else {
         	log.debug(session.getAttribute("nickname")+"님의  사원정보조회 실패");
         }
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
        List<Employee> employeeOneId = mypageservice.getEmployeeById(session.getAttribute("id").toString());
        if(employeeOneId != null){
        	log.debug(session.getAttribute("nickname")+"님의 사원정보조회 성공");
         	model.addAttribute("employeeOneId", employeeOneId);
         } else {
         	log.debug(session.getAttribute("nickname")+"님의  사원정보조회 실패");
         }
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
		String levelResult = null;
		if(session.getAttribute("level").equals("투자자")){
			levelResult = "redirect:/investormypage.user";
		} else if(session.getAttribute("level").equals("기업회원")) {
	        //기업회원 레벨 중 직급이 경영진인 경우와 일반사원인 경우 마이페이지 분기된다
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
