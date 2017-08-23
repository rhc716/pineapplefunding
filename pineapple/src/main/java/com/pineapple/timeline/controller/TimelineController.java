package com.pineapple.timeline.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pineapple.timeline.service.TimelineAndUserAndEmployeeAndTimelineLike;
import com.pineapple.timeline.service.TimelineServiceInterface;


@Controller
public class TimelineController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private TimelineServiceInterface timelineserviceinterface;
	//타임라인 main 페이지 이동 타임라인 list
	@RequestMapping(value="timelinemain.timeline",method=RequestMethod.GET)
	public String timelineMain(Locale locale,Model model){
		log.debug("<----- InvestController[investMain호출]----->");
		List<TimelineAndUserAndEmployeeAndTimelineLike> timelinelist = timelineserviceinterface.getTimelineList();
		model.addAttribute("timelinelist",timelinelist);
		log.debug(timelinelist+"<-----InvestController[timelinelist 값 출력]");
		return "timeline/timelinemain";
	}
}
