package com.pineapple.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.pms.service.WbsPlan;

@Service
public class PmsService{
	@Autowired
	private PmsDao pmsdao;
	
	// wbsplan 생성 메서드
	public void addWbsplan(WbsPlan wbsplan){
		System.out.println("PmsService의 addWbsplan호출 성공");
		pmsdao.insertWbsPlan(wbsplan);
	}

	
	public List<WbsPlan> getMyWbsPlanList() {
		System.out.println("PmsService의 getMyWbsPlanList호출 성공");
		List<WbsPlan> wbsplanlist = pmsdao.WbsPlanSelect();
		return wbsplanlist;
	}
	
	public  WbsPlan getMyWbsPlanDetail(String wbsplancode) {
		System.out.println("PmsService의 getMyWbsPlanList호출 성공");
		WbsPlan wbsplandetail = pmsdao.getMyWbsPlanDetail(wbsplancode);
		return wbsplandetail;
	}
 
}
