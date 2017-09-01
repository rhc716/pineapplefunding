package com.pineapple.timeline.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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

import com.pineapple.timeline.service.Message;
import com.pineapple.timeline.service.MyInvestorTimeline;
import com.pineapple.timeline.service.MyInvestorTimelineLog;
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
	
	
	///////////////////////My Page Time Line//////////////////////////
	//자신이 등록한 타임라인 list 조회
	@RequestMapping(value="/investortimeline.timeline",method=RequestMethod.GET)
	public String investorTimelinelist(Locale locale,Model model,HttpSession session){
		log.debug("<----- TimelineController[timelineMain호출]----->");
		List<MyInvestorTimeline> myinvestortimeline = timelineserviceinterface.getMypageTimelineList(session.getAttribute("id").toString());
		model.addAttribute("myinvestortimeline",myinvestortimeline);
		log.debug(myinvestortimeline+"<-----TimelineController[myinvestortimeline 값 출력]");
		return "user/investormypageajax/investortimeline";
	}
	//My Page 에서 타임라인 새로 등록하기
	@RequestMapping(value="/investortimelineinsert.timeline",method=RequestMethod.POST)
	public String investorTimelineAdd(Locale locale,Model model,Timeline timeline){
		log.debug("<----- TimelineController[investorTimelineAdd호출]----->");
		int timelineinsert = timelineserviceinterface.addTimeline(timeline);
		log.debug(timelineinsert+"<-----TimelineController[timelineinsert 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신이 등록한 타임라인 수정하기
	@RequestMapping(value="/investortimelineupdate.timeline",method=RequestMethod.POST)
	public String investorTimelineModify(Locale locale,Model model,Timeline timeline){
		log.debug("<----- TimelineController[investorTimelineModify호출]----->");
		int timelineupdate = timelineserviceinterface.modifyTimeline(timeline);
		log.debug(timelineupdate+"<-----TimelineController[timelineupdate 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신이 등록한 타임라인 삭제하기
	@RequestMapping(value="/investortimelinedelete.timeline",method=RequestMethod.GET)
	public String investorTimelineRemove(Locale locale,Model model,@RequestParam(value="tlCode")int tlCode){
		log.debug("<----- TimelineController[investorTimelineRemove호출]----->");
		int timelinedelete = timelineserviceinterface.removeTimeline(tlCode);
		log.debug(timelinedelete+"<-----TimelineController[timelinedelete 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신이 등록한 타임라인의 댓글 list 조회
	@RequestMapping(value="/investortimelinereply.timeline",method=RequestMethod.GET)
	public String investorTimelineReplylist(Locale locale,Model model,@RequestParam(value="tlCode")int tlCode){
		log.debug("<----- TimelineController[investorTimelineReplylist호출]----->");
		List<TimelineReply> timelinereplylist = timelineserviceinterface.getTimelineReplyList(tlCode);
		log.debug(timelinereplylist+"<-----TimelineController[timelinereplylist 값 출력]");
		model.addAttribute("timelinereplylist",timelinereplylist);
		log.debug(timelinereplylist.size()+"<-----TimelineController[timelinereplylist 값 출력]");
		return "user/investormypageajax/investortimelinereply";
	}
	//자신이 등록한 타임라인 댓글 입력하기
	@RequestMapping(value="/investortimelinereplyinsert.invest",method=RequestMethod.POST)
	public String investorTimelineReplyAdd(Locale locale,Model model,TimelineReply timelinereply){
		log.debug("<----- TimelineController[investorTimelineReplyAdd호출]----->");
		int timelinereplyinsert = timelineserviceinterface.addTimelineReply(timelinereply);
		log.debug(timelinereplyinsert+"<-----TimelineController[timelinereplyinsert 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신이 등록한 타임라인 댓글 수정하기
	@RequestMapping(value="/investortimelinereplyupdate.invest",method=RequestMethod.POST)
	public String investorTimelineReplyModify(Locale locale,Model model,TimelineReply timelinereply){
		log.debug("<----- TimelineController[investorTimelineReplyModify호출]----->");
		int timelinereplyupdate = timelineserviceinterface.modifyTimelineReply(timelinereply);
		log.debug(timelinereplyupdate+"<-----TimelineController[timelinereplyupdate 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신이 등록한 타임라인 댓글 삭제하기
	@RequestMapping(value="/investortimelinereplydelete.invest",method=RequestMethod.GET)
	public String investorTimelineReplyRemove(Locale locale,Model model,@RequestParam(value="tlReCode")int tlReCode){
		log.debug("<----- TimelineController[investorTimelineReplyRemove호출]----->");
		int timelinereplydelete = timelineserviceinterface.removeTimelineReply(tlReCode);
		log.debug(timelinereplydelete+"<-----TimelineController[timelinereplydelete 값 출력]");
		return "redirect:/investormypage.user";
	}
	
	
	/////////////////////My Page Message///////////////////////////
	//자신에게 온 메세지 list 조회
	@RequestMapping(value="/investormessagelist.timeline",method=RequestMethod.GET)
	public String investorMessagelist(Locale locale,Model model,HttpSession session){
		log.debug("<----- TimelineController[timelineMain호출]----->");
		List<Message> myinvestormessage = timelineserviceinterface.getMypageMessageList(session.getAttribute("id").toString());
		model.addAttribute("myinvestormessage",myinvestormessage);
		log.debug(myinvestormessage+"<-----TimelineController[myinvestormessage 값 출력]");
		return "user/investormypageajax/investormessage";
	}
	
	
	
	
	
	
    //////////////////////////REST CONTROLLER//////////////////////////
	//자신의 한달간의 활동기록 조회
	@RequestMapping(value="/investortimelinelog.timeline",method=RequestMethod.GET)
	public @ResponseBody MyInvestorTimelineLog myInvestorTimelineLog(Locale locale,Model model,HttpSession session){
		log.debug("<----- TimelineController[myInvestorTimelineLog호출]----->");
		MyInvestorTimelineLog myinvestortimelinelog = timelineserviceinterface.getMypageTimelineLog(session.getAttribute("id").toString());
		model.addAttribute("myinvestortimelinelog",myinvestortimelinelog);
		log.debug(myinvestortimelinelog+"<-----TimelineController[myinvestortimelinelog 값 출력]");
		return myinvestortimelinelog;
	}
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