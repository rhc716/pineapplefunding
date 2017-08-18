package com.pineapple.pms.service;

import java.util.List;

public interface PmsDaoInterface {

	void insertWbsPlan(WbsPlan wbsplan);

	List<WbsPlanView> WbsPlanSelect(String userId);

	WbsPlanView getMyWbsPlanDetail(String wbsplancode);
	
	void insertWbsPlanHuman(WbsPlanHuman wbsplanhuman);

}