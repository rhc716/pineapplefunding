package com.pineapple.pms.service;

import java.util.HashMap;
import java.util.List;

public interface PmsServiceInterface {

	// wbsplan 생성 메서드
	void addWbsplan(WbsPlan wbsplan);

	WbsPlan getMyWbsPlanDetail(String wbsplancode);

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

	void deletewbsplanfacility(String wbmcode);

	void deletewbsplanout(String wbmcode);

	void deletewbsplanetc(String wbmcode);

	void deletewbsplanincome(String wbmcode);

	void deletewbsplan(DeleteWbsplan delete);

	void updatewbsplan(String wbsplanCode);

	WbsPlanUpdate wbsplanupdate(WbsPlan wbsplanu);

	void wbsplanupdateetc(HashMap map);

	void wbsactualinsert(WbsActual wbsactual);

	WbsActual wbsactualdetail(String wbsplancode);

	List<WbsMs> wbsmsview(String fdcode);

	List<WbsPlan> wbsplanlist(String milestoneCode);

	int getincome(String wbsplancode);
	int gethumancost(String wbsplancode);
	int getfacilitycost(String wbsplancode);
	int getetccost(String wbsplancode);
	int getmaterialcost(String wbsplancode);
	int getoutcost(String wbsplancode);
	void wbsmargin(HashMap map);

	List<WbsActual> wbsactual(String milestoneCode);

}