package com.pineapple.pms.service;

import java.util.HashMap;
import java.util.List;

public interface PmsDaoInterface {

	void insertWbsPlan(WbsPlan wbsplan);

	WbsPlan getMyWbsPlanDetail(String wbsplancode);
	
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

	void deletewbsplan(DeleteWbsplan delete);

	void deletehuman(DeleteWbsplan delete);

	void deletematerial(DeleteWbsplan delete);

	void deletefacility(DeleteWbsplan delete);

	void deleteout(DeleteWbsplan delete);

	void deleteetc(DeleteWbsplan delete);

	void deleteincome(DeleteWbsplan delete);

	void updatewbsplan(String wbsplancode);

	WbsPlanUpdate wbsplanupdate(WbsPlan wbsplan);

	void wbsplanupdateetc(HashMap map);

	void wbsplanupdatehuman(HashMap map);

	void wbsplanupdatefacility(HashMap map);

	void wbsplanupdateincome(HashMap map);

	void wbsplanupdatematerial(HashMap map);

	void wbsplanupdateout(HashMap map);

	void wbsactualinsert(WbsActual wbsactual);
	WbsActual wbsactualdetail(String wbsactualcode);

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