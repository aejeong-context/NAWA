package com.min.app.model.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.board.WriteBrdDto;

@Service
public class NoticeBoard_ServiceImple implements NoticeBoard_IService{
	
	@Autowired
	private NoticeBoard_IDao dao;
	
	private Logger logger = LoggerFactory.getLogger(NoticeBoard_ServiceImple.class);
	
	/**
	 * <h2>공지사항 조회</h2> 
	 * @return NB_SEQ(SEQ),MI_NCK(닉네임),NB_TITLE(제목),
	 * 		   NB_CON(내용),UC_NAME(카테고리),NB_DFL(삭제여부),NB_RGD(날짜)
	 **/
	
	@Override
	public List<WriteBrdDto> boardList() {
		logger.info("boardList 공지사항 조회, {}");
		return dao.boardList();
	}
	
	/**
	 * <h2>공지사항 상세보기</h2> 
	 * @param NB_SEQ(SEQ)
	 * @return NB_SEQ(SEQ),MI_NCK(닉네임),NB_TITLE(제목),NB_CON(내용),
	 * 		   UC_ID(카테고리),NB_DFL(삭제여부),NB_RGD(날짜)
	 **/

	@Override
	public WriteBrdDto boardSelectOne(String seq) {
		logger.info("boardSelectOne 공지사항 상세보기, {}",seq);
		return dao.boardSelectOne(seq);
	}
	
	/**
	 * <h2>공지사항 작성</h2>
	 * @param UC_ID,NB_TITLE,NB_CON
	 * @return 성공된 row
	 * 이미지 업로드 필요해! @@@@@@@@@@@@@@@@@@@@
	 **/
	@Override
	public int insertBoard(WriteBrdDto dto) {
		logger.info("insertBoard 공지사항 작성, {}",dto);
		return dao.insertBoard(dto);
	}
	
	/**
	 * <h2>공지사항 수정</h2>
	 * @param UC_ID,NB_TITLE,NB_CON,NB_SEQ
	 * @return 성공된 row
	 * 
	 */

	@Override
	public int updateBoard(WriteBrdDto dto) {
		logger.info("updateBoard 공지사항 수정, {}",dto);
		return dao.updateBoard(dto);
	}
	
	/**
	 * <h2>공지사항 삭제</h2>
	 * @param 삭제할 게시글의 SEQ
	 * @return 성공된 row
	 */

	@Override
	public int deleteNotice(String seq) {
		logger.info("deleteNotice 공지사항 삭제, {}",seq);
		return dao.deleteNotice(seq);
	}

	
	/**
	 * <h2>공지사항 리스트(페이징)</h2>
	 * @param x
	 * @return 게시글수
	 */

	@Override
	public int selectTotalPaging() {
		logger.info("selectTotalPaging 페이징");
		return dao.selectTotalPaging();
	}
	/**
	 * <h2>공지사항 리스트(페이징)</h2>
	 * @param start,last
	 * @return 공지사항 페이지 list
	 */
	@Override
	public List<WriteBrdDto> selectPaging(PagingBrdDto paging) {
		logger.info("selectPaging 페이징,{}");
		return dao.selectPaging(paging);
	}

}
