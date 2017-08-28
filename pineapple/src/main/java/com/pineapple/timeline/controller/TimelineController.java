package com.pineapple.timeline.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pineapple.timeline.service.Timeline;
import com.pineapple.timeline.service.TimelineAndUserAndEmployeeAndTimelineLike;
import com.pineapple.timeline.service.TimelineReply;
import com.pineapple.timeline.service.TimelineServiceInterface;


@Controller
public class TimelineController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private TimelineServiceInterface timelineserviceinterface;
	//타임라인 main 페이지 이동 타임라인 list
	@RequestMapping(value="/timelinemain.timeline",method=RequestMethod.GET)
	public String timelineMain(Locale locale,Model model){
		log.debug("<----- TimelineController[timelineMain호출]----->");
		List<TimelineAndUserAndEmployeeAndTimelineLike> timelinelist = timelineserviceinterface.getTimelineList();
		model.addAttribute("timelinelist",timelinelist);
		log.debug(timelinelist+"<-----TimelineController[timelinelist 값 출력]");
		return "timeline/timelinemain";
	}
	//모달에서 타임라인 등록하기
	@RequestMapping(value="/timelineinsert.timeline",method=RequestMethod.POST)
	public String timelineAdd(Locale locale,Model model,Timeline timeline){
		log.debug("<----- TimelineController[timelineAdd호출]----->");
		int timelineinsert = timelineserviceinterface.addTimeline(timeline);
		log.debug(timelineinsert+"<-----TimelineController[timelineinsert 값 출력]");
		return "redirect:/timelinemain.timeline";
	}
	//모달에서 타임라인 수정하기
	@RequestMapping(value="/timelineupdate.timeline",method=RequestMethod.POST)
	public String timelineModify(Locale locale,Model model,Timeline timeline){
		log.debug("<----- TimelineController[timelineModify호출]----->");
		int timelineupdate = timelineserviceinterface.modifyTimeline(timeline);
		log.debug(timelineupdate+"<-----TimelineController[timelineupdate 값 출력]");
		return "redirect:/timelinemain.timeline";
	}
	//타임라인 삭제하기
	@RequestMapping(value="/timelinedelete.timeline",method=RequestMethod.GET)
	public String timelineRemove(Locale locale,Model model,@RequestParam(value="tlCode")int tlCode){
		log.debug("<----- TimelineController[timelineRemove호출]----->");
		int timelinedelete = timelineserviceinterface.removeTimeline(tlCode);
		log.debug(timelinedelete+"<-----TimelineController[timelinedelete 값 출력]");
		return "redirect:/timelinemain.timeline";
	}
	//타임라인 댓글 등록하기
	@RequestMapping(value="/timelinereplyinsert.invest",method=RequestMethod.POST)
	public String timelineReplyAdd(Locale locale,Model model,TimelineReply timelinereply){
		log.debug("<----- TimelineController[timelineReplyAdd호출]----->");
		int timelinereplyinsert = timelineserviceinterface.addTimelineReply(timelinereply);
		log.debug(timelinereplyinsert+"<-----TimelineController[timelinereplyinsert 값 출력]");
		return "redirect:/timelinemain.timeline";
	}
	//타임라인 댓글 수정하기
	@RequestMapping(value="/timelinereplyupdate.invest",method=RequestMethod.POST)
	public String timelineReplyModify(Locale locale,Model model,TimelineReply timelinereply){
		log.debug("<----- TimelineController[timelineReplyModify호출]----->");
		int timelinereplyupdate = timelineserviceinterface.modifyTimelineReply(timelinereply);
		log.debug(timelinereplyupdate+"<-----TimelineController[timelinereplyupdate 값 출력]");
		return "redirect:/timelinemain.timeline";
	}
	//타임라인 댓글 삭제하기
	@RequestMapping(value="/timelinereplydelete.invest",method=RequestMethod.GET)
	public String timelineReplyRemove(Locale locale,Model model,@RequestParam(value="tlReCode")int tlReCode){
		log.debug("<----- TimelineController[timelineReplyRemove호출]----->");
		int timelinereplydelete = timelineserviceinterface.removeTimelineReply(tlReCode);
		log.debug(timelinereplydelete+"<-----TimelineController[timelinereplydelete 값 출력]");
		return "redirect:/timelinemain.timeline";
	}
/////////////////////////////REST CONTROLLER//////////////////////////
	//댓글더보기 클릭시 ajax로 댓글 list 조회
	@RequestMapping(value="/timelinereplylist.invest",method=RequestMethod.GET)
	public String timelineReplyGet(Locale locale,Model model,@RequestParam(value="tlCode")int tlCode){
		log.debug("<----- TimelineController[timelineReplyGet호출]----->");
		List<TimelineReply> timelinereplylist = timelineserviceinterface.getTimelineReplyList(tlCode);
		log.debug(timelinereplylist+"<-----TimelineController[timelinereplylist 값 출력]");
		model.addAttribute("timelinereplylist",timelinereplylist);
		log.debug(timelinereplylist.size()+"<-----TimelineController[timelinereplylist 값 출력]");
		return "timeline/timelineajax/timelineReply";
	}
}
