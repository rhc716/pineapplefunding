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
import org.springframework.web.bind.annotation.ResponseBody;

import com.pineapple.pms.service.PmsService;
import com.pineapple.pms.service.WbsActual;
import com.pineapple.pms.service.WbsPlan;
import com.pineapple.pms.service.WbsPlanEtc;
import com.pineapple.pms.service.WbsPlanFacility;
import com.pineapple.pms.service.WbsPlanHuman;
import com.pineapple.pms.service.WbsPlanIncome;
import com.pineapple.pms.service.WbsPlanMaterial;
import com.pineapple.pms.service.WbsPlanOut;
import com.pineapple.pms.service.WbsPlanView;
import com.pineapple.pms.service.WbsPlanUpdate;

@Controller
public class PmsController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private PmsService service;
	
	// wbsplan입력 페이지 요청
	@RequestMapping(value = "/wbsplaninsert.pms", method = RequestMethod.GET)
	public String addWbsplan(Locale locale, Model model) {
		log.debug("PmsController의 addWbsplan호출 성공");
		return "pms/companyuser/wbs/wbsplaninsert";
	}
	
	// wbsactual입력 페이지 요청
	@RequestMapping(value = "/wbsactualinsertform.pms", method = RequestMethod.GET)
	public String addWbsactualPage(Locale locale, Model model) {
		log.debug("PmsController의 addWbsactualPage호출 성공");                                                                                                                   
		return "pms/companyuser/wbs/wbsactualinsert";
	}
	
	@RequestMapping(value = "/wbsactualinsert.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsactualinsert(WbsActual wbsactual,Locale locale, Model model) {
		log.debug("wbsactual 내용 "+wbsactual);         
		service.wbsactualinsert(wbsactual);
		log.debug("PmsController의 wbsactualinsert호출 성공");                                                                                                                   
		return "pms/companyuser/wbs/wbsactualinsert";
	}
	
	
	
	@RequestMapping(value = "/insertwbsactual.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsactualinsertfrom(WbsActual wbsactual,Locale locale, Model model, HttpServletRequest request) {
		log.debug("PmsController의 wbsactualinsertfrom호출 성공");
		model.addAttribute("wbsactual", wbsactual);
		log.debug("WbsActual값"+wbsactual);
		return "pms/companyuser/wbs/wbsactualinsertform";
	}

	// wbsplan 상세보기 페이지
	@RequestMapping(value = "/wbsplandetail.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplandetail(WbsPlan wbsplan,Locale locale, Model model, HttpServletRequest request) {
		String btn = request.getParameter("btn");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("btn"+btn);
		if(btn.equals("detail")){	
			log.debug("PmsController의 wbsplandetail의 detail호출 성공");
			log.debug("wbs코드" + wbsplancode);
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			log.debug(wbsplandetail+"<------PmsController[wbsplandetail 값 출력]");
			return "pms/companyuser/wbs/wbsplandetail";
		}else if(btn.equals("delete")){
			log.debug("PmsController의 wbsplandetail의 delete호출 성공");
			log.debug("wbs코드" + wbsplancode);
			service.deletewbsplan(wbsplancode);
			return "redirect:/wbsplanlistpage.pms";
		}else{
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
			return "redirect:/wbsplanlistpage.pms";
		}
		
	}
	
	// wbsplan 상세보기 페이지
	@RequestMapping(value = "/wbsactualdetail.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsactualdetail(WbsActual wbsactual,Locale locale, Model model, HttpServletRequest request) {
		String btn = request.getParameter("btn");
		String wbsActualCode = request.getParameter("wbsActualCode");
		log.debug("btn"+btn);
		if(btn.equals("detail")){	
			log.debug("PmsController의 wbsactualdetail의 detail호출 성공");
			log.debug("wbs코드" + wbsActualCode);
			WbsActual wbsactualdetail;
			wbsactualdetail = service.wbsactualdetail(wbsActualCode);
			model.addAttribute("wbsactualdetail",wbsactualdetail);
			log.debug(wbsactualdetail+"<------PmsController[wbsplandetail 값 출력]");
			return "pms/companyuser/wbs/wbsplandetail";
		}else if(btn.equals("delete")){
			log.debug("PmsController의 wbsactualdetail의 delete호출 성공");
			log.debug("wbs코드" + wbsActualCode);
			service.deletewbsplan(wbsActualCode);
			return "redirect:/wbsplanlistpage.pms";
		}else{
			log.debug("PmsController의 wbsactualdetail의 update호출 성공");
			log.debug("WbsPlan" + wbsactual);
			
			return "redirect:/wbsplanlistpage.pms";
		}
		
	}
	
	//wbsplan 리스트페이지 불러오기
	@RequestMapping(value = "/wbsplanlistpage.pms", method = RequestMethod.GET)
	public String WbsPlanList(Locale locale, Model model) {
		log.debug("PmsController의 wbsplanlistpage호출 성공");
		return "pms/companyuser/wbs/wbsplanlist";
	}
	
	//wbsplan 리스트내용 불러오기
	@RequestMapping(value = "/wbsplanlist.pms", method = RequestMethod.GET)
	public @ResponseBody List<WbsPlanView> getMyWbsPlanList(Locale locale, Model model, @RequestParam("userId") String userId) {
		log.debug("userId : " + userId);
		log.debug("PmsController의 wbsplanlist호출 성공");
		log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyWbsPlanList(userId));;
		return service.getMyWbsPlanList(userId);
	}
	
	//wbsactual 리스트페이지 불러오기
	@RequestMapping(value = "/wbsactuallistform.pms", method = RequestMethod.GET)
	public String wbsactuallistform(Locale locale, Model model) {
		log.debug("PmsController의 wbsactuallistform호출 성공");
		return "pms/companyuser/wbs/wbsactuallist";
	}
	
	//wbsactual 리스트내용 불러오기
	@RequestMapping(value = "/wbsactuallist.pms", method = RequestMethod.GET)
	public @ResponseBody List<WbsActual> wbsactuallist(Locale locale, Model model, @RequestParam("userId") String userId) {
		log.debug("userId : " + userId);
		log.debug("PmsController의 wbsactuallist호출 성공");
		log.debug("컨트롤러에서 받은 리턴값 : " + service.wbsactuallist(userId));;
		return service.wbsactuallist(userId);
	}
	
	// wbsplan 인원 상세보기 리스트 페이지
	@RequestMapping(value ="/wbsplanhumanlist.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplanhumanlist(Locale locale, Model model, HttpServletRequest request){
		log.debug("PmsController의 wbsplanhumanlist호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		List<WbsPlanHuman> wbsplanhumanlist = new ArrayList<WbsPlanHuman>();
		wbsplanhumanlist = service.getMyWbsPlanHumanList(wbsplancode);
		model.addAttribute("wbsplanhumanlist", wbsplanhumanlist);
		return "pms/companyuser/wbs/wbsplanhumanlist";
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
		public String addWbsplan(WbsPlan wbsplan, Model model, Locale locale) {
			log.debug("PmsController의 addWbsplan호출 성공");
			log.debug("WbsPlan : " + wbsplan);
			service.addWbsplan(wbsplan);
			return "redirect:/pmsmain.pms";
		}
		// WbsPlanhuman 입력
		@RequestMapping(value = "/wbsplanhumaninsert.pms", method = RequestMethod.POST)
		public String addWbsplanHuman(WbsPlanHuman wbsplanhuman, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 addWbsplanHuman호출 성공");
			log.debug("wbsplanhuman : " + wbsplanhuman);
			service.addWbsplanhuman(wbsplanhuman);
			//원래 페이지로 돌아가는 코드
			String wbsplancode = request.getParameter("wphWpCode");
			log.debug("wbs코드" + wbsplancode);
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			return "pms/companyuser/wbs/wbsplandetail";
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
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			return "pms/companyuser/wbs/wbsplandetail";
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
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			return "pms/companyuser/wbs/wbsplandetail";
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
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			return "pms/companyuser/wbs/wbsplandetail";
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
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			return "pms/companyuser/wbs/wbsplandetail";
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
			WbsPlanView wbsplandetail;
			wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
			model.addAttribute("wbsplandetail",wbsplandetail);
			return "pms/companyuser/wbs/wbsplandetail";
		}
		
		
		
		

////////////////////////////////////////////////위에는///insert요청////////////////////////////////////////////////////////
////////////////////////////////////////////////아래는///update요청////////////////////////////////////////////////////////		
		
		
		//wbsplanhuman 업데이트
		@RequestMapping(value = "/wbsplanhumanupdate.pms", method = RequestMethod.POST)
		public String wbsplanhumanupdate(WbsPlanHuman wbsplanhuman, Model model, Locale locale,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanhumandelete호출 성공");
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

		
		
////////////////////////////////////////////////위에는///update요청////////////////////////////////////////////////////////
////////////////////////////////////////////////아래는///delete요청////////////////////////////////////////////////////////
		
		
		
		//wbsplanhuman 삭제
		@RequestMapping(value = "/wbsplanhumandelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplanhumandelete(Locale locale, Model model,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanhumandelete호출 성공");
			String wphWpCode = request.getParameter("wphWpCode");
			String wphCode = request.getParameter("wphCode");
			log.debug("wbs코드" + wphWpCode);
			log.debug("wbh코드" + wphCode);
			service.deletewbsplanhuman(wphCode);
			List<WbsPlanHuman> wbsplanhumanlist = new ArrayList<WbsPlanHuman>();
			wbsplanhumanlist = service.getMyWbsPlanHumanList(wphWpCode);
			model.addAttribute("wbsplanhumanlist", wbsplanhumanlist);
			return "pms/companyuser/wbs/wbsplanhumanlist";
		}
		
		///wbsplanmaterial 삭제
		@RequestMapping(value = "/wbsplanmaterialdelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplanmaterialdelete(Locale locale, Model model,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanhumandelete호출 성공");
			String wpmWpCode = request.getParameter("wpmWpCode");
			String wpmCode = request.getParameter("wpmCode");
			log.debug("wbs코드" + wpmWpCode);
			log.debug("wbm코드" + wpmCode);
			service.deletewbsplanmaterial(wpmCode);
			List<WbsPlanMaterial> wbsplanmateriallist = new ArrayList<WbsPlanMaterial>();
			wbsplanmateriallist = service.getMyWbsPlanMaterialList(wpmWpCode);
			model.addAttribute("wbsplanmateriallist", wbsplanmateriallist);
			return "pms/companyuser/wbs/wbsplanmateriallist";
		}
		
		///wbsplanfacility 삭제
		@RequestMapping(value = "/wbsplanfacilitydelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplanfacilitydelete(Locale locale, Model model,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanfacilitydelete호출 성공");
			String wpfWpCode = request.getParameter("wpfWpCode");
			String wpfCode = request.getParameter("wpfCode");
			log.debug("wbs코드" + wpfWpCode);
			log.debug("wbf코드" + wpfCode);
			service.deletewbsplanfacility(wpfCode);
			List<WbsPlanFacility> wbsplanfacilityllist = new ArrayList<WbsPlanFacility>();
			wbsplanfacilityllist = service.getMyWbsPlanFacilityList(wpfWpCode);
			model.addAttribute("wbsplanfacilityllist", wbsplanfacilityllist);
			return "pms/companyuser/wbs/wbsplanfacilitylist";
		}
		
	
		
		///wbsplanout 삭제
		@RequestMapping(value = "/wbsplanoutdelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplanoutdelete(Locale locale, Model model,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanoutdelete호출 성공");
			String wpoWpCode = request.getParameter("wpoWpCode");
			String wpoCode = request.getParameter("wpoCode");
			log.debug("wbs코드" + wpoWpCode);
			log.debug("wbo코드" + wpoCode);
			service.deletewbsplanout(wpoCode);
			List<WbsPlanOut> wbsplanoutlist = new ArrayList<WbsPlanOut>();
			wbsplanoutlist = service.getMyWbsPlanOutList(wpoWpCode);
			model.addAttribute("wbsplanoutlist", wbsplanoutlist);
			return "pms/companyuser/wbs/wbsplanoutlist";
		}
		
		///wbsplanetc 삭제
		@RequestMapping(value = "/wbsplanetcdelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplanetcdelete(Locale locale, Model model,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanetcdelete호출 성공");
			String wpeWpCode = request.getParameter("wpeWpCode");
			String wpeCode = request.getParameter("wpeCode");
			log.debug("wbs코드" + wpeWpCode);
			log.debug("wbe코드" + wpeCode);
			service.deletewbsplanetc(wpeCode);
			List<WbsPlanEtc> wbsplanetclist = new ArrayList<WbsPlanEtc>();
			wbsplanetclist = service.getMyWbsPlanEtcList(wpeWpCode);
			model.addAttribute("wbsplanetclist", wbsplanetclist);
			return "pms/companyuser/wbs/wbsplanetclist";
		}
		
		///wbsplanincome 삭제
		@RequestMapping(value = "/wbsplanincomedelete.pms", method = {RequestMethod.GET, RequestMethod.POST})
		public String wbsplanincomedelete(Locale locale, Model model,HttpServletRequest request) {
			log.debug("PmsController의 wbsplanincomedelete호출 성공");
			String wpiWpCode = request.getParameter("wpiWpCode");
			String wpiCode = request.getParameter("wpiCode");
			log.debug("wbs코드" + wpiWpCode);
			log.debug("wbi코드" + wpiCode);
			service.deletewbsplanincome(wpiCode);
			List<WbsPlanIncome> wbsplanincomelist = new ArrayList<WbsPlanIncome>();
			wbsplanincomelist = service.getMyWbsPlanIncomeyList(wpiWpCode);
			model.addAttribute("wbsplanincomelist", wbsplanincomelist);
			return "pms/companyuser/wbs/wbsplanincomelist";
		}
		

}
