package com.pineapple.invest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.funding.service.Funding;

@Service
public class InvestService implements InvestServiceInterface {
	@Autowired
	private InvestDaoInterface investdaointerface;
	
	//전체 펀딩 리스트 조회하기
	/* (non-Javadoc)
	 * @see com.pineapple.invest.service.InvestServiceInterface#getInvestFunding()
	 */
	@Override
	public List<InvestAndFd> getInvestFunding(){
		System.out.println("------------------InvestService-----------------getinvestFunding()");
		List<InvestAndFd> fdfd =  investdaointerface.investFundingSelect();
		return fdfd;
	}
}
