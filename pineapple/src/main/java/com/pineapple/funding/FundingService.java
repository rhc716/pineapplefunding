package com.pineapple.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FundingService {
	@Autowired
	private FundingDao fundingdao;
	
	// 펀딩 개설 요청 메서드
	public void addFunding(Funding funding){
		System.out.println("FundingService의 addFunding호출 성공");
		fundingdao.insertFunding(funding);
	}
}
 