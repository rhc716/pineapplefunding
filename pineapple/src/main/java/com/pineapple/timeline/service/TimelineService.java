package com.pineapple.timeline.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.MoneyAndTitleAndId;
import com.pineapple.user.service.User;

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
	//타임라인에서 타임라인 수정하기
	@Override
	public int modifyTimeline(Timeline timeline) {
		log.debug("------------------TimelineService-----------------modifyTimeline()");
		int timelineupdate = timelinedaointerface.timelineUpdate(timeline);
		return timelineupdate;
	}
	//타임라인에서 타임라인 삭제하기
	@Override
	public int removeTimeline(int tlCode) {
		log.debug("------------------TimelineService-----------------removeTimeline()");
		int timelinedelete = timelinedaointerface.timelineDelete(tlCode);
		int timelineandreply = timelinedaointerface.timelineAndReplyDelete(tlCode);
		return timelinedelete+timelineandreply;
	}
	//타임라인에서 타임라인 댓글 list select
	@Override
	public List<TimelineReply> getTimelineReplyList(int tlCode) {
		log.debug("------------------TimelineService-----------------getTimelineReplyList()");
		List<TimelineReply> timelinereplylist = timelinedaointerface.timelineReplyListSelect(tlCode);
		return timelinereplylist;
	}
	//타임라인에서 타임라인 댓글 등록하기
	@Override
	public int addTimelineReply(TimelineReply timelinereply) {
		log.debug("------------------TimelineService-----------------addTimelineReply()");
		int timelinereplyinsert = timelinedaointerface.timelineReplyInsert(timelinereply);
		return timelinereplyinsert;
	}
	//타임라인에서 타임라인 댓글 수정하기
	@Override
	public int modifyTimelineReply(TimelineReply timelinereply) {
		log.debug("------------------TimelineService-----------------modifyTimelineReply()");
		int timelinereplyupdate = timelinedaointerface.timelineReplyUpdate(timelinereply);
		return timelinereplyupdate;
	}
	//타임라인에서 타임라인 댓글 삭제하기
	@Override
	public int removeTimelineReply(int tlReCode) {
		log.debug("------------------TimelineService-----------------removeTimelineReply()");
		int timelinereplydelete = timelinedaointerface.timelineReplyDelete(tlReCode);
		return timelinereplydelete;
	}
	//펀딩 최신 조회
	@Override
	public List<InvestAndFd> getTimelineFundingranking() {
		log.debug("------------------TimelineService-----------------getTimelineFundingranking()");
		List<InvestAndFd> timelinefundingranking = timelinedaointerface.timelineFundingRanking();
		return timelinefundingranking;
	}
	//자금관리 전체내역 조회
	@Override
	public List<MoneyAndTitleAndId> getMoneyall(int mfCategory,int numberOfRequests) {
		log.debug("------------------TimelineService-----------------getMoneyall()");
		List<MoneyAndTitleAndId> getMoneyall = timelinedaointerface.moneyInvestall(mfCategory,numberOfRequests);
		return getMoneyall;
	}

	
	////////////////////////My Page Time Line////////////////////////////////
	//자신이 등록한 타임라인 list 조회
	@Override
	public List<MyInvestorTimeline> getMypageTimelineList(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageTimelineList()");
		List<MyInvestorTimeline> timelinelist = timelinedaointerface.mypageTimelineListSelect(tlId);
		return timelinelist;
	}
	//자신의 한달간의 활동기록 조회
	@Override
	public MyInvestorTimelineLog getMypageTimelineLog(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageTimelineLog()");
		MyInvestorTimelineLog timelinelog = timelinedaointerface.mypageTimelineLogSelect(tlId);
		return timelinelog;
	}
	//타임라인 menu 요청
	@Override
	public List<TimelineAndUserAndEmployeeAndTimelineLike> getTimelineListmenu(String timedataCode) {
		log.debug("------------------TimelineService-----------------getTimelineListmenu()");
		log.debug(timedataCode+"<------------------timedataCode");
		List<TimelineAndUserAndEmployeeAndTimelineLike> returntime = null;
		if(timedataCode.equals("최신")){
			returntime = timelinedaointerface.timelineListSelect(); 
		}else if(timedataCode.equals("댓글")){
			returntime = timelinedaointerface.timelineListReplySelect();
		}else{
			returntime = timelinedaointerface.timelineListLikeSelect();
		}
		return returntime;
	}
	
	
	
	
	
	//////////////////////////My Page Emp Report//////////////////////////
	//보고서 조회
	@Override
	public List<Companyreport> getMypageEmpReportList(String Id, String Category, int numberOfRequests) {
		log.debug("------------------TimelineService-----------------getMypageEmpReportList()");
		List<Companyreport> getMypageEmpReportList = timelinedaointerface.mypageempreportlistSelect(Id,Category,numberOfRequests);
		return getMypageEmpReportList;
	}
	//선택 보고서 읽은 보고서로
	@Override
	public List<Companyreport> updateMypageReportCheckOkList(HashMap<String, String[]> msgCodemap, String userid,String Category,int numberOfRequests) {
		log.debug("------------------TimelineService-----------------updateMypageMessageCheckOkList()");
		timelinedaointerface.mypageReportCheckOkUpdate(msgCodemap);
		List<Companyreport> messagereselect = timelinedaointerface.mypageempreportlistSelect(userid, Category, numberOfRequests);
		return messagereselect;
	}
	//선택 보고서 읽지않은 보고서로
	@Override
	public List<Companyreport> updateMypageReportCheckNoList(HashMap<String, String[]> msgCodemap, String userid,String Category,int numberOfRequests) {
		log.debug("------------------TimelineService-----------------updateMypageMessageCheckNoList()");
		timelinedaointerface.mypageReportCheckNkUpdate(msgCodemap);
		List<Companyreport> messagereselect = timelinedaointerface.mypageempreportlistSelect(userid, Category, numberOfRequests);
		return messagereselect;
	}
	//선택보고서 삭제
	@Override
	public List<Companyreport> deleteMypageReportlist(HashMap<String, String[]> msgCodemap, String userid,
			String Category, int numberOfRequests) {
		log.debug("------------------TimelineService-----------------deleteMypageReportlist()");
		timelinedaointerface.mypageReportDelete(msgCodemap);
		List<Companyreport> messagereselect = timelinedaointerface.mypageempreportlistSelect(userid, Category, numberOfRequests);
		return messagereselect;
	}
	
	
	
	
	
	/////////////////My Page Message//////////////////////
	//자신에게 온 메세지 list 조회
	@Override
	public List<Message> getMypageMessageList(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageMessageList()");
		List<Message> messagelist = timelinedaointerface.mypageMessageListSelect(tlId);
		return messagelist;
	}
	//자신에게 온 메세지 open 시 check 확인
	@Override
	public int modifyMypageMessageOpenCheck(int msgCode) {
		log.debug("------------------TimelineService-----------------modifyMypageMessageOpenCheck()");
		int messageopencheck = timelinedaointerface.mypageMessageOpenCheckUpdate(msgCode);
		return messageopencheck;
	}
	//receive 검색용 nickname
	@Override
	public List<User> getMypageMessageSendReceiveId(String receiveid) {
		log.debug("------------------TimelineService-----------------getMypageMessageSendReceiveId()");
		List<User> messagesendreceiveid = timelinedaointerface.mypageMessageSendReceiveIdSelect(receiveid);
		return messagesendreceiveid;
	}
	//메세지 보내기
	@Override
	public int addMypageMessageSend(Message message) {
		log.debug("------------------TimelineService-----------------addMypageMessageSend()");
		int messagesendinsert = timelinedaointerface.mypageMessageSend(message);
		return messagesendinsert;
	}
	//자신이 보낸 메세지 list 조회
	@Override
	public List<Message> getMypageMessageSendList(String tlId) {
		log.debug("------------------TimelineService-----------------getMypageMessageSendList()");
		List<Message> messagesendlist = timelinedaointerface.mypageMessageSendListSelect(tlId);
		return messagesendlist;
	}
	//받은 메세지 삭제 
	@Override
	public List<Message> removeMypageMessageList(HashMap<String, String[]> msgCodemap,String userid) {
		log.debug("------------------TimelineService-----------------removeMypageMessageList()");
		timelinedaointerface.mypageMessageDelete(msgCodemap);
		List<Message> messagereselect = timelinedaointerface.mypageMessageListSelect(userid);
		return messagereselect;
	}
	//선택 메세지 읽은 메세지로
	@Override
	public List<Message> updateMypageMessageCheckOkList(HashMap<String, String[]> msgCodemap, String userid) {
		log.debug("------------------TimelineService-----------------updateMypageMessageCheckOkList()");
		timelinedaointerface.mypageMessageCheckOkUpdate(msgCodemap);
		List<Message> messagereselect = timelinedaointerface.mypageMessageListSelect(userid);
		return messagereselect;
	}
	//선택 메세지 읽지않은 메세지로
	@Override
	public List<Message> updateMypageMessageCheckNoList(HashMap<String, String[]> msgCodemap, String userid) {
		log.debug("------------------TimelineService-----------------updateMypageMessageCheckNoList()");
		timelinedaointerface.mypageMessageCheckNkUpdate(msgCodemap);
		List<Message> messagereselect = timelinedaointerface.mypageMessageListSelect(userid);
		return messagereselect;
	}
}
