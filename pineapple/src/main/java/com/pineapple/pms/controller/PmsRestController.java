package com.pineapple.pms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.pineapple.funding.service.Funding;
import com.pineapple.funding.service.FundingService;
import com.pineapple.pms.service.WbsMs;
import com.pineapple.pms.service.WbsPlan;
import com.pineapple.pms.service.WbsActual;
import com.pineapple.pms.service.WbsActualBox;
import com.pineapple.pms.service.WbsDailyEtc;
import com.pineapple.pms.service.WbsDailyFacility;
import com.pineapple.pms.service.WbsDailyHuman;
import com.pineapple.pms.service.WbsDailyIncome;
import com.pineapple.pms.service.WbsDailyMatrial;
import com.pineapple.pms.service.WbsDailyOut;
import com.pineapple.pms.service.WbsPlanBox;
import com.pineapple.pms.service.WbsPlanEtc;
import com.pineapple.pms.service.WbsPlanFacility;
import com.pineapple.pms.service.WbsPlanHuman;
import com.pineapple.pms.service.WbsPlanIncome;
import com.pineapple.pms.service.WbsPlanMaterial;
import com.pineapple.pms.service.WbsPlanOut;
import com.pineapple.pms.service.DeleteWbsplan;
import com.pineapple.pms.service.PmsService;


@RestController
public class PmsRestController {
	private Logger log = Logger.getLogger(this.getClass());

	// 컨트롤러 ~ 서비스쪽까지 네이밍규칙 add, modify, remove, get
	// 입력, 수정인지 단순 페이지요청인지는 Get, Post로 구분함
	@Autowired
    private FundingService fservice;
	@Autowired
	private PmsService service;
	
	// 내가 소속된 회사 펀딩 리스트 불러오기 ( 기업회원 )
	@RequestMapping(value = "/wbsfundinglist.pms", method = RequestMethod.GET)
	public List<Funding> Wbsfunding(String userId) {
		log.debug("PmsRestController의 Wbsfunding호출 성공");
		log.debug("userId : " + userId);
		List<Funding> fdlist = fservice.getMyFundinglist(userId);
		log.debug("컨트롤러에서 받은 리턴값 : " +fdlist);
		return fdlist;
	}
	
	//마일스톤리스트 확인
	@RequestMapping(value = "/WbsMs.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public List<WbsMs> WbsMs(String fdCode) {
		log.debug("펀딩코드"+fdCode);
		log.debug("PmsRestController의 WbsMs호출 성공");
		List<WbsMs> mslist = service.wbsmsview(fdCode);
		log.debug("mslist확인"+mslist);
		return mslist;
	}
	
	//wbs플랜리스트 확인
	@RequestMapping(value = "/Wbsplanlist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public List<WbsPlan> Wbsplan(String milestoneCode) {
		log.debug("마일스톤코드"+milestoneCode);
		log.debug("PmsRestController의 Wbsplan호출 성공");
		List<WbsPlan> wbsplan = service.wbsplanlist(milestoneCode);
		log.debug("wbsplan확인"+wbsplan);
		return wbsplan;
	}
	
	//wbs실제리스트 확인
	@RequestMapping(value = "/Wbsactuallist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public List<WbsActual> WbsActual(String milestoneCode) {
		log.debug("마일스톤코드"+milestoneCode);
		log.debug("PmsRestController의 Wbsplan호출 성공");
		List<WbsActual> wbsactual = service.wbsactual(milestoneCode);
		log.debug("wbsactual확인"+wbsactual);
		return wbsactual;
	}
	
