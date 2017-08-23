package com.pineapple.timeline.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public interface TimelineServiceInterface {
	//타임라인 클릭시 타임라인 list Service
	List<TimelineAndUserAndEmployeeAndTimelineLike> getTimelineList();
	//타임라인 등록하는 Service
	int addTimeline(Timeline timeline);
}
