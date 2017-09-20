package com.pineapple.timeline.service;

import java.util.HashMap;
import java.util.List;

import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.MoneyAndTitleAndId;
import com.pineapple.invest.service.Moneyflow;
import com.pineapple.user.service.User;

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
	//타임라인 댓글 수정 Dao
	int timelineReplyUpdate(TimelineReply timelinereply);
	//타임라인 댓글 삭제 Dao
	int timelineReplyDelete(int tlReCode);
	//펀딩 최신순 검색
	List<InvestAndFd> timelineFundingRanking();
	//자금관리 전체내역 조회
	List<MoneyAndTitleAndId> moneyInvestall(int mfCategory,int numberOfRequests);
	//타임라인 댓글순
	List<TimelineAndUserAndEmployeeAndTimelineLike> timelineListReplySelect();
	//타임라인 인기순
	List<TimelineAndUserAndEmployeeAndTimelineLike>	timelineListLikeSelect();
	
	
	///////////////////////////My Page Time Line /////////////////////////
	//자신이 등록한 타임라인 list 조회
	List<MyInvestorTimeline> mypageTimelineListSelect(String tlId);
	//자신의 한달간의 활동기록 조회
	MyInvestorTimelineLog mypageTimelineLogSelect(String tlId);
	
	//////////////////////////My Page Emp Report//////////////////////////
	List<Companyreport> mypageempreportlistSelect(String Id,String Category,int numberOfRequests);
	//선택 보고서 읽은 보고서로
	int mypageReportCheckOkUpdate(HashMap<String, String[]> msgCodemap);
	//선택 보고서 읽지않은 보고서로
	int mypageReportCheckNkUpdate(HashMap<String, String[]> msgCodemap);
	//선택 보고서 삭제
	int mypageReportDelete(HashMap<String, String[]> msgCodemap);
	
	//////////////////////////My Page Message ////////////////////////////
	//자신에게 온 메세지 list 조회
	List<Message> mypageMessageListSelect(String tlId);
	//자신에게 온 메세지 open 시 check 확인
	int mypageMessageOpenCheckUpdate(int msgCode);
	//receive 검색용 nickname
	List<User> mypageMessageSendReceiveIdSelect(String receiveid);
	//메세지 보내기
	int mypageMessageSend(Message message);
	//자신이 보낸 메세지 list 조회
	List<Message> mypageMessageSendListSelect(String tlId);
	//받은 메세지 삭제
	int mypageMessageDelete(HashMap<String, String[]> msgCodemap);
	//선택 메세지 읽은 메세지로
	int mypageMessageCheckOkUpdate(HashMap<String, String[]> msgCodemap);
	//선택 메세지 읽지않은 메세지로
	int mypageMessageCheckNkUpdate(HashMap<String, String[]> msgCodemap);
}
