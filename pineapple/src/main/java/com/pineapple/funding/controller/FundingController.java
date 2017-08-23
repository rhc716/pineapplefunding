package com.pineapple.funding.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingAndFdDetail;
import com.pineapple.funding.service.FundingAndFdDividendPlan;
import com.pineapple.funding.service.FundingAndMileStone;
import com.pineapple.funding.service.FundingDetail;
import com.pineapple.funding.service.FundingDividendPlan;
import com.pineapple.funding.service.FundingAndFdFile;
import com.pineapple.funding.service.FundingService;
import com.pineapple.funding.service.MileStone;
import com.pineapple.invest.service.Investment;
import com.pineapple.user.service.Company;
import com.pineapple.user.service.Employee;
import com.pineapple.util.FileUtil;



@Controller
public class FundingController { 
	private Logger log = Logger.getLogger(this.getClass());

	// 컨트롤러 ~ 서비스쪽까지 네이밍규칙 add, modify, remove, get
	// 입력, 수정인지 단순 페이지요청인지는 Get, Post로 구분함
	@Autowired
    private FundingService service;
	
	@Autowired
	private FileUtil fileutil;
	
	// pmsmain.jsp 뷰 요청
	@RequestMapping(value = "/pmsmain.pms", method = RequestMethod.GET)
	public String pmsMain(Locale locale, Model model) {
		log.debug("FundingController의 pmsMain호출 성공");
		return "pms/pmsmain";
	} 
	// 펀딩개설하기 페이지 요청
	@RequestMapping(value = "/fundinginsert.pms", method = RequestMethod.GET)
	public String addFunding(Locale locale, Model model) {
		log.debug("FundingController의 addFunding호출 성공");
		return "pms/companyuser/fundinginsert";
	}
	// 펀딩상세정보입력 페이지 요청
	@RequestMapping(value = "/addfundingdetail.pms", method = RequestMethod.GET)
	public String addFundingDetail(Locale locale, Model model) {
		log.debug("FundingController의 addFundingDetail호출 성공");
		return "pms/companyuser/fundingdetailinsert";
	}
	// 마일스톤입력 페이지 요청
	@RequestMapping(value = "/milestoneinsert.pms", method = RequestMethod.GET)
	public String addMilestone(Locale locale, Model model) {
		log.debug("FundingController의 addMilestone호출 성공");
		return "pms/companyuser/milestoneinsert";
	}
	
	// 펀딩조회하기 페이지 요청
	@RequestMapping(value = "/myfundinglistpage.pms", method = RequestMethod.GET)
	public String myFundingListPage(Locale locale, Model model) {
		log.debug("FundingController의 myfundinglistpage호출 성공");
		return "pms/companyuser/myfundinglist";
	}

	// 펀딩상세 리스트 페이지 요청
	@RequestMapping(value = "/myfundingdetaillist.pms", method = RequestMethod.GET)
	public String myFundingDetailList(Locale locale, Model model) {
		log.debug("FundingController의 myfundingdetaillist호출 성공");
		return "pms/companyuser/myfundingdetaillist";
	}
	
	// 마일스톤조회하기 페이지 요청
	@RequestMapping(value = "/mymilestonelist.pms", method = RequestMethod.GET)
	public String myMileStoneListPage(Locale locale, Model model) {
		log.debug("FundingController의 myfundinglistpage호출 성공");
		return "pms/companyuser/mymilestonelist";
	}
	
	// 펀딩보고서 업로드 페이지 요청
	@RequestMapping(value = "/fundingfileuploadpage.pms", method = RequestMethod.GET)
	public String fundingFileUploadPage(Locale locale, Model model) {
		log.debug("FundingController의 fundingFileUploadPage호출 성공");
		return "pms/companyuser/fundingfileupload";
	}
		
	//펀딩파일 리스트 페이지 요청
	@RequestMapping(value = "/fundingfilelistpage.pms", method = RequestMethod.GET)
	public String fundingFileListPage(Locale locale, Model model) {
		log.debug("FundingController의 fundingFileListPage호출 성공");
		return "pms/companyuser/fundingfilelist";
	}
	
