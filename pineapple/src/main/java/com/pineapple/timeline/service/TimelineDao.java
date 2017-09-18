package com.pineapple.timeline.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pineapple.invest.service.InvestAndFd;
import com.pineapple.invest.service.MoneyAndTitleAndId;
import com.pineapple.user.service.User;

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
	//펀딩 최신 조회 selectTimelineFundingRankung
	@Override  
	public List<InvestAndFd> timelineFundingRanking() {
		log.debug("TimelineDao-----timelineFundingRanking");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectTimelineFundingRankung");
	}
	//자금관리 전체내역 조회
	@Override
	public List<MoneyAndTitleAndId> moneyInvestall(int mfCategory,int numberOfRequests) {
		log.debug("TimelineDao-----moneyInvestall");
		HashMap<String, Number> map = new HashMap<>();
		// numberOfRequests가 입력됐을때 즉 더보기 버튼을 눌렀을때는 0이 아닐때 이므로 그때에만 map에 저장해줌. 
		if(numberOfRequests==0){
			map.put("mfCategory", mfCategory);
		}else{
			map.put("mfCategory", mfCategory);
			// 5를 곱해서 넣어줘야 limit의 시작점인 페이징x불러온 투자자수가 됨.
			numberOfRequests=numberOfRequests*10;
			map.put("numberOfRequests", numberOfRequests);
		}
		log.debug(map.get("mfCategory")+"<---------------------map.get('mfCategory')");
		log.debug(map.get("numberOfRequests")+"<---------------------map.get('numberOfRequests')");
		
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectmoneyall",map);
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
	
	
	
	//////////////////////////My Page Message ////////////////////////////
	//자신에게 온 메세지 list 조회
	@Override
	public List<Message> mypageMessageListSelect(String tlId) {
		log.debug("TimelineDao-----mypageMessageListSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectMypageMessagelist",tlId);
	}
	//자신에게 온 메세지 open 시 check 확인
	public int mypageMessageOpenCheckUpdate(int msgCode) {
		log.debug("TimelineDao-----mypageMessageListSelect");
		return sqlSessionTemplate.update("com.pineapple.timeline.service.TimelineMapper.updateMypageMessageopencheck",msgCode);
	}
	//receive 검색용 nickname
	@Override
	public List<User> mypageMessageSendReceiveIdSelect(String receiveid) {
		log.debug("TimelineDao-----mypageMessageSendReceiveIdSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectUserNickname",receiveid);
	}
	//메세지 보내기
	@Override
	public int mypageMessageSend(Message message) {
		log.debug("TimelineDao-----mypageMessageSend");
		return sqlSessionTemplate.insert("com.pineapple.timeline.service.TimelineMapper.insertMypageMessage",message);
	}
	//자신이 보낸 메세지 list 조회
	@Override
	public List<Message> mypageMessageSendListSelect(String tlId) {
		log.debug("TimelineDao-----mypageMessageSendListSelect");
		return sqlSessionTemplate.selectList("com.pineapple.timeline.service.TimelineMapper.selectMypageMessagesendlist",tlId);
	}
	//받은 메세지 삭제 
	@Override
	public int mypageMessageDelete(HashMap<String, String[]> msgCodemap) {
		log.debug("TimelineDao-----mypageMessageDelete");
		int sucount = 0;
		for(int i = 0 ; i < msgCodemap.get("msgCodelist").length ; i ++){
			sqlSessionTemplate.delete("com.pineapple.timeline.service.TimelineMapper.deleteMypageMessage",msgCodemap.get("msgCodelist")[i]);
			sucount++;
		}
		return sucount;
	}
	//선택 메세지 읽은 메세지로
	@Override
	public int mypageMessageCheckOkUpdate(HashMap<String, String[]> msgCodemap) {
		log.debug("TimelineDao-----mypageMessageCheckOkUpdate");
		int sucount = 0;
		for(int i = 0 ; i < msgCodemap.get("msgCodelist").length ; i ++){
			sqlSessionTemplate.update("com.pineapple.timeline.service.TimelineMapper.updateMypageMessageCheckOk",msgCodemap.get("msgCodelist")[i]);
			sucount++;}
		return sucount;
	}
	//선택 메세지 읽지않은 메세지로
	@Override
	public int mypageMessageCheckNkUpdate(HashMap<String, String[]> msgCodemap) {
		log.debug("TimelineDao-----mypageMessageCheckNkUpdate");
		int sucount = 0;
		for(int i = 0 ; i < msgCodemap.get("msgCodelist").length ; i ++){
			sqlSessionTemplate.update("com.pineapple.timeline.service.TimelineMapper.updateMypageMessageCheckNo",msgCodemap.get("msgCodelist")[i]);
			sucount++;}
		return sucount;
	}
}
