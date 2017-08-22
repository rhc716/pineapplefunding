package com.pineapple.timeline.controller;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class TimelineController {
	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value="timelinemain.timeline",method=RequestMethod.GET)
	public String timelineMain(Locale locale,Model model){
		return "timeline/timelinemain";
	}
}
