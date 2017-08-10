package com.pineapple.invest.service;

import java.util.List;

import com.pineapple.funding.service.Funding;

public interface InvestServiceInterface {
	//전체펀딩리스트 service(투자하기 main)
	List<InvestAndFd> getInvestFunding();
}