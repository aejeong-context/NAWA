package com.min.app.model.file;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.file.InformFileDto;

@Service
public class InformFile_ServiceImpl implements InformFile_IService{
	
	@Autowired
	private InformFile_IDao dao;
	
	private Logger logger = LoggerFactory.getLogger(InformFile_ServiceImpl.class);

	@Override
	@Transactional
	public boolean insertRfile(InformFileDto dto, int ef_id) {
		logger.info("insertRfile");
		dao.insertRfile(dto);
		boolean iscE = dao.insertEventFile(ef_id);
		
		return iscE?true:false;
	}

	@Override
	@Transactional
	public boolean insertDfile(InformFileDto dto, int ef_id) {
		dao.insertDfile(dto);
		boolean iscE =dao.insertEventFile(ef_id);
		return iscE?true:false;
	}

	@Override
	@Transactional
	public boolean insertNoticeFile(InformFileDto dto, int nb_seq) {
		dao.insertInfoFile(dto);
		boolean iscN = dao.insertNoticeFile(nb_seq);
		return iscN?true:false;
	}

	@Override
	@Transactional
	public boolean insertProFile(InformFileDto dto, String mr_id) {
		dao.insertInfoFile(dto);
		boolean iscP = dao.insertProFile(mr_id);
		return iscP?true:false;
	}

	@Override
	public InformFileDto selectRfile(int ef_id) {
		
		return dao.selectRfile(ef_id);
	}

	@Override
	public List<InformFileDto> selectDfile(int ef_id) {
		
		return dao.selectDfile(ef_id);
	}

	@Override
	public List<InformFileDto> selectNoticeFile(int nb_seq) {
		
		return dao.selectNoticeFile(nb_seq);
	}

	@Override
	public InformFileDto selectProFile(String mr_id) {
		
		return dao.selectProFile(mr_id);
	}

	@Override
	public boolean updateProFile(InformFileDto dto) {
		boolean isc = dao.updateProFile(dto);
		return isc?true:false;
	}

	@Override
	public boolean deleteFile(int fi_seq) {
		boolean isc = dao.deleteFile(fi_seq);
		return isc?true:false;
	}

	@Override
	public boolean updateRfile(InformFileDto dto) {
		boolean isc = dao.updateRfile(dto);
		return isc?true:false;
	}

	@Override
	public List<InformFileDto> selectRList() {
		List<InformEvtDto> dto = dao.selectEvent();
		List<InformFileDto> list = new ArrayList<InformFileDto>();
		for (InformEvtDto eDto : dto) {
			int ef_id = eDto.getEf_id();
			InformFileDto rdto = dao.selectRfile(ef_id);
			list.add(rdto);
		}
		//System.out.println(list);
		return list;
	}

	

}
