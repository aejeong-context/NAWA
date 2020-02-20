package com.min.app.model.file;


import java.util.List;

import com.min.app.dto.file.InformFileDto;

public interface InformFile_IService {
		
	public boolean insertRfile(InformFileDto dto, int ef_id);
	public boolean insertDfile(InformFileDto dto,int ef_id);
	public boolean insertNoticeFile(InformFileDto dto, int nb_seq);
	public boolean insertProFile(InformFileDto dto,String mr_id);
	public InformFileDto selectRfile(int ef_id);
	public List<InformFileDto> selectDfile(int ef_id);
	public List<InformFileDto> selectNoticeFile(int nb_seq);
	public InformFileDto selectProFile(String mr_id);
	public boolean updateProFile(InformFileDto dto);
	public boolean deleteFile(int fi_seq);
	public boolean updateRfile(InformFileDto dto);
	public List<InformFileDto> selectRList();
}
