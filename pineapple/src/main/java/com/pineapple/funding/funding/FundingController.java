package com.pineapple.funding.funding;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FundingController {
	
	// ������Ʈ���� ������������ �̵�
	@RequestMapping(value = "/pmsmain.pms", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "./pms/pmsmain";
	}
	
	
}
