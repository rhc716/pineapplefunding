package com.pineapple.util.scheduler;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	private Logger log = Logger.getLogger(this.getClass());
	
	public void doJob(){
		//log.debug("스케줄러 작동 테스트");
	}
}
