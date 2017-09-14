package com.pineapple.funding.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.pineapple.funding.service.FundingServiceInterface;
import com.pineapple.funding.service.MessageAndFd;
import com.pineapple.funding.service.MileStone;
import com.pineapple.invest.service.Investment;
import com.pineapple.user.service.Company;
import com.pineapple.user.service.Employee;

@RestController
public class FundingRestController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private FundingServiceInterface service;
		
		// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
		@RequestMapping(value = "/getmyfundinglist.pms", method = RequestMethod.GET)
		public List<Funding> getMyFundingList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingRestController의 getMyFundingList호출 성공");
			log.debug("userId : " + userId);
			log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyFundinglist(userId));
			return service.getMyFundinglist(userId);
		}

		// 내가 소속된 회사 펀딩, 펀딩상세 정보 담은 리스트 불러오기 ( 기업회원 )
		@RequestMapping(value = "/getmyfundingdetaillist.pms", method = RequestMethod.GET)
		public List<FundingAndFdDetail> getMyFundingDetailList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingRestController의 getMyFundingDetailList호출 성공");
			log.debug("userId : " + userId);
			return service.getMyFundingDetailList(userId);
		}
		
		// 마일스톤 입력을 위한 조회 (회사코드,펀딩코드,펀딩명)
		@RequestMapping(value = "/getfundingforinsertmilestone.pms", method = RequestMethod.GET)
		public List<Funding> getFundingForInsertMileStone(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingRestController의 getFundingForInsertMileStone호출 성공");
			log.debug("userId : " + userId);
			return service.getFundingForInsertMileStone(userId);
		}
		
		// 마일스톤 입력을 위한 사원조회
		@RequestMapping(value = "/getemployeeforinsertmilestone.pms", method = RequestMethod.GET)
		public List<Employee> getEmployeeForInsertMileStone(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
			log.debug("FundingRestController의 getEmployeeForInsertMileStone호출 성공");
			log.debug("fdCode : " + fdCode);
			return service.getEmployeeForInsertMileStone(fdCode);
		}
		
		// 마일스톤조회 // 마일스톤 + 펀딩 리스트 가져오기
		@RequestMapping(value = "/getmymilestonelist.pms", method = RequestMethod.GET)
		public List<FundingAndMileStone> getMyMileStoneList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingRestController의 getMyMileStoneList호출 성공");
			log.debug("userId : " + userId);
			return service.getMyMileStoneList(userId);
		}
		
		// 펀딩파일 업로드 리스트 가져오기
		@RequestMapping(value = "/getfundingfilelist.pms", method = RequestMethod.GET)
		public List<FundingAndFdFile> getFundingFileList(Model model, Locale locale
				,@RequestParam(value="userId", required=false,defaultValue="i") String userId
				,@RequestParam(value="fdCode", required=false,defaultValue="0") int fdCode) {
			log.debug("FundingRestController의 getFundingFileList호출 성공");
			log.debug("userId : " + userId);
			// 펀딩파일 업로드 리스트를 userId로 가져오느냐, 펀딩코드로 가져오느냐를 분기
			if(fdCode==0){
				return service.getFundingFileList(userId);
			}else{
				return service.getFundingFileList(fdCode);
			}
		}
		
		// 펀딩배당계획 리스트 가져오기
		@RequestMapping(value = "/getfundingdividendpalnlist.pms", method = RequestMethod.GET)
		public List<FundingAndFdDividendPlan> getFundingDividendPalnList(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
			log.debug("FundingRestController의 getFundingDividendPalnList호출 성공");
			log.debug("fdCode : " + fdCode);
			return service.getFundingDividendPalnList(fdCode);
		}
		
		// 펀딩별 투자자 리스트 불러오기
		@RequestMapping(value = "/getfundinginvestorlist.pms", method = RequestMethod.GET)
		public List<Investment> getFundingInvestorList(Model model, Locale locale
				, @RequestParam("fdCode") int fdCode
				, @RequestParam(value="numberOfRequests", required=false, defaultValue="0") int numberOfRequests) {
			log.debug("FundingRestController의 getFundingInvestorList호출 성공");
			log.debug("fdCode : " + fdCode);
			return service.getFundingInvestorList(fdCode, numberOfRequests);
		}
		
		// 펀딩생성에서 사용할 회사정보 가져오기
		@RequestMapping(value = "/getcomlist.pms", method = RequestMethod.GET)
		public List<Company> getComList(Model model, Locale locale, @RequestParam("userId") String userId) {
			log.debug("FundingRestController의 getComList호출 성공");
			log.debug("userId : " + userId);
			return service.getComList(userId);
		}
		
		// 펀딩 insert ( 펀딩명 중복검사 )
		@RequestMapping(value = "/fdtitlecheck.pms", method = RequestMethod.GET)
		public Funding fdtitleCheck(Model model, Locale locale, @RequestParam("fdTitle") String fdTitle) {
			log.debug("FundingRestController의 fdtitleCheck호출 성공");
			log.debug("fdTitle : " + fdTitle);
			return service.fdtitleCheck(fdTitle);
		}
		
		
		// pmsmain.jsp 에서 권한별로 필요한 정보의 리스트를 ajax요청
		@RequestMapping(value = "/getprojectinfolist.pms", method = RequestMethod.GET)
		public List<Object> getprojectinfolist(Model model, Locale locale
				, @RequestParam("userId") String userId, @RequestParam("userLevel") String level) {
			
			log.debug("FundingRestController의 getprojectinfolist호출 성공");
			log.debug("userId : " + userId);
			log.debug("level : " + level);
			
			List<Object> list = service.getProjectInfoList(userId, level);
			
			return list;
		}
		
		// pmsmain.jsp 에서 관리자가 펀딩 더보기 버튼을 눌렀을때 추가로 펀딩리스트 10개를 가져옴
		@RequestMapping(value = "/getmorefdlist.pms", method = RequestMethod.GET)
		public List<Object> getMoreFdList(Model model, Locale locale, @RequestParam("numberOfRequests") int numberOfRequests) {
			log.debug("FundingRestController의 getMoreFdList호출 성공");
			log.debug("numberOfRequests : "+numberOfRequests);
			List<Object> list = service.getMoreFdList(numberOfRequests);
			return list;
		}
		// 펀딩코드에 따른 마일스톤 리스트 가져오기
		@RequestMapping(value = "/getmilestonelistoffunding.pms", method = RequestMethod.GET)
		public List<Object> getMilestoneListOfFunding(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
			log.debug("FundingRestController의 getMilestoneListOfFunding호출 성공");
			log.debug("fdCode : "+fdCode);
			List<Object> list = service.getMilestoneListOfFunding(fdCode);
			return list;
		}
		
		// 마일스톤입력에서 사용할 마일스톤 단계 중복검사
		@RequestMapping(value = "/milestonestepcheck.pms", method = RequestMethod.GET)
		public MileStone milestoneStepCheck(Model model, Locale locale, @RequestParam("milestoneStep") int milestoneStep
				, @RequestParam("msFdCode") int msFdCode) {
			log.debug("FundingRestController의 milestoneStepCheck호출 성공");
			log.debug("milestoneStep : " + milestoneStep);
			log.debug("msFdCode : " + msFdCode);
			return service.milestoneStepCheck(msFdCode, milestoneStep);
		}
		
		// 관리자 프로젝트관리 페이지, 펀딩보기에서 마감, 모집실패 상태를 제외한 모든 펀딩리스트를 가져옴 
		@RequestMapping(value = "/getallfundinglist.pms", method = RequestMethod.GET)
		public List<Object> getAllFundingList(Model model, Locale locale) {
			log.debug("FundingRestController의 getAllFundingList호출 성공");
			return service.getAllFundingList();
		}
		
		// 관리자 프로젝트관리 페이지, 펀딩보기에서 마감, 모집실패 상태의 펀딩리스트를 가져옴 
		@RequestMapping(value = "/getendfundinglist.pms", method = RequestMethod.GET)
		public List<Object> getEndFundingList(Model model, Locale locale) {
			log.debug("FundingRestController의 getEndFundingList호출 성공");
			return service.getEndFundingList();
		}
		
		// 바로 위의 마감, 모집실패 상태의 펀딩리스트에서 더보기버튼을 눌렀을때 
		@RequestMapping(value = "/getmoreendfdlist.pms", method = RequestMethod.GET)
		public List<Funding> getMoreEndFdList(Model model, Locale locale, @RequestParam("numberOfRequests") int numberOfRequests) {
			log.debug("FundingRestController의 getMoreEndFdList호출 성공");
			log.debug("numberOfRequests : "+numberOfRequests);
			List<Funding> list = service.getMoreEndFdList(numberOfRequests);
			return list;
		}
		
		// 모든 투자자들에게 공지보내기
		@RequestMapping(value = "/sendmessageallinvestors.pms", produces = "application/text; charset=utf8"
				, method = RequestMethod.POST)
		public String sendMessageAllInvestors(Model model, Locale locale, MessageAndFd messageandfd) throws UnsupportedEncodingException {
			log.debug("FundingRestController의 sendMessageAllInvestors호출 성공");
			log.debug("essageandfd : "+messageandfd);
			String result ="메세지 보내기 ";
			result += String.valueOf(service.sendMessageAllInvestors(messageandfd))+"명 성공";
			log.debug("컨트롤러의 sendMessageAllInvestors 최종 result 결과물 : "+result);
			return result;
		}
		
		// 메인에서 새 메세지가 있을 경우 알림을 위해 ajax 요청
		@RequestMapping(value = "/getmynewmessagenum.pms", method = RequestMethod.GET)
		public int getMyNewMessageNum(Model model, Locale locale, @RequestParam("userId") String userid){
			log.debug("FundingRestController의 getMyNewMessageNum호출 성공");
			log.debug("userid : "+userid);
			int result = 0;
			result = service.getMyNewMessageNum(userid);
			
			return result;
		}
		
		// 메인에서 모집중펀딩순위 랭킹 5를 가져오는 ajax요청
		@RequestMapping(value = "/getcompanyrankingfive.pms", method = RequestMethod.GET)
		public List<Funding> getCompanyRankingFive(Model model, Locale locale){
			log.debug("FundingRestController의 getCompanyRankingFive호출 성공");
			List<Funding> list = new ArrayList<Funding>();
			list = service.getCompanyRankingFive();
			
			return list;
		}
		
}
