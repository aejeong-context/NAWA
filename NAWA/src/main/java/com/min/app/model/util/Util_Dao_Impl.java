package com.min.app.model.util;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class Util_Dao_Impl implements Util_IDao {

	private final String NS="com.min.app.model.util.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	@Transactional(readOnly = true)
	public String changeLC(String uc_id) {
		return session.selectOne(NS+"changeLC",uc_id);
	}

	@Override
	public String getLatitude(String uc_id) {
		// TODO Auto-generated method stub
		return session.selectOne("getLatitude",uc_id);
	}

}
