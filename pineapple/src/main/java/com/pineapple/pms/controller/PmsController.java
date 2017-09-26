package com.pineapple.pms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pineapple.pms.service.PmsService;
import com.pineapple.pms.service.PmsServiceInterface;
import com.pineapple.pms.service.WbsActual;
import com.pineapple.pms.service.WbsPlan;
import com.pineapple.pms.service.WbsPlanEtc;
import com.pineapple.pms.service.WbsPlanFacility;
import com.pineapple.pms.service.WbsPlanHuman;
import com.pineapple.pms.service.WbsPlanIncome;
import com.pineapple.pms.service.WbsPlanMaterial;
import com.pineapple.pms.service.WbsPlanOut;
import com.pineapple.pms.service.WbsPlanUpdate;

@Controller
public class PmsController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private PmsServiceInterface service;	
		
	// wbsactual입력 페이지 요청
	@RequestMapping(value = "/wbsactualinsertform.pms", method = RequestMethod.GET)
	public String addWbsactualPage(Locale locale, Model model) {
		log.debug("PmsController의 addWbsactual Page호출 성공");                                                                                                                   
		return "pms/companyuser/wbs/wbsactualinsert";
	}
		
	//wbsplan 상세보기 페이지
	@RequestMapping(value = "/wbsplandetail.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplandetail(Locale locale, Model model, HttpServletRequest request) {
		log.debug("wbsplandetail호출");
		String wbsplancode = request.getParameter("wbsPlanCode");
		model.addAttribute("wbsplancode",wbsplancode);
		return "pms/companyuser/wbs/wbsplandetail";
	}
	
	//wbsplan 상세보기 페이지
	@RequestMapping(value = "/wbsactualdetail.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsactualdetail(Locale locale, Model model, HttpServletRequest request) {
		log.debug("wbsactualdetail호출");
		String wbsActualCode = request.getParameter("wbsActualCode");
		model.addAttribute("wbsActualCode",wbsActualCode);
		return "pms/companyuser/wbs/wbsactualdetail";
	}
	//wbsplan 입력후 상세보기 페이지
		@RequestMapping(value = "/wbsplandetail2.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplandetail2(@RequestParam("wbsplancode") int wbsplancode,Locale locale, Model model, HttpServletRequest request) {
			model.addAttribute("wbsplancode",wbsplancode);
			return "pms/companyuser/wbs/wbsplandetail";
		}

	//wbsplan업데이트
	@RequestMapping(value = "/wbsplanupdate.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanupdate(WbsPlan wbsplan,Locale locale, Model model, HttpServletRequest request) {
		String wbsplancode = request.getParameter("wbsPlanCode");
		String wbsPlanName = request.getParameter("wbsPlanName");
		String wbsPlanDependency=request.getParameter("wbsPlanDependency");
		String wbsPlanDuration = request.getParameter("wbsPlanDuration");
		String wbsPlanStartDate = request.getParameter("wbsPlanStartDate");
		String wbsPlanManager = request.getParameter("wbsPlanManager");
		String wbsPlanName2 = request.getParameter("wbsPlanName2");
		String wbsPlanDependency2 = request.getParameter("wbsPlanDependency2");
		String wbsPlanDuration2 = request.getParameter("wbsPlanDuration2");
		String wbsPlanStartDate2 = request.getParameter("wbsPlanStartDate2");
		String wbsPlanManager2 = request.getParameter("wbsPlanManager2");
		log.debug("첫번쨰 데이터 "+wbsPlanName+" "+wbsPlanDependency+" "+wbsPlanDuration+" "+wbsPlanStartDate+" "+wbsPlanManager);
		log.debug("두번쨰 데이터 "+wbsPlanName2+" "+wbsPlanDependency2+" "+wbsPlanDuration2+" "+wbsPlanStartDate2+" "+wbsPlanManager2);
		if(wbsPlanName.equals(wbsPlanName2)&&wbsPlanDependency.equals(wbsPlanDependency2)&&wbsPlanDuration.equals(wbsPlanDuration2)
				&&wbsPlanStartDate.equals(wbsPlanStartDate2)&&wbsPlanManager.equals(wbsPlanManager2)){
			log.debug("테스트.실패시");
			model.addAttribute("message", "변경사항없음");
			return "pms/companyuser/wbs/wbsplanlist";
		}else{
			log.debug("테스트.성공시");
			log.debug("PmsController의 wbsplandetail의 update호출 성공");
			log.debug("WbsPlan" + wbsplan);
			//수정한 데이터 새로 삽입
			service.addWbsplan(wbsplan);
			//이전 데이터의 상태를 0으로 만듬
			service.updatewbsplan(wbsplancode);
			WbsPlanUpdate wbsplanupdate;
			//기타항목들에 들어갈 wbsplancode를 바뀐데이터로 바꾸기 위해서 코드를 가져옴
			wbsplanupdate = service.wbsplanupdate(wbsplan);
			log.debug("wbsplanupdate" + wbsplanupdate);
			HashMap map = new HashMap<String, Object>();
			map.put("wbsplancode", wbsplancode);
			String changecode = wbsplanupdate.getWbsPlanCode();
			map.put("changecode", changecode);
			log.debug("map테스트" + map);
			service.wbsplanupdateetc(map);
			model.addAttribute("message", "수정완료");
			return "pms/companyuser/wbs/wbsfdlist";
		}
		
	}
	
	
	//wbsplan 리스트페이지 불러오기
	@RequestMapping(value = "/wbsplanlistpage.pms", method = RequestMethod.GET)
	public String WbsPlanList(Locale locale, Model model) {
		log.debug("PmsController의 wbsplanlistpage호출 성공");
		return "pms/companyuser/wbs/wbsfdlist";
	}
	
	
	//wbsactual 리스트페이지 불러오기
	@RequestMapping(value = "/wbsactuallistpage.pms", method = RequestMethod.GET)
	public String wbsactuallistform(Locale locale, Model model) {
		log.debug("PmsController의 wbsactuallistform호출 성공");
		return "pms/companyuser/wbs/wbsactuallist";
	}
	//wbsactual 리스트페이지 불러오기
	@RequestMapping(value = "/wbsactualapprovallistpage.pms", method = RequestMethod.GET)
	public String wbsactualapprovallistform(Locale locale, Model model) {
		log.debug("PmsController의 wbsactuallistform호출 성공");
		return "pms/companyuser/wbs/wbsactualapproval";
	}
	
	// wbsplan 장비 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanmateriallist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanmateriallist(Locale locale, Model model, HttpServletRequest request){
		log.debug("PmsController의 wbsplanhumanlist호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanMaterial> wbsplanmateriallist = new ArrayList<WbsPlanMaterial>();
		wbsplanmateriallist = service.getMyWbsPlanMaterialList(wbsplancode);	
		model.addAttribute("wbsplanmateriallist", wbsplanmateriallist);
		return "pms/companyuser/wbs/wbsplanmateriallist";
	}
	
	// wbsplan 시설 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanfacilitylist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanfacilitylist(Locale locale, Model model, HttpServletRequest request){
		log.debug("PmsController의 wbsplanfacilitylist호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanFacility> wbsplanfacilityllist = new ArrayList<WbsPlanFacility>();
		wbsplanfacilityllist = service.getMyWbsPlanFacilityList(wbsplancode);
		model.addAttribute("wbsplanfacilityllist", wbsplanfacilityllist);
		return "pms/companyuser/wbs/wbsplanfacilitylist";
	}
	
	
	// wbsplan 외주 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanoutlist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanoutlist(Locale locale, Model model, HttpServletRequest request){
		log.debug("PmsController의 wbsplanoutlist호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanOut> wbsplanoutlist = new ArrayList<WbsPlanOut>();
		wbsplanoutlist = service.getMyWbsPlanOutList(wbsplancode);
		model.addAttribute("wbsplanoutlist", wbsplanoutlist);		
		return "pms/companyuser/wbs/wbsplanoutlist";
	}
	
	// wbsplan 기타 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanetclist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanetclist(Locale locale, Model model, HttpServletRequest request){
		log.debug("PmsController의 wbsplanetclist호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanEtc> wbsplanetclist = new ArrayList<WbsPlanEtc>();
		wbsplanetclist = service.getMyWbsPlanEtcList(wbsplancode);
		model.addAttribute("wbsplanetclist", wbsplanetclist);
		return "pms/companyuser/wbs/wbsplanetclist";
	}
	// wbsplan 수익 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanincomelist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanincomelist(Locale locale, Model model, HttpServletRequest request){
		log.debug("PmsController의 wbsplanincomelist호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanIncome> wbsplanincomelist = new ArrayList<WbsPlanIncome>();
		wbsplanincomelist = service.getMyWbsPlanIncomeyList(wbsplancode);
		model.addAttribute("wbsplanincomelist", wbsplanincomelist);
		return "pms/companyuser/wbs/wbsplanincomelist";
	}

