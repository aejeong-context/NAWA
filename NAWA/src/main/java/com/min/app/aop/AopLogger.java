package com.min.app.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AopLogger {

	public void before(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("=============logger 시작=============");
		
		Object[] args =  j.getArgs();
		
		if(args!=null) {
			logger.info("Method 명 :\t"+j.getSignature().getName());
			for (int i = 0; i < args.length; i++) {
				logger.info(i+":번째:\t"+args[i]);
			}
			logger.info("Method 명 :\t"+j.getSignature().getName());
		}
	}
	
	//반환타입이 있을때
	public void afterReturning(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("============= logger 끝 =============");
	}
	
	//예외가 발생 했을때
	public void daoException(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("에러:\t"+j.getArgs());
		logger.info("에러:\t"+j.toString());
		
	}
	
	
	
}




