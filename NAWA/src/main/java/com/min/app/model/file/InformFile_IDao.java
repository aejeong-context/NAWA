package com.min.app.model.file;

import java.util.List;

import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.file.InformFileDto;

public interface InformFile_IDao {
	
	public boolean insertRfile(InformFileDto dto);
	public boolean insertDfile(InformFileDto dto);
	public boolean insertInfoFile(InformFileDto dto);
	public boolean insertEventFile(int ef_id);
	public boolean insertNoticeFile(int nb_seq);
	public boolean insertProFile(String mr_id);
	public InformFileDto selectRfile(int ef_id);
	public List<InformFileDto> selectDfile(int ef_id);
	public List<InformFileDto> selectNoticeFile(int nb_seq);
	public InformFileDto selectProFile(String mr_id);
	public boolean updateProFile(InformFileDto dto);
	public boolean deleteFile(int fi_seq);
	public boolean updateRfile(InformFileDto dto);
	public List<InformEvtDto> selectEvent();
	public List<InformFileDto> selectRList(int ef_id);
}
