package com.pineapple.pms.service;

import java.util.HashMap;
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
	public List<WbsActual> wbsactual(String milestoneCode) {
		log.debug("PmsService의 getMyWbsPlanList호출 성공");
		return pmsdao.wbsactual(milestoneCode);
	}
	
	@Override
	public List<WbsPlan> wbsplanlist(String milestoneCode) {
		log.debug("PmsService의 getMyWbsPlanList호출 성공");
		return pmsdao.wbsplanlist(milestoneCode);
	}
	
	@Override
	public List<WbsMs> wbsmsview(String fdcode) {
		log.debug("PmsService의 wbsmsview호출 성공");
		return pmsdao.wbsmsview(fdcode);
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
	
	@Override
	public List<WbsDailyEtc> getMyWbsActualEtcList(String wbsactualcode) {
		log.debug("PmsService의 getMyWbsActualEtcList호출 성공");
		return pmsdao.getMyWbsActualEtcList(wbsactualcode);
	}
	
	@Override
	public List<WbsDailyHuman> getMyWbsActualHumanList(String wbsactualcode) {
		log.debug("PmsService의 getMyWbsActualEtcList호출 성공");
		return pmsdao.getMyWbsActualHumanList(wbsactualcode);
	}
	
	@Override
	public List<WbsDailyIncome> getMyWbsActualIncome(String wbsactualcode) {
		log.debug("PmsService의 getMyWbsPlanIncome호출 성공");
		return pmsdao.getMyWbsActualIncome(wbsactualcode);
	}
	@Override
	public List<WbsDailyMatrial> getMyWbsActualMatrial(String wbsactualcode) {
		log.debug("PmsService의 getMyWbsPlanIncome호출 성공");
		return pmsdao.getMyWbsActualMatrial(wbsactualcode);
	}
	@Override
	public List<WbsDailyOut> getMyWbsActualOut(String wbsactualcode) {
		log.debug("PmsService의 getMyWbsPlanIncome호출 성공");
		return pmsdao.getMyWbsActualOut(wbsactualcode);
	}
	@Override
	public List<WbsDailyFacility> getMyWbsActualFacility(String wbsactualcode) {
		log.debug("PmsService의 getMyWbsActualFacility호출 성공");
		return pmsdao.getMyWbsActualFacility(wbsactualcode);
	}
	
	@Override
	public int getincome(String wbsplancode) {
		log.debug("PmsService의 getincome호출 성공");
		return pmsdao.getincome(wbsplancode);
	}
	
	@Override
	public int gethumancost(String wbsplancode) {
		log.debug("PmsService의 getincome호출 성공");
		return pmsdao.gethumancost(wbsplancode);
	}
	@Override
	public int getfacilitycost(String wbsplancode) {
		log.debug("PmsService의 getincome호출 성공");
		return pmsdao.getfacilitycost(wbsplancode);
	}
	@Override
	public int getetccost(String wbsplancode) {
		log.debug("PmsService의 getincome호출 성공");
		return pmsdao.getetccost(wbsplancode);
	}
	@Override
	public int getmaterialcost(String wbsplancode) {
		log.debug("PmsService의 getincome호출 성공");
		return pmsdao.getmaterialcost(wbsplancode);
	}
	@Override
	public int getoutcost(String wbsplancode) {
		log.debug("PmsService의 getincome호출 성공");
		return pmsdao.getoutcost(wbsplancode);
	}
	
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsServiceInterface#getMyWbsPlanDetail(java.lang.String)
	 */
	@Override
	public  WbsPlan getMyWbsPlanDetail(String wbsplancode) {
		log.debug("PmsService의 getMyWbsPlanList호출 성공");
		WbsPlan wbsplandetail = pmsdao.getMyWbsPlanDetail(wbsplancode);
		return wbsplandetail;
	}
	

	@Override
	public  WbsPlanUpdate wbsplanupdate(WbsPlan wbsplan) {
		log.debug("PmsService의 wbsplanupdate호출 성공");
		WbsPlanUpdate wbsplanupdate = pmsdao.wbsplanupdate(wbsplan);
		return wbsplanupdate;
	}
	@Override
	public  void wbsplanupdateetc(HashMap map) {
		log.debug("PmsService의 wbsplanupdateetc호출 성공");
		pmsdao.wbsplanupdateetc(map);
		pmsdao.wbsplanupdatehuman(map);
		pmsdao.wbsplanupdatefacility(map);
		pmsdao.wbsplanupdateincome(map);
		pmsdao.wbsplanupdatematerial(map);
		pmsdao.wbsplanupdateout(map);
		
	}
	
	@Override
	public  WbsActual wbsactualdetail(String wbsactualcode) {
		log.debug("PmsService의 wbsactualdetail호출 성공");
		WbsActual wbsactual = pmsdao.wbsactualdetail(wbsactualcode);
		return wbsactual;
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
	public void wbsactualinsert(WbsActual wbsactual){
		log.debug("PmsService의 wbsactualinsert호출 성공");
		pmsdao.wbsactualinsert(wbsactual);
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
	public void updatecopperwbs(String wbsActualCode){
		log.debug("PmsService의 wbsplanincomeinsert호출 성공");
		pmsdao.updatecopperwbs(wbsActualCode);
	}
	
	@Override
	public void updateapproval(String wbsActualCode){
		log.debug("PmsService의 wbsplanincomeinsert호출 성공");
		pmsdao.updateapproval(wbsActualCode);
	}
	
	@Override
	public void updatenoapproval(String wbsActualCode){
		log.debug("PmsService의 wbsplanincomeinsert호출 성공");
		pmsdao.updatenoapproval(wbsActualCode);
	}
	
	@Override
	public void deletewbsplan(DeleteWbsplan delete){
		log.debug("PmsService의 deletewbsplanetc호출 성공");
		pmsdao.deletewbsplan(delete);
		pmsdao.deletehuman(delete);
		pmsdao.deletematerial(delete);
		pmsdao.deletefacility(delete);
		pmsdao.deleteout(delete);
		pmsdao.deleteetc(delete);
		pmsdao.deleteincome(delete);
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
	public void deletewbsplanfacility(String wbfcode){
		log.debug("PmsService의 deletewbsplanfacility호출 성공");
		pmsdao.deletewbsplanfacility(wbfcode);
	}
		@Override
	public void deletewbsplanout(String wbocode){
		log.debug("PmsService의 deletewbsplanout호출 성공");
		pmsdao.deletewbsplanout(wbocode);
	}
	@Override
	public void deletewbsplanetc(String wbecode){
		log.debug("PmsService의 deletewbsplanetc호출 성공");
		pmsdao.deletewbsplanetc(wbecode);
	}
	@Override
	public void deletewbsplanincome(String wbicode){
		log.debug("PmsService의 deletewbsplanincome호출 성공");
		pmsdao.deletewbsplanincome(wbicode);
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




	@Override
	public void updatewbsplan(String wbsplanCode) {
		log.debug("PmsService의 updatewbsplan호출 성공");
		pmsdao.updatewbsplan(wbsplanCode);		
	}
	
	
	@Override
	public void wbsmargin(HashMap map){
		log.debug("PmsService의 addWbsplanhuman호출 성공");
		pmsdao.wbsmargin(map);
	}
	
 
}
