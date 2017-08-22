package com.pineapple.user.service;

import java.util.List;

public class CompanyList {
	private List<Company> companylist;

	public List<Company> getCompanylist() {
		return companylist;
	}

	public void setCompanylist(List<Company> companylist) {
		this.companylist = companylist;
	}

	@Override
	public String toString() {
		return "CompanyList [companylist=" + companylist + "]";
	}
	
}
