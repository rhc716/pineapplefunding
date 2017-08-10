package com.pineapple.pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PmsService {
	@Autowired
	private PmsDao pmsdao;
	
	// wbsplan 생성 메서드
	public void addWbsplan(WbsPlan wbsplan){
		System.out.println("PmsService의 addWbsplan호출 성공");
		pmsdao.insertWbsPlan(wbsplan);
	}
 
}
