package com.min.app.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.min.app.model.event.Event_IService;

@Component
public class Scheduler {

	@Autowired
	private Event_IService e_service; // event

	// 스케줄러 사용 위한 변수
	public static int userCount;
	public static int partiUser;
	public static int endEvent;
	public static int continueEvent;
	public static int count = 0;

	// 스케줄러
	@Scheduled(cron = "0 0 0 * * *")
	public void scaduler() {
		count++;
		System.out.println(count);
		System.out.println(userCount + "확인");
		try {
			userCount = e_service.userTotalCount();
			partiUser = e_service.partiUserCount();
			endEvent = e_service.endEvent();
			continueEvent = e_service.continueEvent();
			e_service.endEf();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
