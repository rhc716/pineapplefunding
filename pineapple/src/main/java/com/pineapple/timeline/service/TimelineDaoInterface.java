package com.pineapple.timeline.service;

import java.util.List;

public interface TimelineDaoInterface {
	//타임라인 main 에서 타임라인 list Dao
	List<TimelineAndUserAndEmployeeAndTimelineLike> timelineListSelect();
}
