package com.pineapple.timeline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.MoneyAndTitleAndId;
import com.pineapple.timeline.service.Companyreport;
import com.pineapple.timeline.service.Message;
import com.pineapple.timeline.service.MyInvestorTimeline;
import com.pineapple.timeline.service.MyInvestorTimelineLog;
import com.pineapple.timeline.service.Timeline;
import com.pineapple.timeline.service.TimelineAndUserAndEmployeeAndTimelineLike;
import com.pineapple.timeline.service.TimelineReply;
import com.pineapple.timeline.service.TimelineServiceInterface;
import com.pineapple.user.service.User;


@Controller
public class TimelineController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private TimelineServiceInterface timelineserviceinterface;
	//타임라인 main 페이지 이동 타임라인 list
	@RequestMapping(value="/timelinemain.timeline",method=RequestMethod.GET)
	public String timelineMain(Locale locale,Model model,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[timelineMain호출]----->");
		List<TimelineAndUserAndEmployeeAndTimelineLike> timelinelist = timelineserviceinterface.getTimelineList(numberOfRequests);
		model.addAttribute("timelinelist",timelinelist);
		model.addAttribute("timedataCode","최신");
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
	//타임라인 왼쪽 Funding ranking (최신펀딩)  
	@RequestMapping(value="/timelinefundingranking.timeline",method=RequestMethod.GET)
	public String investorTimelineReplyRemove(Locale locale,Model model){
		log.debug("<----- TimelineController[investorTimelineReplyRemove호출]----->");
		List<InvestAndFd> timelinereplydelete = timelineserviceinterface.getTimelineFundingranking();
		model.addAttribute("timelinereplydelete",timelinereplydelete);
		log.debug(timelinereplydelete+"<-----TimelineController[timelinereplydelete 값 출력]");
		return "timeline/timelineajax/timelinefundingrenaking";
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
	public String timelineFundingRankingGet(Locale locale,Model model,@RequestParam(value="tlReCode")int tlReCode){
		log.debug("<----- TimelineController[investorTimelineReplyRemove호출]----->");
		int timelinereplydelete = timelineserviceinterface.removeTimelineReply(tlReCode);
		log.debug(timelinereplydelete+"<-----TimelineController[timelinereplydelete 값 출력]");
		return "redirect:/investormypage.user";
	}
	//타임라인 메뉴 설정 
	@RequestMapping(value="/timelineselectmenu.invest",method=RequestMethod.GET)
	public String timelineselectmenu(Locale locale,Model model,@RequestParam(value="timedataCode")String timedataCode,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[timelineselectmenu호출]----->");
		List<TimelineAndUserAndEmployeeAndTimelineLike> timelineselectmenu = timelineserviceinterface.getTimelineListmenu(timedataCode,numberOfRequests);
		model.addAttribute("timelineselectmenu",timelineselectmenu);
		model.addAttribute("timedataCode",timedataCode);
		log.debug(timelineselectmenu+"<-----TimelineController[timelineselectmenu 값 출력]");
		return "timeline/timelineajax/timelineselectmenu";
	}

	
	
	/////////////////////My Page Message///////////////////////////
	//자신에게 온 메세지 list 조회
	@RequestMapping(value="/investormessagelist.timeline",method=RequestMethod.GET)
	public String investorMessagelist(Locale locale,Model model,HttpSession session){
		log.debug("<----- TimelineController[investorMessagelist호출]----->");
		List<Message> myinvestormessage = timelineserviceinterface.getMypageMessageList(session.getAttribute("id").toString());
		model.addAttribute("myinvestormessage",myinvestormessage);
		log.debug(myinvestormessage+"<-----TimelineController[myinvestormessage 값 출력]");
		return "user/investormypageajax/investormessage";
	}
	//자신에게 온 메세지 open 시 check 확인
	@RequestMapping(value="/investormessageopen.timeline",method=RequestMethod.GET)
	public @ResponseBody int investorMessageOpenCheckModify(Locale locale,Model model,@RequestParam(value="msgCode")int msgCode){
		log.debug("<----- TimelineController[investorMessageOpenCheckModify호출]----->");
		int myinvestormessageopencheck = timelineserviceinterface.modifyMypageMessageOpenCheck(msgCode);
		log.debug(myinvestormessageopencheck+"<-----TimelineController[myinvestormessageopencheck 값 출력]");
		return myinvestormessageopencheck;
	}
	//receive 검색용 nickname
	@RequestMapping(value="/investormessagesendreceiveid.timeline",method=RequestMethod.GET)
	public String investorMessageSendReceiveIdGet(Locale locale,Model model,@RequestParam(value="receiveid")String receiveid){
		log.debug("<----- TimelineController[investorMessageSendReceiveIdGet호출]----->");
		log.debug(receiveid+"<----- TimelineController[receiveid호출]----->");
		List<User> myinvestormessagesendreceiveid = timelineserviceinterface.getMypageMessageSendReceiveId(receiveid);
		log.debug(myinvestormessagesendreceiveid+"<-----TimelineController[myinvestormessagesendreceiveid 값 출력]");
		model.addAttribute("myinvestormessagesendreceiveid",myinvestormessagesendreceiveid);
		log.debug(myinvestormessagesendreceiveid.size()+"<-----TimelineController[timelinereplylist 값 출력]");
		return "user/investormypageajax/investormessagesendreceiveid";
	}
	//메세지 보내기
	@RequestMapping(value = "/investormessagesend.timeline", method = RequestMethod.POST)
	public String investorMessageSendAdd(Locale locale,Model model,Message message) {
		log.debug("<----- TimelineController[investorMessageSendAdd호출]----->");
		int messageinsert = timelineserviceinterface.addMypageMessageSend(message);
		log.debug(messageinsert+"<-----TimelineController[messageinsert 값 출력]");
		return "redirect:/investormypage.user";
	}
	//자신이 보낸 메세지 list 조회
	@RequestMapping(value="/investorsendmessage.timeline",method=RequestMethod.GET)
	public String investorMessageSendlist(Locale locale,Model model,HttpSession session){
		log.debug("<----- TimelineController[investorMessageSendlist호출]----->");
		List<Message> myinvestormessagesend = timelineserviceinterface.getMypageMessageSendList(session.getAttribute("id").toString());
		model.addAttribute("myinvestormessagesend",myinvestormessagesend);
		log.debug(myinvestormessagesend+"<-----TimelineController[myinvestormessagesend 값 출력]");
		return "user/investormypageajax/investormessagesend";
	}
	//받은 메세지 list 삭제
	@RequestMapping(value="/investormessagelistdelete.timeline",method=RequestMethod.GET)
	public String investorMessagelistRemove(Locale locale,Model model,HttpServletRequest request,HttpSession session){
		log.debug("<----- TimelineController[investorMessageSendlist호출]----->");
		String[] msgCodelist = request.getParameterValues("messagechecklist");
		HashMap<String, String[]> msgCodemap = new HashMap<>();
		msgCodemap.put("msgCodelist", msgCodelist);
		log.debug(msgCodemap.get("msgCodelist").length+"<----- TimelineController[msgCodemap.get('msgCodelist').length호출]----->");
		List<Message> myinvestormessagedelete= timelineserviceinterface.removeMypageMessageList(msgCodemap,session.getAttribute("id").toString());
		log.debug(myinvestormessagedelete+"<-----TimelineController[myinvestormessagedelete 값 출력]");
		model.addAttribute("myinvestormessage",myinvestormessagedelete);
		return "user/investormypageajax/investormessagesendlist";
	}
	//선택 메세지 읽은 메세지로
	@RequestMapping(value="/investormessagecheckok.timeline",method=RequestMethod.GET)
	public String investorMessageCheckOkUpdate(Locale locale,Model model,HttpServletRequest request,HttpSession session){
		log.debug("<----- TimelineController[investorMessageSendlist호출]----->");
		String[] msgCodelist = request.getParameterValues("messagechecklist");
		HashMap<String, String[]> msgCodemap = new HashMap<>();
		msgCodemap.put("msgCodelist", msgCodelist);
		log.debug(msgCodemap.get("msgCodelist").length+"<----- TimelineController[msgCodemap.get('msgCodelist').length호출]----->");
		List<Message> myinvestormessagecheckok= timelineserviceinterface.updateMypageMessageCheckOkList(msgCodemap,session.getAttribute("id").toString());
		log.debug(myinvestormessagecheckok+"<-----TimelineController[myinvestormessagedelete 값 출력]");
		model.addAttribute("myinvestormessage",myinvestormessagecheckok);
		return "user/investormypageajax/investormessagesendlist";
	}
	//선택 메세지 읽지않은 메세지로
	@RequestMapping(value="/investormessagecheckno.timeline",method=RequestMethod.GET)
	public String investorMessageCheckNoUpdate(Locale locale,Model model,HttpServletRequest request,HttpSession session){
		log.debug("<----- TimelineController[investorMessageSendlist호출]----->");
		String[] msgCodelist = request.getParameterValues("messagechecklist");
		HashMap<String, String[]> msgCodemap = new HashMap<>();
		msgCodemap.put("msgCodelist", msgCodelist);
		log.debug(msgCodemap.get("msgCodelist").length+"<----- TimelineController[msgCodemap.get('msgCodelist').length호출]----->");
		List<Message> myinvestormessagecheckno= timelineserviceinterface.updateMypageMessageCheckNoList(msgCodemap,session.getAttribute("id").toString());
		log.debug(myinvestormessagecheckno+"<-----TimelineController[myinvestormessagecheckno 값 출력]");
		model.addAttribute("myinvestormessage",myinvestormessagecheckno);
		return "user/investormypageajax/investormessagesendlist";
	}
	
	///////////////////////////MY Page Moneyflow///////////////////////////////////////
	//자금조회 
	@RequestMapping(value="/moneyflow.timeline",method=RequestMethod.GET)
	public String moneyflow(Locale locale,Model model,HttpServletRequest request,HttpSession session){
		log.debug("<----- TimelineController[moneyflow호출]----->");
		return "user/adminpageajax/moneyflow";
	}
	//내역 조회
	@RequestMapping(value="/moneyflowall.timeline",method=RequestMethod.GET)
	public String moneyflowall(Locale locale,Model model,HttpServletRequest request,@RequestParam(value="mfCategory",defaultValue="0")int mfCategory,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[moneyflowall호출]----->");
		log.debug(mfCategory+"<-----TimelineController[mfCategory 값 출력]");
		log.debug(numberOfRequests+"<-----TimelineController[numberOfRequests 값 출력]");
		List<MoneyAndTitleAndId> moneycontent = timelineserviceinterface.getMoneyall(mfCategory,numberOfRequests);
		model.addAttribute("moneycontent",moneycontent);
		log.debug(moneycontent+"<-----TimelineController[moneycontent 값 출력]");
		model.addAttribute("mfCategory",mfCategory);
		return "user/adminpageajax/moneyflowcontent";
	}
	
	
	
	
	///////////////////////////MY Page Emp Report ///////////////////////////////////////
	//보고서 조회
	@RequestMapping(value="/investorreportlist.timeline",method=RequestMethod.GET)
	public String employeeReport(Locale locale,Model model,HttpServletRequest request){
		log.debug("<----- TimelineController[employeeReport호출]----->");
		return "user/employeeajax/employeereportmain";
	}
	//보고서 보내기 메인 
	@RequestMapping(value="/reportsendmainpage.timeline",method=RequestMethod.GET)
	public String employeeReportsnedpage(Locale locale,Model model,HttpServletRequest request){
		log.debug("<----- TimelineController[employeeReportsnedpage호출]----->");
		return "user/employeeajax/employeereportsendmainpage";
	}
	//보고서 조회 Content 
	@RequestMapping(value="/reportreceiveandsendlistpage.timeline",method=RequestMethod.GET)
	public String empreportreceiveandsendlistpage(Locale locale,Model model,HttpServletRequest request,@RequestParam(value="Category",defaultValue="default")String Category,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests,HttpSession session){
		log.debug("<----- TimelineController[empreportreceiveandsendlistpage호출]----->");
		log.debug(Category+"<-----TimelineController[mfCategory 값 출력]");
		log.debug(numberOfRequests+"<-----TimelineController[numberOfRequests 값 출력]");
		model.addAttribute("Category",Category);
		List<Companyreport> moneycontent = timelineserviceinterface.getMypageEmpReportList(session.getAttribute("id").toString(),Category,numberOfRequests);
		model.addAttribute("moneycontent",moneycontent);
		log.debug(moneycontent+"<-----TimelineController[moneycontent 값 출력]");
		return "user/employeeajax/employeereportsendandreceivepagere";
	}
	//보고서 조회 추가 요청 
	@RequestMapping(value="/reportreceiveandsendlistpageadd.timeline",method=RequestMethod.GET)
	public @ResponseBody List<Companyreport> empreportreceiveandsendlistpageadd(Locale locale,Model model,HttpServletRequest request,@RequestParam(value="Category",defaultValue="default")String Category,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests,HttpSession session){
		log.debug("<----- TimelineController[empreportreceiveandsendlistpage호출]----->");
		log.debug(Category+"<-----TimelineController[mfCategory 값 출력]");
		log.debug(numberOfRequests+"<-----TimelineController[numberOfRequests 값 출력]");
		model.addAttribute("Category",Category);
		List<Companyreport> moneycontent = timelineserviceinterface.getMypageEmpReportList(session.getAttribute("id").toString(),Category,numberOfRequests);
		model.addAttribute("moneycontent",moneycontent);
		log.debug(moneycontent+"<-----TimelineController[moneycontent 값 출력]");
		return moneycontent;
	}
	//받은 보고서 list 삭제
	@RequestMapping(value="/investorreportdelete.timeline",method=RequestMethod.GET)
	public String investorReportlistRemove(Locale locale,Model model,HttpServletRequest request,HttpSession session,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[investorReportlistRemove호출]----->");
		String Category = "empreceivemessagelist";
		String[] msgCodelist = request.getParameterValues("reportchecklist");
		HashMap<String, String[]> msgCodemap = new HashMap<>();
		msgCodemap.put("msgCodelist", msgCodelist);
		log.debug(msgCodemap.get("msgCodelist").length+"<----- TimelineController[msgCodemap.get('msgCodelist').length호출]----->");
		List<Companyreport> investorReportlistRemove= timelineserviceinterface.deleteMypageReportlist(msgCodemap, session.getAttribute("id").toString(), Category, numberOfRequests);
		log.debug(investorReportlistRemove+"<-----TimelineController[myinvestormessagedelete 값 출력]");
		model.addAttribute("moneycontent",investorReportlistRemove);
		return "user/employeeajax/employeereportsendandreceivecontent";
	}
	//선택 보고서 읽은 보고서로
	@RequestMapping(value="/investorreportcheckok.timeline",method=RequestMethod.GET)
	public String investorReportCheckOkUpdate(Locale locale,Model model,HttpServletRequest request,HttpSession session,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[investorReportCheckOkUpdate호출]----->");
		String Category = "empreceivemessagelist";
		String[] msgCodelist = request.getParameterValues("reportchecklist");
		HashMap<String, String[]> msgCodemap = new HashMap<>();
		msgCodemap.put("msgCodelist", msgCodelist);
		log.debug(msgCodemap.get("msgCodelist").length+"<----- TimelineController[msgCodemap.get('msgCodelist').length호출]----->");
		List<Companyreport> myinvestormessagecheckok= timelineserviceinterface.updateMypageReportCheckOkList(msgCodemap, session.getAttribute("id").toString(), Category, numberOfRequests);
		log.debug(myinvestormessagecheckok+"<-----TimelineController[myinvestorreportdelete 값 출력]");
		model.addAttribute("moneycontent",myinvestormessagecheckok);
		return "user/employeeajax/employeereportsendandreceivecontent";
	}
	//선택 보고서 읽지않은 보고서로
	@RequestMapping(value="/investorreportcheckno.timeline",method=RequestMethod.GET)
	public String investorReportCheckNoUpdate(Locale locale,Model model,HttpServletRequest request,HttpSession session,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[investorReportCheckNoUpdate호출]----->");
		String Category = "empreceivemessagelist";
		String[] msgCodelist = request.getParameterValues("reportchecklist");
		HashMap<String, String[]> msgCodemap = new HashMap<>();
		msgCodemap.put("msgCodelist", msgCodelist);
		log.debug(msgCodemap.get("msgCodelist").length+"<----- TimelineController[msgCodemap.get('msgCodelist').length호출]----->");
		List<Companyreport> myinvestormessagecheckno= timelineserviceinterface.updateMypageReportCheckNoList(msgCodemap,session.getAttribute("id").toString(), Category, numberOfRequests);
		log.debug(myinvestormessagecheckno+"<-----TimelineController[myinvestorreportcheckno 값 출력]");
		model.addAttribute("moneycontent",myinvestormessagecheckno);
		return "user/employeeajax/employeereportsendandreceivecontent";
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
	//자금관리 더보기 클릭시 ajax 요청 페이징
	@RequestMapping(value="/moneyflowalladd.timeline",method=RequestMethod.GET)
	public @ResponseBody List<MoneyAndTitleAndId> moneyflowalladd(Locale locale,Model model,HttpServletRequest request,@RequestParam(value="mfCategory",defaultValue="0")int mfCategory,@RequestParam(value="numberOfRequests",defaultValue="0")int numberOfRequests){
		log.debug("<----- TimelineController[moneyflowall호출]----->");
		log.debug(mfCategory+"<-----TimelineController[mfCategory 값 출력]");
		log.debug(numberOfRequests+"<-----TimelineController[numberOfRequests 값 출력]");
		List<MoneyAndTitleAndId> moneycontent = timelineserviceinterface.getMoneyall(mfCategory,numberOfRequests);
		model.addAttribute("moneycontent",moneycontent);
		log.debug(moneycontent+"<-----TimelineController[moneycontent 값 출력]");
		model.addAttribute("mfCategory",mfCategory);
		return moneycontent;
	}

}
