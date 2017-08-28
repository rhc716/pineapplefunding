package com.pineapple.pms.service;

import java.util.HashMap;
import java.util.List;

public interface PmsDaoInterface {

	void insertWbsPlan(WbsPlan wbsplan);

	List<WbsPlanView> WbsPlanSelect(String userId);

	WbsPlanView getMyWbsPlanDetail(String wbsplancode);
	
	void addWbsplanhuman(WbsPlanHuman wbsplanhuman);
	
	List<WbsPlanHuman> getMyWbsPlanHumanList(String wbsplancode);
	
	List<WbsPlanMaterial> getMyWbsPlanMaterialList(String wbsplancode);
	
	List<WbsPlanFacility> getMyWbsPlanFacilityList(String wbsplancode);
	
	void deletewbsplanhuman(String wbhcode);
	
	void updatewbsplanhuman(WbsPlanHuman wbsplanhuman);
	
	void addWbsplanMaterial(WbsPlanMaterial wbsplanmaterial);

	void deletewbsplanmaterial(String wbmcode);

	List<WbsPlanOut> getMyWbsPlanOutList(String wbsplancode);

	List<WbsPlanEtc> getMyWbsPlanEtcList(String wbsplancode);

	List<WbsPlanIncome> getMyWbsPlanIncomeyList(String wbsplancode);

	void wbsplanfacilityinsert(WbsPlanFacility wbsplanfacility);

	void wbsplanoutinsert(WbsPlanOut wbsplanout);

	void wbsplanetcinser(WbsPlanEtc wbsplanetc);

	void wbsplanincomeinsert(WbsPlanIncome wbsplanincome);

	void wbsplanmaterialupdate(WbsPlanMaterial wbsplanmaterial);

	void wbsplanfacilityupdate(WbsPlanFacility wbsplanfacility);

	void wbsplanetcupdate(WbsPlanEtc wbsplanetc);

	void wbsplanincomeupdate(WbsPlanIncome wbsplanincome);

	void wbsplanoutupdate(WbsPlanOut wbsplanout);

	void deletewbsplanfacility(String wbfcode);

	void deletewbsplanout(String wbocode);

	void deletewbsplanetc(String wbecode);

	void deletewbsplanincome(String wbicode);

	void deletewbsplan(String wbsplancode);

	void deletehuman(String wbsplancode);

	void deletematerial(String wbsplancode);

	void deletefacility(String wbsplancode);

	void deleteout(String wbsplancode);

	void deleteetc(String wbsplancode);

	void deleteincome(String wbsplancode);

	void updatewbsplan(String wbsplancode);

	WbsPlanUpdate wbsplanupdate(WbsPlan wbsplan);

	void wbsplanupdateetc(HashMap map);

	void wbsplanupdatehuman(HashMap map);

	void wbsplanupdatefacility(HashMap map);

	void wbsplanupdateincome(HashMap map);

	void wbsplanupdatematerial(HashMap map);

	void wbsplanupdateout(HashMap map);

	void wbsactualinsert(WbsActual wbsactual);

	List<WbsActual> wbsactuallist(String userId);

	WbsActual wbsactualdetail(String wbsactualcode);

}