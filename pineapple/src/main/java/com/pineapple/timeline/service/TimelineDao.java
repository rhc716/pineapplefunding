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
}
