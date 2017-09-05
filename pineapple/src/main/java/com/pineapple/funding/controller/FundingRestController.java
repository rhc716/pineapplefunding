package com.pineapple.funding.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndFdDetail;
import com.pineapple.funding.service.FundingAndFdDividendPlan;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingAndMileStone;
import com.pineapple.funding.service.FundingService;
import com.pineapple.invest.service.Investment;
import com.pineapple.user.service.Company;
import com.pineapple.user.service.Employee;

@RestController
public class FundingRestController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private FundingService service;
		
		// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
		@RequestMapping(value = "/getmyfundinglist.pms", method = RequestMethod.GET)
		public List<Funding> getMyFundingList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingController의 getMyFundingList호출 성공");
			log.debug("userId : " + userId);
			log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyFundinglist(userId));
			return service.getMyFundinglist(userId);
		}

		// 내가 소속된 회사 펀딩, 펀딩상세 정보 담은 리스트 불러오기 ( 기업회원 )
		@RequestMapping(value = "/getmyfundingdetaillist.pms", method = RequestMethod.GET)
		public List<FundingAndFdDetail> getMyFundingDetailList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingController의 getMyFundingDetailList호출 성공");
			log.debug("userId : " + userId);
			return service.getMyFundingDetailList(userId);
		}
		
		// 마일스톤 입력을 위한 조회 (회사코드,펀딩코드,펀딩명)
		@RequestMapping(value = "/getfundingforinsertmilestone.pms", method = RequestMethod.GET)
		public List<Funding> getFundingForInsertMileStone(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingController의 getFundingForInsertMileStone호출 성공");
			log.debug("userId : " + userId);
			return service.getFundingForInsertMileStone(userId);
		}
		
		// 마일스톤 입력을 위한 사원조회
		@RequestMapping(value = "/getemployeeforinsertmilestone.pms", method = RequestMethod.GET)
		public List<Employee> getEmployeeForInsertMileStone(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
			log.debug("FundingController의 getEmployeeForInsertMileStone호출 성공");
			log.debug("fdCode : " + fdCode);
			return service.getEmployeeForInsertMileStone(fdCode);
		}
		
		// 마일스톤조회 // 마일스톤 + 펀딩 리스트 가져오기
		@RequestMapping(value = "/getmymilestonelist.pms", method = RequestMethod.GET)
		public List<FundingAndMileStone> getMyMileStoneList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingController의 getMyMileStoneList호출 성공");
			log.debug("userId : " + userId);
			return service.getMyMileStoneList(userId);
		}
		
		// 펀딩파일 업로드 리스트 가져오기
		@RequestMapping(value = "/getfundingfilelist.pms", method = RequestMethod.GET)
		public List<FundingAndFdFile> getFundingFileList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingController의 getFundingFileList호출 성공");
			log.debug("userId : " + userId);
			return service.getFundingFileList(userId);
		}
		
		// 펀딩배당계획 리스트 가져오기
		@RequestMapping(value = "/getfundingdividendpalnlist.pms", method = RequestMethod.GET)
		public List<FundingAndFdDividendPlan> getFundingDividendPalnList(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
			log.debug("FundingController의 getFundingDividendPalnList호출 성공");
			log.debug("fdCode : " + fdCode);
			return service.getFundingDividendPalnList(fdCode);
		}
		
		// 펀딩별 투자자 리스트 불러오기
		@RequestMapping(value = "/getfundinginvestorlist.pms", method = RequestMethod.GET)
		public List<Investment> getFundingInvestorList(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
			log.debug("FundingController의 getFundingInvestorList호출 성공");
			log.debug("fdCode : " + fdCode);
			return service.getFundingInvestorList(fdCode);
		}
		
		// 펀딩생성에서 사용할 회사정보 가져오기
		@RequestMapping(value = "/getcomlist.pms", method = RequestMethod.GET)
		public List<Company> getComList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingController의 getComList호출 성공");
			log.debug("userId : " + userId);
			return service.getComList(userId);
		}
		
		// 펀딩 insert ( 펀딩명 중복검사 )
		@RequestMapping(value = "/fdtitlecheck.pms", method = RequestMethod.GET)
		public Funding fdtitleCheck(Model model, Locale locale, @RequestParam("fdTitle") String fdTitle) {
			log.debug("FundingController의 fdtitleCheck호출 성공");
			log.debug("fdTitle : " + fdTitle);
			return service.fdtitleCheck(fdTitle);
		}
		
		
		// pmsmain.jsp 에서 권한별로 필요한 정보의 리스트를 ajax요청
		@RequestMapping(value = "/getprojectinfolist.pms", method = RequestMethod.GET)
		public List<Object> getprojectinfolist(Model model, Locale locale
				, @RequestParam("userId") String userId, @RequestParam("userLevel") String level) {
			
			log.debug("FundingController의 getprojectinfolist호출 성공");
			log.debug("userId : " + userId);
			log.debug("level : " + level);
			
			List<Object> list = service.getProjectInfoList(userId, level);
			
			return list;
		}
}
