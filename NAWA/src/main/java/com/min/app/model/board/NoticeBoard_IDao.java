package com.min.app.model.board;

import java.util.List;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.board.WriteBrdDto;


public interface NoticeBoard_IDao {
	//공지사항 리스트
	public List<WriteBrdDto>boardList();
	//상세보기 
	public WriteBrdDto boardSelectOne(String seq);
	//공지사항 작성
	public int insertBoard(WriteBrdDto dto);
	//공지사항 수정
	public int updateBoard(WriteBrdDto dto);
	//공지사항 삭제
	public int deleteNotice(String seq);
	//파일 상세 테이블
	public int fileImage(WriteBrdDto dto);
	//공지사항 파일 중계 id
	public int fileId(WriteBrdDto dto);
	
	
	//페이징
	public int selectTotalPaging();
	public List<WriteBrdDto> selectPaging(PagingBrdDto paging);

}
