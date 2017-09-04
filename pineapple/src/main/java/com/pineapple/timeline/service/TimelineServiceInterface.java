package com.pineapple.timeline.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public interface TimelineServiceInterface {
	//타임라인 클릭시 타임라인 list Service
	List<TimelineAndUserAndEmployeeAndTimelineLike> getTimelineList();
	//타임라인 등록하는 Service
	int addTimeline(Timeline timeline);
	//타임라인 수정하는 Service
	int modifyTimeline(Timeline timeline);
	//타임라인 삭제하는 Service
	int removeTimeline(int tlCode);
	//타임라인 댓글 list Service
	List<TimelineReply> getTimelineReplyList(int tlCode);
	//타임라인 댓글 등록하는 Service
	int addTimelineReply(TimelineReply timelinereply);
	//타임라인 댓글 수정하는 Service
	int modifyTimelineReply(TimelineReply timelinereply);
	//타임라인 댓글 삭제하는 Service
	int removeTimelineReply(int tlReCode);
	
	/////////////////My Page Time Line//////////////////////
	//자신이 등록한 타임라인 list 조회
	List<MyInvestorTimeline> getMypageTimelineList(String tlId);
	//자신의 한달간의 활동기록 조회
	MyInvestorTimelineLog getMypageTimelineLog(String tlId);
	
	
	/////////////////My Page Message//////////////////////
	//자신에게 온 메세지 list 조회
	List<Message> getMypageMessageList(String tlId);
	//자신에게 온 메세지 open 시 check 확인
	int modifyMypageMessageOpenCheck(int msgCode);
	
}
