package com.pineapple.timeline.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.MoneyAndTitleAndId;
import com.pineapple.user.service.User;
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
	//펀딩 최신 조회
	List<InvestAndFd> getTimelineFundingranking();
	//자금관리 전체내역 조회
	List<MoneyAndTitleAndId> getMoneyall(int mfCategory,int numberOfRequests);	

	
	
	/////////////////My Page Time Line//////////////////////
	//자신이 등록한 타임라인 list 조회
	List<MyInvestorTimeline> getMypageTimelineList(String tlId);
	//자신의 한달간의 활동기록 조회
	MyInvestorTimelineLog getMypageTimelineLog(String tlId);
	
	
	//////////////////////////My Page Emp Report//////////////////////////
	List<Companyreport> getMypageEmpReportList(String Id, String Category,int numberOfRequests);
	//선택 보고서 읽은 보고서로
	List<Companyreport> updateMypageReportCheckOkList(HashMap<String, String[]> msgCodemap,String userid,String Category,int numberOfRequests);
	//선택 보고서 읽지않은 보고서로
	List<Companyreport> updateMypageReportCheckNoList(HashMap<String, String[]> msgCodemap,String userid,String Category,int numberOfRequests);
	
	
	
	/////////////////My Page Message//////////////////////
	//자신에게 온 메세지 list 조회
	List<Message> getMypageMessageList(String tlId);
	//자신에게 온 메세지 open 시 check 확인
	int modifyMypageMessageOpenCheck(int msgCode);
	//receive 검색용 nickname
	List<User> getMypageMessageSendReceiveId(String receiveid);
	//메세지 보내기
	int addMypageMessageSend(Message message);
	//자신이 보낸 메세지 list 조회
	List<Message> getMypageMessageSendList(String tlId);
	//받은 메세지 삭제
	List<Message> removeMypageMessageList(HashMap<String, String[]> msgCodemap,String userid);
	//선택 메세지 읽은 메세지로
	List<Message> updateMypageMessageCheckOkList(HashMap<String, String[]> msgCodemap,String userid);
	//선택 메세지 읽지않은 메세지로
	List<Message> updateMypageMessageCheckNoList(HashMap<String, String[]> msgCodemap,String userid);
}
