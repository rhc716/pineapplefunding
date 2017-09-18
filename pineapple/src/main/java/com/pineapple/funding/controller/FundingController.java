package com.pineapple.funding.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.objenesis.instantiator.basic.NewInstanceInstantiator;
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
import com.pineapple.funding.service.FundingServiceInterface;
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
    private FundingServiceInterface service;
	
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
	
	//관리자권한 프로젝트관리 펀딩보기페이지 요청
	@RequestMapping(value = "/fundingtotalview.pms", method = RequestMethod.GET)
	public String fundingTotalViewPage(Locale locale, Model model, @RequestParam(value="fdCode", required=false, defaultValue="0") int fdCode) {
		log.debug("FundingController의 fundingTotalViewPage호출 성공");
		log.debug("fundingTotalViewPage의 fdCode : "+fdCode);
		if(fdCode!='0'){
			log.debug("fdCode의 값이 들어왔을때");
			service.getForfundingTotalViewPage(fdCode, model);
		}
		return "pms/adminuser/fundingtotalview";
	}
	
	//관리자권한 프로젝트관리 마일스톤&WBS 페이지 요청
		@RequestMapping(value = "/msandwbstotalview.pms", method = RequestMethod.GET)
		public String msAndWbsTotalView(Locale locale, Model model, @RequestParam(value="fdCode", required=false, defaultValue="0") int fdCode) {
			log.debug("FundingController의 msAndWbsTotalView호출 성공");
			log.debug("msAndWbsTotalView의 fdCode : "+fdCode);
			if(fdCode!='0'){
				log.debug("fdCode의 값이 들어왔을때");
				//service.getForfundingTotalViewPage(fdCode, model);
				
				
			}
			return "pms/adminuser/milestonewbstotalview";
		}
	
	
	// 관리자권한 프로젝트관리 (배당보기페이지)
		@RequestMapping(value = "/dividendlisttotalview.pms", method = RequestMethod.GET)
		public String dividendListTotalView(Locale locale, Model model) {
			log.debug("FundingController의 dividendListTotalView호출 성공");
			return "pms/adminuser/dividendlisttotalview";
		}
		
	// 투자자권한 프로젝트관리 (펀딩보기 페이지)
		@RequestMapping(value = "/investormyfundingview.pms", method = RequestMethod.GET)
		public String investorMyFundingView(Locale locale, Model model) {
			log.debug("FundingController의 investorMyFundingView호출 성공");
			return "pms/investoruser/myfundingview";
		}
	// 투자자권한 프로젝트관리 (마일스톤&WBS 페이지)
		@RequestMapping(value = "/investormymilestonewbsview.pms", method = RequestMethod.GET)
		public String investorMyMilestoneWbsView(Locale locale, Model model) {
			log.debug("FundingController의 investorMyMilestoneWbsView호출 성공");
			return "pms/investoruser/mymilestonewbsview";
		}
	// 투자자권한 프로젝트관리 (배당보기 페이지)
		@RequestMapping(value = "/investormydividendview.pms", method = RequestMethod.GET)
		public String investorMyDividendView(Locale locale, Model model) {
			log.debug("FundingController의 investorMyDividendView호출 성공");
			return "pms/investoruser/mydividendview";
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
	
	// 펀딩수정 ( 기업회원 경영자 )
	@RequestMapping(value = "/modifyfunding.pms", method = RequestMethod.POST)
	public String modifyfunding(Model model, Locale locale, Funding funding, @RequestParam("fdCode") int fdCode) {
		log.debug("FundingController의 modifyfunding호출 성공");
		log.debug("fdCode : " + fdCode);
		log.debug("funding : " + funding);
		service.modifyFunding(funding, fdCode);
		return "pms/companyuser/myfundinglist";
	}
	
	//펀딩상세수정 ( 기업회원 경영자 )
	@RequestMapping(value = "/modifyfundingdetail.pms", method = RequestMethod.POST)
	public String modifyfundingdetail(Model model, Locale locale, FundingDetail fundingdetail) {
		log.debug("FundingController의 modifyfundingdetail호출 성공");
		log.debug("fundingdetail : " + fundingdetail);
		service.modifyFundingDetail(fundingdetail);
		return "pms/companyuser/myfundingdetaillist";
	}
	
	// 마일스톤 입력 
	@RequestMapping(value = "/addmilestone.pms", method = RequestMethod.POST)
	public String addMileStone(MileStone milestone, Model model, Locale locale) {
		log.debug("FundingController의 addMileStone호출 성공");
		log.debug("milestone : " + milestone);
		service.addMileStone(milestone);
		return "redirect:/mymilestonelist.pms";
	}
	
	// 마일스톤 수정 
	@RequestMapping(value = "/modifymilestone.pms", method = RequestMethod.POST)
	public String modifyMileStone(Model model, Locale locale, MileStone mileStone) {
		log.debug("FundingController의 modifyMileStone호출 성공");
		log.debug("mileStone : " + mileStone);
		service.modifyMileStone(mileStone);
		return "pms/companyuser/mymilestonelist";
	}
	
	
	// 펀딩 보고서 업로드 
	@RequestMapping(value = "/addfundingfile.pms", method = RequestMethod.POST)
	public String addFundingFile(Model model, Locale locale, MultipartHttpServletRequest request
			, MultipartFile uploadFile, @RequestParam("fileFdCode") int fdCode, HttpServletResponse response) throws IOException {
		log.debug("FundingController의 addFundingFile호출 성공");
		log.debug("fileFdCode : "+fdCode);
		log.debug("filename : "+uploadFile.getOriginalFilename());
		log.debug("filesize : "+uploadFile.getSize());
		
		// 용량 제한을 10MB로 해줘서 튕겨낸다
		if(uploadFile.getSize() > 83886080){
    		// 10MB 이상
			
    		 response.setCharacterEncoding("UTF-8");
             PrintWriter writer = response.getWriter();
             writer.println("<script type='text/javascript'>");
             writer.println("alert('용량이 10MB를 초과하였습니다');");
             writer.println("history.back();");
             writer.println("</script>");
             writer.flush();
    		 return "pms/companyuser/myfundingposterimg";
		} else {
			// 10MB 이하
			
			//리턴값으로 업로드된 경로+파일명을 가져온다.
			String result = fileutil.fileUpload(request, uploadFile);
			log.debug("result : "+result);
			//업로드된 경로+파일명 그리고 나머지 정보를 DB에 저장해줌
			service.addFundingFile(uploadFile, result, fdCode);
			return "redirect:/fundingfilelistpage.pms";
		}
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
	
	
	// 펀딩배당계획 삭제
	@RequestMapping(value = "/removefundingdividendpaln.pms", method = RequestMethod.GET)
	public String removeFundingDividendPaln(Model model, Locale locale, @RequestParam("divCode") int divCode) {
		log.debug("FundingController의 removeFundingDividendPaln호출 성공");
		log.debug("divCode : " + divCode);
		service.removeFundingDividendPaln(divCode);
		return "redirect:/myfundingdividendplan.pms";
		
	}
	
	// 펀딩 포스터 이미지수정
	@RequestMapping(value = "/modifyfundingimage.pms", method = RequestMethod.POST)
	public String modifyFundingImage(Model model, Locale locale, Funding funding, MultipartFile uploadimage, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
		log.debug("FundingController의 modifyFundingImage호출 성공");
		log.debug("funding : " + funding);		
		log.debug("upload image name : "+uploadimage.getOriginalFilename());
		log.debug("upload image size : "+uploadimage.getSize());
		log.debug("upload image ContentType : "+uploadimage.getContentType());

		// 업로드한 파일이 이미지가 아닐때 튕겨낸다
		String[] filetype = uploadimage.getContentType().split("/");
		log.debug("filetype : " + filetype[0]);
        if(!filetype[0].equals("image")){
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('이미지파일만 업로드가 가능합니다');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "pms/companyuser/myfundingposterimg";
        
        } else {
        	// 업로드한 파일이 이미지일때
        	
        	// 10MB 용량제한을 둬서 튕겨낸다	
        	if(uploadimage.getSize() > 83886080){
        		// 10MB 이상
        		 response.setCharacterEncoding("UTF-8");
                 PrintWriter writer = response.getWriter();
                 writer.println("<script type='text/javascript'>");
                 writer.println("alert('용량이 10MB를 초과하였습니다');");
                 writer.println("history.back();");
                 writer.println("</script>");
                 writer.flush();
        		 return "pms/companyuser/myfundingposterimg";
        	} else {
        		// 10MB 이하
        		
				// 이전에 올렸던 이미지 파일이 있으면 삭제
				int fdCode = funding.getFdCode();
				Funding fundingresult = service.getMyFunding(fdCode);
				log.debug("이전의 펀딩 이미지경로 : " + fundingresult.getPosterImg());		
				if(fundingresult.getPosterImg()!=null){
					fileutil.deleteFile(fundingresult.getPosterImg());
				}
				
				// 새로운 이미지를 파일업로드하고 경로를 DB에서 수정해준다.
				// 업로드되는 파일이 있을때
				if(uploadimage.getSize()!=0){
					//리턴값으로 업로드된 경로+파일명을 가져온다.
					String result = fileutil.fileUpload(request, uploadimage);
					model.addAttribute("posterImg", result);
					model.addAttribute("fdCode", funding.getFdCode());
					service.modifyFundingImage(model);
				}else{
				// 파일을 안올린채 수정완료를 눌렀을때 DB의 이미지에 null값 넣어줌
					model.addAttribute("posterImg", null);
					model.addAttribute("fdCode", funding.getFdCode());
					service.modifyFundingImage(model);
				}
			
				return "redirect:/myfundingposterimgpage.pms";
        	}
        }
	}
	
	// 마일스톤 삭제  
	@RequestMapping(value = "/removemilestone.pms", method = RequestMethod.GET)
	public String removeMileStone(Model model, Locale locale, @RequestParam("delMsCode") int delMsCode) {
		log.debug("FundingController의 removeMileStone호출 성공");
		log.debug("delMsCode : " + delMsCode);
		service.removeMileStone(delMsCode);
		return "redirect:/mymilestonelist.pms";
		
	}
	
	// 펀딩삭제 ( 기업회원 경영자 )
	@RequestMapping(value = "/removefunding.pms", method = RequestMethod.GET)
	public int removeFunding(Model model, Locale locale, @RequestParam("delfdCode") int delfdCode) {
		log.debug("FundingController의 removeFunding호출 성공");
		log.debug("delfdCode : " + delfdCode);
		int result = service.removeFunding(delfdCode);
		log.debug("result : " + result);
		return result;
	}
	
}