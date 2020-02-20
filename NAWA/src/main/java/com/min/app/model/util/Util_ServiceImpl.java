package com.min.app.model.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class Util_ServiceImpl implements Util_IService{

	private Logger logger=LoggerFactory.getLogger(Util_ServiceImpl.class);
	
	@Autowired
	private Util_Dao_Impl dao;
	
	@Override
	public String changeLC(String uc_id) {
		logger.info("changeLC \t{}",uc_id);
		return dao.changeLC(uc_id);
	}

	@Override
	public String getLatitude(String uc_id) {
		logger.info("getLatitude \t{}",uc_id);
		return dao.getLatitude(uc_id);
	}

}
