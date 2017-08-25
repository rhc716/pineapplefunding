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
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.getTimelineList");
	}
	//타임라인 등록하기
	@Override
	public int timelineInsert(Timeline timeline) {
		log.debug("TimelineDao-----timelineInsert");
		return sqlSessionTemplate.insert("com.pineapple.timeline.service.TimelineMapper.addTimeline",timeline);
	}
	//타임라인 수정하기
	@Override
	public int timelineUpdate(Timeline timeline) {
		log.debug("TimelineDao-----timelineInsert");
		return sqlSessionTemplate.update("com.pineapple.timeline.service.TimelineMapper.modifyTimeline",timeline);
	}
	//타임라인 삭제하기
	@Override
	public int timelineDelete(int tlCode) {
		log.debug("TimelineDao-----timelinedelete");
		return sqlSessionTemplate.delete("com.pineapple.timeline.service.TimelineMapper.removeTimeline",tlCode);
	}
	//타임라인 삭제시 댓글도 같이 삭제하기
	@Override
	public int timelineAndReplyDelete(int tlCode) {
		log.debug("TimelineDao-----timelineAndReplyDelete");
		return sqlSessionTemplate.delete("com.pineapple.timeline.service.TimelineMapper.removeTimelineAndReply",tlCode);
	}
	//타임라인 댓글 list select
	@Override
	public List<TimelineReply> timelineReplyListSelect(int tlCode) {
		log.debug("TimelineDao-----timelineReplyListSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.getTimelineReplyList",tlCode);
	}
	//타임라인 댓글 등록하기
	@Override
	public int timelineReplyInsert(TimelineReply timelinereply) {
		log.debug("TimelineDao-----timelineReplyInsert");
		return sqlSessionTemplate.insert("com.pineapple.timeline.service.TimelineMapper.addTimelineReply",timelinereply);
	}
}
