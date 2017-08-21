package com.pineapple.pms.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PmsService implements PmsServiceInterface{
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private PmsDaoInterface pmsdao;
	
	// wbsplan 생성 메서드
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsServiceInterface#addWbsplan(com.pineapple.pms.service.WbsPlan)
	 */
	@Override
	public void addWbsplan(WbsPlan wbsplan){
		log.debug("PmsService의 addWbsplan호출 성공");
		pmsdao.insertWbsPlan(wbsplan);
	}

	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsServiceInterface#getMyWbsPlanList(java.lang.String)
	 */
	@Override
	public List<WbsPlanView> getMyWbsPlanList(String userId) {
		log.debug("PmsService의 getMyWbsPlanList호출 성공");
		return pmsdao.WbsPlanSelect(userId);
	}
	
	@Override
	public List<WbsPlanHuman> getMyWbsPlanHumanList(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanList호출 성공");
		return pmsdao.getMyWbsPlanHumanList(wbsplancode);
	}
	@Override
	public List<WbsPlanMaterial> getMyWbsPlanMaterialList(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanMaterialList호출 성공");
		return pmsdao.getMyWbsPlanMaterialList(wbsplancode);
	}
	
	@Override
	public List<WbsPlanFacility> getMyWbsPlanFacilityList(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanFacilityList호출 성공");
		return pmsdao.getMyWbsPlanFacilityList(wbsplancode);
	}
	
	@Override
	public List<WbsPlanOut> getMyWbsPlanOutList(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanOutList호출 성공");
		return pmsdao.getMyWbsPlanOutList(wbsplancode);
	}
	
	@Override
	public List<WbsPlanEtc> getMyWbsPlanEtcList(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanFacilityList호출 성공");
		return pmsdao.getMyWbsPlanEtcList(wbsplancode);
	}
	
	@Override
	public List<WbsPlanIncome> getMyWbsPlanIncomeyList(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanFacilityList호출 성공");
		return pmsdao.getMyWbsPlanIncomeyList(wbsplancode);
	}
	
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsServiceInterface#getMyWbsPlanDetail(java.lang.String)
	 */
	@Override
	public  WbsPlanView getMyWbsPlanDetail(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanList호출 성공");
		WbsPlanView wbsplandetail = pmsdao.getMyWbsPlanDetail(wbsplancode);
		return wbsplandetail;
	}
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsServiceInterface#addWbsplanhuman(com.pineapple.pms.service.WbsPlanHuman)
	 */
	@Override
	public void addWbsplanhuman(WbsPlanHuman wbsplanhuman){
		log.debug("PmsService의 addWbsplanhuman호출 성공");
		pmsdao.addWbsplanhuman(wbsplanhuman);
	}
	@Override
	public void addWbsplanMaterial(WbsPlanMaterial wbsplanmaterial){
		log.debug("PmsService의 addWbsplanMaterial호출 성공");
		pmsdao.addWbsplanMaterial(wbsplanmaterial);
	}
	
	@Override
	public void wbsplanfacilityinsert(WbsPlanFacility wbsplanfacility){
		log.debug("PmsService의 wbsplanfacilityinsert호출 성공");
		pmsdao.wbsplanfacilityinsert(wbsplanfacility);
	}
	
	@Override
	public void wbsplanoutinsert(WbsPlanOut wbsplanout){
		log.debug("PmsService의 wbsplanoutinsert호출 성공");
		pmsdao.wbsplanoutinsert(wbsplanout);
	}
	
	@Override
	public void wbsplanetcinser(WbsPlanEtc wbsplanetc){
		log.debug("PmsService의 wbsplanetcinser호출 성공");
		pmsdao.wbsplanetcinser(wbsplanetc);
	}
	
	@Override
	public void wbsplanincomeinsert(WbsPlanIncome wbsplanincome){
		log.debug("PmsService의 wbsplanincomeinsert호출 성공");
		pmsdao.wbsplanincomeinsert(wbsplanincome);
	}
	
	@Override
	public void deletewbsplanhuman(String wbhcode){
		log.debug("PmsService의 deletewbsplanhuman호출 성공");
		pmsdao.deletewbsplanhuman(wbhcode);
	}
	
	
	@Override
	public void deletewbsplanmaterial(String wbmcode){
		log.debug("PmsService의 deletewbsplanmaterial호출 성공");
		pmsdao.deletewbsplanmaterial(wbmcode);
	}
	
	@Override
	public void updatewbsplanhuman(WbsPlanHuman wbsplanhuman){
		log.debug("PmsService의 updatewbsplanhuman호출 성공");
		pmsdao.updatewbsplanhuman(wbsplanhuman);
	}
	
	@Override
	public void wbsplanmaterialupdate(WbsPlanMaterial wbsplanmaterial){
		log.debug("PmsService의 wbsplanmaterialupdate호출 성공");
		pmsdao.wbsplanmaterialupdate(wbsplanmaterial);
	}
	
	@Override
	public void wbsplanfacilityupdate(WbsPlanFacility wbsplanfacility){
		log.debug("PmsService의 wbsplanfacilityupdate호출 성공");
		pmsdao.wbsplanfacilityupdate(wbsplanfacility);
	}
	
	@Override
	public void wbsplanoutupdate(WbsPlanOut wbsplanout){
		log.debug("PmsService의 wbsplanoutupdate호출 성공");
		pmsdao.wbsplanoutupdate(wbsplanout);
	}
	
	@Override
	public void wbsplanetcupdate(WbsPlanEtc wbsplanetc){
		log.debug("PmsService의 wbsplanetcupdate호출 성공");
		pmsdao.wbsplanetcupdate(wbsplanetc);
	}
	
	
	@Override
	public void wbsplanincomeupdate(WbsPlanIncome wbsplanincome){
		log.debug("PmsService의 wbsplanincomeupdate호출 성공");
		pmsdao.wbsplanincomeupdate(wbsplanincome);
	}
	
	
	
	
 
}
