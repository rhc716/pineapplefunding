package com.pineapple.pms.service;

import java.util.List;

public interface PmsServiceInterface {

	// wbsplan 생성 메서드
	void addWbsplan(WbsPlan wbsplan);

	List<WbsPlanView> getMyWbsPlanList(String userId);

	WbsPlanView getMyWbsPlanDetail(String wbsplancode);

	void addWbsplanhuman(WbsPlanHuman wbsplanhuman);
	
	List<WbsPlanHuman> getMyWbsPlanHumanList(String wbsplancode);
	
	void deletewbsplanhuman(String wbhcode);
	
	void updatewbsplanhuman(WbsPlanHuman wbsplanhuman);

	void addWbsplanMaterial(WbsPlanMaterial wbsplanmaterial);
	
	List<WbsPlanMaterial> getMyWbsPlanMaterialList(String wbsplancode);

	void deletewbsplanmaterial(String wbmcode);

	List<WbsPlanFacility> getMyWbsPlanFacilityList(String wbsplancode);

	List<WbsPlanOut> getMyWbsPlanOutList(String wbsplancode);

	List<WbsPlanEtc> getMyWbsPlanEtcList(String wbsplancode);

	List<WbsPlanIncome> getMyWbsPlanIncomeyList(String wbsplancode);

	void wbsplanfacilityinsert(WbsPlanFacility wbsplanfacility);

	void wbsplanoutinsert(WbsPlanOut wbsplanout);

	void wbsplanetcinser(WbsPlanEtc wbsplanetc);

	void wbsplanincomeinsert(WbsPlanIncome wbsplanincome);

	void wbsplanmaterialupdate(WbsPlanMaterial wbsplanmaterial);

	void wbsplanfacilityupdate(WbsPlanFacility wbsplanfacility);

	void wbsplanoutupdate(WbsPlanOut wbsplanout);

	void wbsplanetcupdate(WbsPlanEtc wbsplanetc);

	void wbsplanincomeupdate(WbsPlanIncome wbsplanincome);

}