	//펀딩배당계획관리 페이지 요청
	
	@RequestMapping(value = "/myfundingdividendplan.pms", method = RequestMethod.GET)
	public String myFundingDividendPlan(Locale locale, Model model) {
		log.debug("FundingController의 myFundingDividendPlan호출 성공");
		return "pms/companyuser/myfundingdividendplan";
	}
	
	//펀딩투자자조회 페이지 요청
	@RequestMapping(value = "/myfundinginvestorlistpage.pms", method = RequestMethod.GET)
	public String myFundingInvestorListPage(Locale locale, Model model) {
		log.debug("FundingController의 myFundingInvestorListPage호출 성공");
		return "pms/companyuser/myfundinginvestorlist";
	}
	
	//펀딩 포스터이미지 관리 페이지 요청
	@RequestMapping(value = "/myfundingposterimgpage.pms", method = RequestMethod.GET)
	public String myFundingPosterImgPage(Locale locale, Model model) {
		log.debug("FundingController의 myFundingPosterImgPage호출 성공");
		return "pms/companyuser/myfundingposterimg";
	}
////////////////////////////////////////////////위에는///페이지요청//////////////////////////////////////////////////////
	
	// 펀딩개설요청 ( 기업회원 경영자 )
	@RequestMapping(value = "/addfunding.pms", method = RequestMethod.POST)
	public String addFunding(Funding funding, Model model, Locale locale) {
		log.debug("FundingController의 addFunding호출 성공");
		log.debug("funding : " + funding);
		
		service.addFunding(funding);
		return "redirect:/myfundinglistpage.pms";
	}
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/getmyfundinglist.pms", method = RequestMethod.GET)
	public @ResponseBody List<Funding> getMyFundingList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getMyFundingList호출 성공");
		log.debug("userId : " + userId);
		log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyFundinglist(userId));
		return service.getMyFundinglist(userId);
	}
	
	// 펀딩삭제 ( 기업회원 경영자 )
	@RequestMapping(value = "/removefunding.pms", method = RequestMethod.GET)
	public @ResponseBody int removeFunding(Model model, Locale locale, @RequestParam("delfdCode") int delfdCode) {
		log.debug("FundingController의 removeFunding호출 성공");
		log.debug("delfdCode : " + delfdCode);
		int result = service.removeFunding(delfdCode);
		log.debug("result : " + result);
		return result;
		
	}
	
	// 펀딩수정 ( 기업회원 경영자 )
	@RequestMapping(value = "/modifyfunding.pms", method = RequestMethod.POST)
	public String modifyfunding(Model model, Locale locale, Funding funding, @RequestParam("fdCode") int fdCode) {
		log.debug("FundingController의 modifyfunding호출 성공");
		log.debug("fdCode : " + fdCode);
		log.debug("funding : " + funding);
		service.modifyFunding(funding, fdCode);
		return "pms/companyuser/myfundinglist";
	}
	
	// 내가 소속된 회사 펀딩, 펀딩상세 정보 담은 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/getmyfundingdetaillist.pms", method = RequestMethod.GET)
	public @ResponseBody List<FundingAndFdDetail> getMyFundingDetailList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getMyFundingDetailList호출 성공");
		log.debug("userId : " + userId);
		return service.getMyFundingDetailList(userId);
	}
	
	//펀딩상세수정 ( 기업회원 경영자 )
	@RequestMapping(value = "/modifyfundingdetail.pms", method = RequestMethod.POST)
	public String modifyfundingdetail(Model model, Locale locale, FundingDetail fundingdetail) {
		log.debug("FundingController의 modifyfundingdetail호출 성공");
		log.debug("fundingdetail : " + fundingdetail);
		service.modifyFundingDetail(fundingdetail);
		return "pms/companyuser/myfundingdetaillist";
	}
	
	// 마일스톤 입력을 위한 조회 (회사코드,펀딩코드,펀딩명)
	@RequestMapping(value = "/getfundingforinsertmilestone.pms", method = RequestMethod.GET)
	public @ResponseBody List<Funding> getFundingForInsertMileStone(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getFundingForInsertMileStone호출 성공");
		log.debug("userId : " + userId);
		return service.getFundingForInsertMileStone(userId);
	}
	
	// 마일스톤 입력 
	@RequestMapping(value = "/addmilestone.pms", method = RequestMethod.POST)
	public String addMileStone(MileStone milestone, Model model, Locale locale) {
		log.debug("FundingController의 addMileStone호출 성공");
		log.debug("milestone : " + milestone);
		service.addMileStone(milestone);
		return "redirect:/mymilestonelist.pms";
	}
	
	// 마일스톤 입력을 위한 사원조회
	@RequestMapping(value = "/getemployeeforinsertmilestone.pms", method = RequestMethod.GET)
	public @ResponseBody List<Employee> getEmployeeForInsertMileStone(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
		log.debug("FundingController의 getEmployeeForInsertMileStone호출 성공");
		log.debug("fdCode : " + fdCode);
		return service.getEmployeeForInsertMileStone(fdCode);
	}
	
	// 마일스톤조회 // 마일스톤 + 펀딩 리스트 가져오기
	@RequestMapping(value = "/getmymilestonelist.pms", method = RequestMethod.GET)
	public @ResponseBody List<FundingAndMileStone> getMyMileStoneList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getMyMileStoneList호출 성공");
		log.debug("userId : " + userId);
		return service.getMyMileStoneList(userId);
	}
	
	// 마일스톤 수정 
	@RequestMapping(value = "/modifymilestone.pms", method = RequestMethod.POST)
	public String modifyMileStone(Model model, Locale locale, MileStone mileStone) {
		log.debug("FundingController의 modifyMileStone호출 성공");
		log.debug("mileStone : " + mileStone);
		service.modifyMileStone(mileStone);
		return "pms/companyuser/mymilestonelist";
	}
	
	
	// 마일스톤 삭제  
	@RequestMapping(value = "/removemilestone.pms", method = RequestMethod.GET)
	public @ResponseBody String removeMileStone(Model model, Locale locale, @RequestParam("delMsCode") int delMsCode) {
		log.debug("FundingController의 removeMileStone호출 성공");
		log.debug("delMsCode : " + delMsCode);
		service.removeMileStone(delMsCode);
		return "redirect:/mymilestonelist.pms";
		
	}
	
	// 펀딩 보고서 업로드 
	@RequestMapping(value = "/addfundingfile.pms", method = RequestMethod.POST)
	public String addFundingFile(Model model, Locale locale, MultipartHttpServletRequest request, MultipartFile uploadFile, @RequestParam("fileFdCode") int fdCode) {
		log.debug("FundingController의 addFundingFile호출 성공");
		log.debug("fileFdCode : "+fdCode);
		log.debug("filename : "+uploadFile.getOriginalFilename());
		log.debug("filesize : "+uploadFile.getSize());
		//리턴값으로 업로드된 경로+파일명을 가져온다.
		String result = fileutil.fileUpload(request, uploadFile);
		log.debug("result : "+result);
		//업로드된 경로+파일명 그리고 나머지 정보를 DB에 저장해줌
		service.addFundingFile(uploadFile, result, fdCode);
		return "redirect:/fundingfilelistpage.pms";
	}
	
	// 펀딩파일 업로드 리스트 가져오기
	@RequestMapping(value = "/getfundingfilelist.pms", method = RequestMethod.GET)
	public @ResponseBody List<FundingAndFdFile> getFundingFileList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getFundingFileList호출 성공");
		log.debug("userId : " + userId);
		return service.getFundingFileList(userId);
	}
	
	
	// 펀딩파일 다운로드 요청
	@RequestMapping(value = "/calldownload.pms")
	public ModelAndView callDownload(@RequestParam("fileFullPath") String fileFullPath, 
	            HttpServletRequest request, 
	            HttpServletResponse response) throws Exception {
		log.debug("FundingController의 callDownload호출 성공");
	    log.debug("fileFullPath : "+ fileFullPath);
	    File downloadFile = new File(fileFullPath);
	    if(!downloadFile.canRead()){
	        throw new Exception("File can't read(파일을 찾을 수 없습니다)");
	    }
	    return new ModelAndView("fileDownloadView", "downloadFile",downloadFile);
	}
	
	// 펀딩파일 삭제
	@RequestMapping(value = "/deletefundingfile.pms")
	public String removeFundingFile(@RequestParam("fileFullPath") String fileFullPath, @RequestParam("fdFileCode") int fdFileCode) throws Exception {
		log.debug("FundingController의 removeFundingFile호출 성공");
	    log.debug("fileFullPath : "+ fileFullPath);
	    log.debug("fdFileCode : "+ fdFileCode);
	    //실제파일 삭제
	    String result = fileutil.deleteFile(fileFullPath);
	    log.debug("result : "+ result);
	    //DB에서 삭제
	    service.removeFundingFile(fdFileCode);
	    
	    return "redirect:/fundingfilelistpage.pms";
	}
	
	// 펀딩배당계획 입력
	@RequestMapping(value = "/adddividendplan.pms", method = RequestMethod.POST)
	public String addDividendPlan(FundingDividendPlan fundingdividendplan, Model model, Locale locale) {
		log.debug("FundingController의 addDividendPlan호출 성공");
		log.debug("fundingdividendplan : " + fundingdividendplan);
		service.addDividendPlan(fundingdividendplan);
		return "redirect:/myfundingdividendplan.pms";
	}
	
	// 펀딩배당계획 리스트 가져오기
	@RequestMapping(value = "/getfundingdividendpalnlist.pms", method = RequestMethod.GET)
	public @ResponseBody List<FundingAndFdDividendPlan> getFundingDividendPalnList(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
		log.debug("FundingController의 getFundingDividendPalnList호출 성공");
		log.debug("fdCode : " + fdCode);
		return service.getFundingDividendPalnList(fdCode);
	}
	
	// 펀딩배당계획 삭제
	@RequestMapping(value = "/removefundingdividendpaln.pms", method = RequestMethod.GET)
	public String removeFundingDividendPaln(Model model, Locale locale, @RequestParam("divCode") int divCode) {
		log.debug("FundingController의 removeFundingDividendPaln호출 성공");
		log.debug("divCode : " + divCode);
		service.removeFundingDividendPaln(divCode);
		return "redirect:/myfundingdividendplan.pms";
		
	}
	
	// 펀딩별 투자자 리스트 불러오기
	@RequestMapping(value = "/getfundinginvestorlist.pms", method = RequestMethod.GET)
	public @ResponseBody List<Investment> getFundingInvestorList(Model model, Locale locale, @RequestParam("fdCode") int fdCode) {
		log.debug("FundingController의 getFundingInvestorList호출 성공");
		log.debug("fdCode : " + fdCode);
		return service.getFundingInvestorList(fdCode);
	}
	
	// 펀딩생성에서 사용할 회사정보 가져오기
	@RequestMapping(value = "/getcomlist.pms", method = RequestMethod.GET)
	public @ResponseBody List<Company> getComList(Model model, Locale locale, @RequestParam("userId") String userId) {
		log.debug("FundingController의 getComList호출 성공");
		log.debug("userId : " + userId);
		return service.getComList(userId);
	}
	
	// 펀딩 포스터 이미지수정
	@RequestMapping(value = "/modifyfundingimage.pms", method = RequestMethod.POST)
	public String modifyFundingImage(Model model, Locale locale, Funding funding) {
		log.debug("FundingController의 modifyFundingImage호출 성공");
		log.debug("funding : " + funding);
		model.addAttribute("posterImg", funding.getPosterImg());
		model.addAttribute("fdCode", funding.getFdCode());
		service.modifyFundingImage(model);
		model.addAttribute("posterImg", null);
		return "redirect:/myfundingposterimgpage.pms";
	}
}