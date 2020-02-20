package com.min.app.model.file;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.file.InformFileDto;

@Repository
public class InformFile_DaoImpl implements InformFile_IDao{

	@Autowired
	private SqlSessionTemplate session;
	
	private String NS = "com.min.app.model.file.";

	@Override
	public boolean insertRfile(InformFileDto dto) {
		int n = session.insert(NS+"insertRfile",dto);
		return n>0?true:false;
	}

	@Override
	public boolean insertDfile(InformFileDto dto) {
		int n = session.insert(NS+"insertDfile",dto);
		return n>0?true:false;
	}

	@Override
	public boolean insertInfoFile(InformFileDto dto) {
		int n = session.insert(NS+"insertInfoFile",dto);
		return n>0?true:false;
	}

	@Override
	public boolean insertEventFile(int ef_id) {
		int n = session.insert(NS+"insertEventFile",ef_id);
		return n>0?true:false;
	}

	@Override
	public boolean insertNoticeFile(int nb_seq) {
		int n = session.insert(NS+"insertNoticeFile",nb_seq);
		return n>0?true:false;
	}

	@Override
	public boolean insertProFile(String mr_id) {
		int n = session.insert(NS+"insertProFile",mr_id);
		return n>0?true:false;
	}

	@Override
	public InformFileDto selectRfile(int ef_id) {
		
		return session.selectOne(NS+"selectRfile",ef_id);
	}

	@Override
	public List<InformFileDto> selectDfile(int ef_id) {
		
		return session.selectList(NS+"selectDfile",ef_id);
	}

	@Override
	public List<InformFileDto> selectNoticeFile(int nb_seq) {
		
		return session.selectList(NS+"selectNoticeFile",nb_seq);
	}

	@Override
	public InformFileDto selectProFile(String mr_id) {
		
		return session.selectOne(NS+"selectProFile",mr_id);
	}

	@Override
	public boolean updateProFile(InformFileDto dto) {
		int n = session.update(NS+"updateProFile",dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteFile(int fi_seq) {
		int n = session.delete(NS+"deleteFile",fi_seq);
		return n>0?true:false;
	}

	@Override
	public boolean updateRfile(InformFileDto dto) {
		int n = session.update(NS+"updateRfile",dto);
		return n>0?true:false;
	}

	@Override
	public List<InformEvtDto> selectEvent() {
		
		return session.selectList(NS+"selectEvent");
	}

	@Override
	public List<InformFileDto> selectRList(int ef_id) {
		
		return session.selectList(NS+"selectRfile",ef_id);
	}
	
	
	
	
	

}
