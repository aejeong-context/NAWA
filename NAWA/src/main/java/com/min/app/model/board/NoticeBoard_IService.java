package com.min.app.model.board;

import java.util.List;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.board.WriteBrdDto;


public interface NoticeBoard_IService {
	
	//공지사항 전체조회
	public List<WriteBrdDto> boardList();
	//공지사항 상세보기
	public WriteBrdDto boardSelectOne(String seq);
	//공지사항 작성 파일 정보 insert
	public int insertBoard(WriteBrdDto dto);
	public int updateBoard(WriteBrdDto dto);
	//삭제여부만 변경 update
	public int deleteNotice(String seq);
	
	//페이징
	public List<WriteBrdDto> selectPaging(PagingBrdDto paging);
	public int selectTotalPaging();

}
