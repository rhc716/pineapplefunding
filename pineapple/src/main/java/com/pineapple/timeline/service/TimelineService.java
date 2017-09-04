package com.pineapple.timeline.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimelineService implements TimelineServiceInterface{
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private TimelineDaoInterface timelinedaointerface;
	//타임라인에서 타임라인 list select
	@Override
	public List<TimelineAndUserAndEmployeeAndTimelineLike> getTimelineList() {
		log.debug("------------------TimelineService-----------------getTimelineList()");
		List<TimelineAndUserAndEmployeeAndTimelineLike> timelinelist = timelinedaointerface.timelineListSelect();
		return timelinelist;
	}
	//타임라인에서 타임라인 등록하기
	@Override
	public int addTimeline(Timeline timeline) {
		log.debug("------------------TimelineService-----------------addTimeline()");
		int timelineinsert = timelinedaointerface.timelineInsert(timeline);
		return timelineinsert;
	}
	//타임라인에서 타임라인 수정하기
	@Override
	public int modifyTimeline(Timeline timeline) {
		log.debug("------------------TimelineService-----------------modifyTimeline()");
		int timelineupdate = timelinedaointerface.timelineUpdate(timeline);
		return timelineupdate;
	}
	//타임라인에서 타임라인 삭제하기
	@Override
	public int removeTimeline(int tlCode) {
		log.debug("------------------TimelineService-----------------removeTimeline()");
		int timelinedelete = timelinedaointerface.timelineDelete(tlCode);
		int timelineandreply = timelinedaointerface.timelineAndReplyDelete(tlCode);
		return timelinedelete+timelineandreply;
	}
	//타임라인에서 타임라인 댓글 list select
	@Override
	public List<TimelineReply> getTimelineReplyList(int tlCode) {
		log.debug("------------------TimelineService-----------------getTimelineReplyList()");
		List<TimelineReply> timelinereplylist = timelinedaointerface.timelineReplyListSelect(tlCode);
		return timelinereplylist;
	}
	//타임라인에서 타임라인 댓글 등록하기
	@Override
	public int addTimelineReply(TimelineReply timelinereply) {
		log.debug("------------------TimelineService-----------------addTimelineReply()");
		int timelinereplyinsert = timelinedaointerface.timelineReplyInsert(timelinereply);
		return timelinereplyinsert;
	}
	//타임라인에서 타임라인 댓글 수정하기
	@Override
	public int modifyTimelineReply(TimelineReply timelinereply) {
		log.debug("------------------TimelineService-----------------modifyTimelineReply()");
		int timelinereplyupdate = timelinedaointerface.timelineReplyUpdate(timelinereply);
		return timelinereplyupdate;
	}
	//타임라인에서 타임라인 댓글 삭제하기
	@Override
	public int removeTimelineReply(int tlReCode) {
		log.debug("------------------TimelineService-----------------removeTimelineReply()");
		int timelinereplydelete = timelinedaointerface.timelineReplyDelete(tlReCode);
		return timelinereplydelete;
	}
	
	
	
	////////////////////////My Page Time Line////////////////////////////////
	//자신이 등록한 타임라인 list 조회
	@Override
	public List<MyInvestorTimeline> getMypageTimelineList(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageTimelineList()");
		List<MyInvestorTimeline> timelinelist = timelinedaointerface.mypageTimelineListSelect(tlId);
		return timelinelist;
	}
	//자신의 한달간의 활동기록 조회
	@Override
	public MyInvestorTimelineLog getMypageTimelineLog(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageTimelineLog()");
		MyInvestorTimelineLog timelinelog = timelinedaointerface.mypageTimelineLogSelect(tlId);
		return timelinelog;
	}
	
	
	
	
	/////////////////My Page Message//////////////////////
	//자신에게 온 메세지 list 조회
	@Override
	public List<Message> getMypageMessageList(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageMessageList()");
		List<Message> messagelist = timelinedaointerface.mypageMessageListSelect(tlId);
		return messagelist;
	}
	//자신에게 온 메세지 open 시 check 확인
	@Override
	public int modifyMypageMessageOpenCheck(int msgCode) {
		log.debug("------------------TimelineService-----------------modifyMypageMessageOpenCheck()");
		int messageopencheck = timelinedaointerface.mypageMessageOpenCheckUpdate(msgCode);
		return messageopencheck;
	}
}
