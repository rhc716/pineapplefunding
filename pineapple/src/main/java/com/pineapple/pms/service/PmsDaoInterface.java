package com.pineapple.pms.service;

import java.util.List;

public interface PmsDaoInterface {

	void insertWbsPlan(WbsPlan wbsplan);

	List<WbsPlanView> WbsPlanSelect(String userId);

	WbsPlanView getMyWbsPlanDetail(String wbsplancode);
	
	void addWbsplanhuman(WbsPlanHuman wbsplanhuman);
	
	List<WbsPlanHuman> getMyWbsPlanHumanList(String wbsplancode);
	
	List<WbsPlanMaterial> getMyWbsPlanMaterialList(String wbsplancode);
	
	void deletewbsplanhuman(String wbhcode);
	
	void updatewbsplanhuman(WbsPlanHuman wbsplanhuman);
	
	void addWbsplanMaterial(WbsPlanMaterial wbsplanmaterial);

	void deletewbsplanmaterial(String wbmcode);

}