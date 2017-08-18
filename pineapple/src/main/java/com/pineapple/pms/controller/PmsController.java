package com.pineapple.pms.controller;

import java.util.ArrayList;
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
import com.pineapple.pms.service.WbsPlan;
import com.pineapple.pms.service.WbsPlanHuman;
import com.pineapple.pms.service.WbsPlanMaterial;
import com.pineapple.pms.service.WbsPlanView;

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
	// wbsplan기타 등등 입력 페이지 요청
	@RequestMapping(value = "/wbsplanetcinsert.pms", method = RequestMethod.GET)
	public String addPlanEtc(Locale locale, Model model) {
		log.debug("PmsController의 addPlanEtc호출 성공");
		return "pms/companyuser/wbs/wbsplanetcinsert";
	}
	

	// wbsplan 상세보기 페이지
	@RequestMapping(value = "/wbsplandetail.pms", method = {RequestMethod.GET, RequestMethod.POST})
	public String wbsplandetail(Locale locale, Model model, HttpServletRequest request) {
		log.debug("PmsController의 wbsplandetail호출 성공");
		String wbsplancode = request.getParameter("wbsPlanCode");
		log.debug("wbs코드" + wbsplancode);
		WbsPlanView wbsplandetail;
		wbsplandetail = service.getMyWbsPlanDetail(wbsplancode);
		model.addAttribute("wbsplandetail",wbsplandetail);
		log.debug(wbsplandetail+"<------PmsController[wbsplandetail 값 출력]");
		return "pms/companyuser/wbs/wbsplandetail";
	}
	
	//wbsplan 리스트페이지 불러오기
	@RequestMapping(value = "/wbsplanlistpage.pms", method = RequestMethod.GET)
	public String WbsPlanList(Locale locale, Model model) {
		log.debug("PmsController의 wbsplanlistpage호출 성공");
		return "pms/companyuser/wbs/wbsplanlist";
	}
	
		
////////////////////////////////////////////////위에는///페이지요청//////////////////////////////////////////////////////
		
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
		
		
		

		//wbsplan 리스트내용 불러오기
		@RequestMapping(value = "/wbsplanlist.pms", method = RequestMethod.GET)
		public @ResponseBody List<WbsPlanView> getMyWbsPlanList(Locale locale, Model model, @RequestParam("userId") String userId) {
			log.debug("userId : " + userId);
			log.debug("PmsController의 wbsplanlist호출 성공");
			log.debug("컨트롤러에서 받은 리턴값 : " + service.getMyWbsPlanList(userId));;
			return service.getMyWbsPlanList(userId);
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
}
