package com.pineapple.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PmsService{
	@Autowired
	private PmsDaoInterface pmsdao;
	
	// wbsplan 생성 메서드
	public void addWbsplan(WbsPlan wbsplan){
		System.out.println("PmsService의 addWbsplan호출 성공");
		pmsdao.insertWbsPlan(wbsplan);
	}

	
	public List<WbsPlanView> getMyWbsPlanList(String userId) {
		System.out.println("PmsService의 getMyWbsPlanList호출 성공");
		return pmsdao.WbsPlanSelect(userId);
	}
	
	public  WbsPlanView getMyWbsPlanDetail(String wbsplancode) {
		System.out.println("PmsService의 getMyWbsPlanList호출 성공");
		WbsPlanView wbsplandetail = pmsdao.getMyWbsPlanDetail(wbsplancode);
		return wbsplandetail;
	}
	
	public void addWbsplanhuman(WbsPlanHuman wbsplanhuman){
		System.out.println("PmsService의 addWbsplanhuman호출 성공");
		pmsdao.insertWbsPlanHuman(wbsplanhuman);
	}
 
}
