package com.pineapple.timeline.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimelineDao implements TimelineDaoInterface{
	private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    //타임라인 list select
	@Override
	public List<TimelineAndUserAndEmployeeAndTimelineLike> timelineListSelect() {
		log.debug("TimelineDao-----timelineListSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectTimelineList");
	}
	//타임라인 등록하기
	@Override
	public int timelineInsert(Timeline timeline) {
		log.debug("TimelineDao-----timelineInsert");
		return sqlSessionTemplate.insert("com.pineapple.timeline.service.TimelineMapper.insertTimeline",timeline);
	}
	//타임라인 수정하기
	@Override
	public int timelineUpdate(Timeline timeline) {
		log.debug("TimelineDao-----timelineInsert");
		return sqlSessionTemplate.update("com.pineapple.timeline.service.TimelineMapper.updateTimeline",timeline);
	}
	//타임라인 삭제하기
	@Override
	public int timelineDelete(int tlCode) {
		log.debug("TimelineDao-----timelinedelete");
		return sqlSessionTemplate.delete("com.pineapple.timeline.service.TimelineMapper.deleteTimeline",tlCode);
	}
	//타임라인 삭제시 댓글도 같이 삭제하기
	@Override
	public int timelineAndReplyDelete(int tlCode) {
		log.debug("TimelineDao-----timelineAndReplyDelete");
		return sqlSessionTemplate.delete("com.pineapple.timeline.service.TimelineMapper.deleteTimelineAndReply",tlCode);
	}
	//타임라인 댓글 list select
	@Override
	public List<TimelineReply> timelineReplyListSelect(int tlCode) {
		log.debug("TimelineDao-----timelineReplyListSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectTimelineReplyList",tlCode);
	}
	//타임라인 댓글 등록하기
	@Override
	public int timelineReplyInsert(TimelineReply timelinereply) {
		log.debug("TimelineDao-----timelineReplyInsert");
		return sqlSessionTemplate.insert("com.pineapple.timeline.service.TimelineMapper.insertTimelineReply",timelinereply);
	}
	//타임라인 댓글 수정하기
	@Override
	public int timelineReplyUpdate(TimelineReply timelinereply) {
		log.debug("TimelineDao-----timelineReplyUpdate");
		return sqlSessionTemplate.update("com.pineapple.timeline.service.TimelineMapper.updateTimelineReply",timelinereply);
	}
	//타임라인 댓글 삭제하기
	@Override
	public int timelineReplyDelete(int tlReCode) {
		log.debug("TimelineDao-----timelineReplyDelete");
		return sqlSessionTemplate.delete("com.pineapple.timeline.service.TimelineMapper.deleteTimelineReply",tlReCode);
	}
	
	
	
	
	////////////////////////////My Page Time Line///////////////////////////
	//자신이 등록한 타임라인 list 조회
	@Override
	public List<MyInvestorTimeline> mypageTimelineListSelect(String tlId) {
		log.debug("TimelineDao-----mypageTimelineListSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectMypageTimelineList",tlId);
	}
	//자신의 한달간의 활동기록 조회
	@Override
	public MyInvestorTimelineLog mypageTimelineLogSelect(String tlId) {
		log.debug("TimelineDao-----mypageTimelineLogSelect");
		return sqlSessionTemplate.selectOne("com.pineapple.timeline.service.TimelineMapper.selectMypageTimelinelog",tlId);
	}
}
