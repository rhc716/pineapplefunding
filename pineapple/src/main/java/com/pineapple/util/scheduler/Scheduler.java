package com.pineapple.util.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	펀딩상태 변화 스케줄러	
//  현재날짜와 펀딩내에 있는 모집일, 마감일, 프로젝트 시작일, 프로젝트 종료일을 비교하고
//  펀딩금액 목표 달성 여부를 체크해서 펀딩상태를 변화시키는 과정 
	public void doJob(){
		long now = System.currentTimeMillis();
		Date date = new Date(now);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String getTime = sdf.format(date);
		log.debug("스케줄러 // 현재날짜 : "+ getTime);
		

//		모집중 -> 결제모집중
//		(모집중인것들 중에서 마감일 다음날 투자테이블의 해당펀딩의 구입주식수의 총합이 >= 판매주식수 )
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.fundingUpdateScheduleOne", getTime);
		
//		결제모집중 -> 진행중
//		(결제모집중인것들 중에서 프로젝트 시작일에 해당펀딩의 결제여부 1인것중, 구입주식수의 총합 >= 판매주식수 )
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.fundingUpdateScheduleTwo", getTime);
		
//		진행중 -> 마감
//		(진행중인것들 중에서 프로젝트 종료일 다음날 )
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.fundingUpdateScheduleThree", getTime);
		
//		모집중 -> 모집실패
//		(모집중인것들 중에서 마감일 다음날 투자테이블의 해당펀딩 구입주식수의 총합이 < 판매주식수)
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.fundingUpdateScheduleFour", getTime);
		
//		결제모집중 -> 모집실패
//		(결제모집중인것들 중에서 프로젝트 시작일에 해당펀딩의 결제여부가 1인것중, 구입주식수의 총합 < 판매주식수 )
		sqlSessionTemplate.update("com.pineapple.funding.service.FundingMapper.fundingUpdateScheduleFive", getTime);
		
		
		
		
	}
}

