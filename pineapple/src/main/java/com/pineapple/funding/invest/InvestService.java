package com.pineapple.funding.invest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.funding.funding.Funding;

@Service
public class InvestService {
	@Autowired
	private InvestDao investdao;
	
	public List<Funding> getInvestFunding(){
		System.out.println("------------------InvestService-----------------getinvestFunding()");
		return investdao.investFundingSelect();
	}
	public List<InvestAndFd> getInvestFundingList(){
		System.out.println("------------investService getinvsetFundingList--------");
		return investdao.investAndFundingListSelect();
	}
}
