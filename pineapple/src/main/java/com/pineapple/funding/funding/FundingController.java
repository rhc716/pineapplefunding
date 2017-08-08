package com.pineapple.funding.funding;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FundingController {
	
	@RequestMapping(value = "/pmsmain.pms", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "./pms/pmsmain";
	}
	
	@RequestMapping(value = "/fundingopen.pms", method = RequestMethod.GET)
	public String fundingopen(Locale locale, Model model) {
		return "./pms/funding/fundingopen";
	}
	
	@RequestMapping(value = "/fundingdetail.pms", method = RequestMethod.GET)
	public String fundingdetail(Locale locale, Model model) {
		return "./pms/funding/fundingdetail";
	}
	
	
}
