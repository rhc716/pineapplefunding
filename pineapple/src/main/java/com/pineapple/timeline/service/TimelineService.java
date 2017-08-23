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
}
