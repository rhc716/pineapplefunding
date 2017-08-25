package com.pineapple.timeline.service;

import java.util.List;

public interface TimelineDaoInterface {
	//타임라인 main 에서 타임라인 list Dao
	List<TimelineAndUserAndEmployeeAndTimelineLike> timelineListSelect();
	//타임라인 등록하는 Dao
	int timelineInsert(Timeline timeline);
	//타임라인 수정하는 Dao
	int timelineUpdate(Timeline timeline);
	//타임라인 삭제하는 Dao
	int timelineDelete(int tlCode);
	//타임라인 삭제시 댓글도 같이 삭제 Dao
	int timelineAndReplyDelete(int tlCode);
	//타임라인 댓글 목록 조회 Dao
	List<TimelineReply> timelineReplyListSelect(int tlCode);
	//타임라인 댓글 입력 Dao
	int timelineReplyInsert(TimelineReply timelinereply);
}