		//WbsPlanBox에 들어갈 wbsplan 상세정보
		@RequestMapping(value ="/wbsplanlistview.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public WbsPlanBox wbsplanlistveiw(String wbsplancode){
			log.debug("PmsRestController의 wbsplanlistveiw호출 성공");
			log.debug("wbs코드" + wbsplancode);
			WbsPlanBox wbsplanbox = new WbsPlanBox();
			WbsPlan wbsplan = service.getMyWbsPlanDetail(wbsplancode);
			List<WbsPlanHuman> wbsplanhumanlist = new ArrayList<WbsPlanHuman>();
			wbsplanhumanlist = service.getMyWbsPlanHumanList(wbsplancode);
			List<WbsPlanMaterial> wbsplanmateriallist = new ArrayList<WbsPlanMaterial>();
			wbsplanmateriallist = service.getMyWbsPlanMaterialList(wbsplancode);
			List<WbsPlanFacility> wbsplanfacilityllist = new ArrayList<WbsPlanFacility>();
			wbsplanfacilityllist = service.getMyWbsPlanFacilityList(wbsplancode);
			List<WbsPlanOut> wbsplanoutlist = new ArrayList<WbsPlanOut>();
			wbsplanoutlist = service.getMyWbsPlanOutList(wbsplancode);
			List<WbsPlanEtc> wbsplanetclist = new ArrayList<WbsPlanEtc>();
			wbsplanetclist = service.getMyWbsPlanEtcList(wbsplancode);
			List<WbsPlanIncome> wbsplanincomelist = new ArrayList<WbsPlanIncome>();
			wbsplanincomelist = service.getMyWbsPlanIncomeyList(wbsplancode);
			wbsplanbox.setWbsplan(wbsplan);
			wbsplanbox.setWbsplanhuman(wbsplanhumanlist);
			wbsplanbox.setWbsplanmaterial(wbsplanmateriallist);
			wbsplanbox.setWbsplanfacility(wbsplanfacilityllist);
			wbsplanbox.setWbsplanout(wbsplanoutlist);
			wbsplanbox.setWbsplanetc(wbsplanetclist);
			wbsplanbox.setWbsplanincome(wbsplanincomelist);
			return wbsplanbox;
		}
		
		
		// wbsactual 상세정보
		@RequestMapping(value ="/wbsactuallistview.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public WbsActualBox wbsactuallistveiw(String wbsActualCode){
			log.debug("PmsRestController의 wbsplanlistveiw호출 성공");
			log.debug("wbs코드" + wbsActualCode);
			WbsActualBox wbsactualbox = new WbsActualBox();
			WbsActual wbsactual = service.wbsactualdetail(wbsActualCode);
			List<WbsDailyEtc> wbsdailyetc = new ArrayList<WbsDailyEtc>();
			wbsdailyetc = service.getMyWbsActualEtcList(wbsActualCode);
			List<WbsDailyHuman> wbsdailyhuman = new ArrayList<WbsDailyHuman>();
			wbsdailyhuman = service.getMyWbsActualHumanList(wbsActualCode);
			log.debug("wbsdailyhuman코드" + wbsdailyhuman);
			List<WbsDailyFacility> wbsdailyfacility = new ArrayList<WbsDailyFacility>();
			wbsdailyfacility = service.getMyWbsActualFacility(wbsActualCode);
			List<WbsDailyIncome> wbsdailyincome = new ArrayList<WbsDailyIncome>();
			wbsdailyincome = service.getMyWbsActualIncome(wbsActualCode);
			List<WbsDailyMatrial> wbsdailymatrial = new ArrayList<WbsDailyMatrial>();
			wbsdailymatrial = service.getMyWbsActualMatrial(wbsActualCode);
			List<WbsDailyOut> wbsdailyout = new ArrayList<WbsDailyOut>();
			wbsdailyout = service.getMyWbsActualOut(wbsActualCode);
			wbsactualbox.setWbsactual(wbsactual);
			wbsactualbox.setWbsdailyetc(wbsdailyetc);
			wbsactualbox.setWbsdailyhuman(wbsdailyhuman);
			wbsactualbox.setWbsdailyfacility(wbsdailyfacility);
			wbsactualbox.setWbsdailyincome(wbsdailyincome);
			wbsactualbox.setWbsdailymatrial(wbsdailymatrial);
			wbsactualbox.setWbsdailyout(wbsdailyout);
			return wbsactualbox;
		}
	//WBS실제 완료하여 완료일이 들어감
	@RequestMapping(value = "/updatecopperwbs.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void updatecopperwbs(String wbsActualCode) {
		log.debug("PmsRestController의 updatecopperwbs호출 성공");
		log.debug("wbsActualCode코드" + wbsActualCode);
		service.updatecopperwbs(wbsActualCode);
	}
	//WBS실제 승인하여 승인일이 들어감
	@RequestMapping(value = "/approvalupdate.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void updateapproval(String wbsActualCode) {
		log.debug("PmsRestController의 updateapproval호출 성공");
		log.debug("wbsActualCode코드" + wbsActualCode);
		service.updateapproval(wbsActualCode);
	}
	//WBS실제 승인을 취소하여 완료일이 null
	@RequestMapping(value = "/noapprovalupdate.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void updatenoapproval(String wbsActualCode) {
		log.debug("PmsRestController의 updatenoapproval호출 성공");
		log.debug("wbsActualCode코드" + wbsActualCode);
		service.updatenoapproval(wbsActualCode);
	}


	//wbsplanhuman 삭제
	@RequestMapping(value = "/wbsplanhumandelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanhumandelete(String wphCode) {
		log.debug("PmsRestController의 wbsplanhumandelete호출 성공");
		log.debug("wbh코드" + wphCode);
		service.deletewbsplanhuman(wphCode);
	}
	
	///wbsplanmaterial 삭제
	@RequestMapping(value = "/wbsplanmaterialdelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanmaterialdelete(String wpmCode) {
		log.debug("PmsRestController의 wbsplanmaterialdelete호출 성공");
		log.debug("wbm코드" + wpmCode);
		service.deletewbsplanmaterial(wpmCode);
	}
	
	///wbsplanfacility 삭제
	@RequestMapping(value = "/wbsplanfacilitydelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanfacilitydelete(String wpfCode) {
		log.debug("PmsRestController의 wbsplanfacilitydelete호출 성공");
		log.debug("wbf코드" + wpfCode);
		service.deletewbsplanfacility(wpfCode);	
	}
	
	///wbsplanout 삭제
	@RequestMapping(value = "/wbsplanoutdelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanoutdelete(String wpoCode) {
		log.debug("PmsRestController의 wbsplanoutdelete호출 성공");
		log.debug("wbo코드" + wpoCode);
		service.deletewbsplanout(wpoCode);
	}
	
	///wbsplanetc 삭제
	@RequestMapping(value = "/wbsplanetcdelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanetcdelete(String wpeCode) {
		log.debug("PmsRestController의 wbsplanetcdelete호출 성공");
		log.debug("wbe코드" + wpeCode);
		service.deletewbsplanetc(wpeCode);
	}
	
	///wbsplanincome 삭제
	@RequestMapping(value = "/wbsplanincomedelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplanincomedelete(String wpiCode) {
		log.debug("PmsRestController의 wbsplanincomedelete호출 성공");		
		log.debug("wbi코드" + wpiCode);
		service.deletewbsplanincome(wpiCode);
	}
	
	//wbsplan삭제
	@RequestMapping(value = "/wbsplandelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public void wbsplandelete(DeleteWbsplan delete) {
		log.debug("delete코드" + delete);
		service.deletewbsplan(delete);
	}
}