////////////////////////////////////////////////위에는///페이지요청////////////////////////////////////////////////////////
////////////////////////////////////////////////아래는///insert요청//////////////////////////////////////////////////////		
		
	
		// WbsPlan 생성
		@RequestMapping(value = "/wbsplaninsert.pms", method = RequestMethod.POST)
		public String addWbsplan(WbsPlan wbsplan, Model model, Locale locale, HttpServletRequest request) {
			log.debug("PmsController의 addWbsplan호출 성공");
			log.debug("WbsPlan : " + wbsplan);
			service.addWbsplan(wbsplan);
			return "redirect:/wbsplanlistpage.pms";
		}
		
		@RequestMapping(value = "/wbsactualinsert.pms", method = RequestMethod.GET)
		public String wbsactualinsert(WbsActual wbsactual, Model model, Locale locale, HttpServletRequest request) {
			log.debug("PmsController의 wbsactualinsert호출 성공");
			log.debug("wbsactual : " + wbsactual);
			service.wbsactualinsert(wbsactual);
			return "redirect:/wbsactuallistpage.pms";
		}
		
		
		// WbsPlanhuman 입력
		@RequestMapping(value = "/wbsplanhumaninsert.pms", method = RequestMethod.POST)
		public String addWbsplanHuman(WbsPlanHuman wbsplanhuman, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 addWbsplanHuman호출 성공");
			log.debug("wbsplanhuman : " + wbsplanhuman);
			service.addWbsplanhuman(wbsplanhuman);
			String wbsplancode = request.getParameter("wphWpCode");
			//원래 페이지로 돌아가는 코드
			log.debug("wbs코드" + wbsplancode);
			model.addAttribute("wbsplancode", wbsplancode );
			return "redirect:/wbsplandetail2.pms";
		}
	
		// WbsPlanmatarial 입력
		@RequestMapping(value = "/wbsplanmaterialinsert.pms", method = RequestMethod.POST)
		public String addWbsplanMaterial(WbsPlanMaterial wbsplanmaterial, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 addWbsplanMaterial호출 성공");
			log.debug("wbsplanhuman : " + wbsplanmaterial);
			service.addWbsplanMaterial(wbsplanmaterial);
			//원래 페이지로 돌아가는 코드
			String wbsplancode = request.getParameter("wpmWpCode");
			log.debug("wbs코드" + wbsplancode);
			model.addAttribute("wbsplancode", wbsplancode );
			return "redirect:/wbsplandetail2.pms";
		}
		
		// WbsPlanfacility 입력
		@RequestMapping(value = "/wbsplanfacilityinsert.pms", method = RequestMethod.POST)
		public String wbsplanfacilityinsert(WbsPlanFacility wbsplanfacility, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanfacilityinsert호출 성공");
			log.debug("wbsplanfacility : " + wbsplanfacility);
			service.wbsplanfacilityinsert(wbsplanfacility);
			//원래 페이지로 돌아가는 코드
			String wbsplancode = request.getParameter("wpfWpCode");
			log.debug("wbs코드" + wbsplancode);
			model.addAttribute("wbsplancode", wbsplancode);
			return "redirect:/wbsplandetail2.pms";
		}
		
		// WbsPlanout 입력
		@RequestMapping(value = "/wbsplanoutinsert.pms", method = RequestMethod.POST)
		public String wbsplanoutinsert(WbsPlanOut wbsplanout, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanoutinsert호출 성공");
			log.debug("wbsplanout : " + wbsplanout);
			service.wbsplanoutinsert(wbsplanout);
			//원래 페이지로 돌아가는 코드
			String wbsplancode = request.getParameter("wpoWpCode");
			log.debug("wbs코드" + wbsplancode);
			model.addAttribute("wbsplancode", wbsplancode);
			return "redirect:/wbsplandetail2.pms";
		}
		
		// WbsPlanetc 입력
		@RequestMapping(value = "/addwbsplanetc.pms", method = RequestMethod.POST)
		public String wbsplanetcinser(WbsPlanEtc wbsplanetc, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanetcinser호출 성공");
			log.debug("wbsplanout : " + wbsplanetc);
			service.wbsplanetcinser(wbsplanetc);
			//원래 페이지로 돌아가는 코드
			String wbsplancode = request.getParameter("wpeWpCode");
			log.debug("wbs코드" + wbsplancode);			
			model.addAttribute("wbsplancode", wbsplancode);
			return "redirect:/wbsplandetail2.pms";
		}
	
	
	
		// WbsPlanincome 입력
		@RequestMapping(value = "/wbsplanincomeinsert.pms", method = RequestMethod.POST)
		public String wbsplanincomeinsert(WbsPlanIncome wbsplanincome, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanincomeinsert호출 성공");
			log.debug("wbsplanincome : " + wbsplanincome);
			service.wbsplanincomeinsert(wbsplanincome);
			//원래 페이지로 돌아가는 코드
			String wbsplancode = request.getParameter("wpiWpCode");
			log.debug("wbs코드" + wbsplancode);
			model.addAttribute("wbsplancode", wbsplancode);
			return "redirect:/wbsplandetail2.pms";
		}
		
	
		
		

////////////////////////////////////////////////위에는///insert요청////////////////////////////////////////////////////////
////////////////////////////////////////////////아래는///update요청////////////////////////////////////////////////////////		
		
		
		//wbsplanhuman 업데이트
		@RequestMapping(value = "/wbsplanhumanupdate.pms", method = RequestMethod.POST)
		public String wbsplanhumanupdate(WbsPlanHuman wbsplanhuman, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanhumanupdate호출 성공");
			String wphWpCode = request.getParameter("wphWpCode");
			log.debug("wbsplanhuman : " + wbsplanhuman);
			log.debug("wbs코드" + wphWpCode);
			service.updatewbsplanhuman(wbsplanhuman);
			List<WbsPlanHuman> wbsplanhumanlist = new ArrayList<WbsPlanHuman>();
			wbsplanhumanlist = service.getMyWbsPlanHumanList(wphWpCode);
			model.addAttribute("wbsplanhumanlist", wbsplanhumanlist);
			return "pms/companyuser/wbs/wbsplanhumanlist";
		}
		
		
		//wbsplanmaterial 업데이트
		@RequestMapping(value = "/wbsplanmaterialupdate.pms", method = RequestMethod.POST)
		public String wbsplanmaterialupdate(WbsPlanMaterial wbsplanmaterial, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanmaterialupdate호출 성공");
			String wpmWpCode = request.getParameter("wpmWpCode");
			log.debug("wbsplanmaterial : " + wbsplanmaterial);
			log.debug("wbs코드" + wpmWpCode);
			service.wbsplanmaterialupdate(wbsplanmaterial);
			List<WbsPlanMaterial> wbsplanmateriallist = new ArrayList<WbsPlanMaterial>();
			wbsplanmateriallist = service.getMyWbsPlanMaterialList(wpmWpCode);
			model.addAttribute("wbsplanmateriallist", wbsplanmateriallist);
			return "pms/companyuser/wbs/wbsplanmateriallist";
		}
		
		//wbsplanfacility 업데이트
		@RequestMapping(value = "/wbsplanfacilityupdate.pms", method = RequestMethod.POST)
		public String wbsplanfacilityupdate(WbsPlanFacility wbsplanfacility, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanfacilityupdate호출 성공");
			String wpfWpCode = request.getParameter("wpfWpCode");
			log.debug("wbsplanfacility : " + wbsplanfacility);
			log.debug("wbs코드" + wpfWpCode);
			service.wbsplanfacilityupdate(wbsplanfacility);
			List<WbsPlanFacility> wbsplanfacilityllist = new ArrayList<WbsPlanFacility>();
			wbsplanfacilityllist = service.getMyWbsPlanFacilityList(wpfWpCode);
			model.addAttribute("wbsplanfacilityllist", wbsplanfacilityllist);
			return "pms/companyuser/wbs/wbsplanfacilitylist";
		}
		
		//wbsplanout 업데이트
		@RequestMapping(value = "/wbsplanoutupdate.pms", method = RequestMethod.POST)
		public String wbsplanoutupdate(WbsPlanOut wbsplanout, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanoutupdate호출 성공");
			String wpoWpCode = request.getParameter("wpoWpCode");
			log.debug("wbsplanout : " + wbsplanout);
			log.debug("wbs코드" + wpoWpCode);
			service.wbsplanoutupdate(wbsplanout);			
			List<WbsPlanOut> wbsplanoutlist = new ArrayList<WbsPlanOut>();
			wbsplanoutlist = service.getMyWbsPlanOutList(wpoWpCode);
			model.addAttribute("wbsplanoutlist", wbsplanoutlist);
			return "pms/companyuser/wbs/wbsplanoutlist";
		}
		
		//wbsplanetc 업데이트
		@RequestMapping(value = "/wbsplanetcupdate.pms", method = RequestMethod.POST)
		public String wbsplanetcupdate(WbsPlanEtc wbsplanetc, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanoutupdate호출 성공");
			String wpeWpCode = request.getParameter("wpeWpCode");
			log.debug("wbsplanetc : " + wbsplanetc);
			log.debug("wbs코드" + wpeWpCode);
			service.wbsplanetcupdate(wbsplanetc);			
			List<WbsPlanEtc> wbsplanetclist = new ArrayList<WbsPlanEtc>();
			wbsplanetclist = service.getMyWbsPlanEtcList(wpeWpCode);
			model.addAttribute("wbsplanetclist", wbsplanetclist);
			return "pms/companyuser/wbs/wbsplanetclist";
		}
		
		//wbsplanincome 업데이트
		@RequestMapping(value = "/wbsplanincomeupdate.pms", method = RequestMethod.POST)
		public String wbsplanincomeupdate(WbsPlanIncome wbsplanincome, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanincomeupdate호출 성공");
			String wpiWpCode = request.getParameter("wpiWpCode");
			log.debug("wbsplanincome : " + wbsplanincome);
			log.debug("wbs코드" + wpiWpCode);
			service.wbsplanincomeupdate(wbsplanincome);			
			List<WbsPlanIncome> wbsplanincomelist = new ArrayList<WbsPlanIncome>();
			wbsplanincomelist = service.getMyWbsPlanIncomeyList(wpiWpCode);
			model.addAttribute("wbsplanincomelist", wbsplanincomelist);
			return "pms/companyuser/wbs/wbsplanincomelist";
		}

		
		
		
		
	
		
}
