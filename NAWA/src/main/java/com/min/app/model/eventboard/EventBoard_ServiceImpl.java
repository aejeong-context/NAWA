package com.min.app.model.eventboard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.app.dto.board.EventBrdDto;
import com.min.app.dto.event.ParticEvtDto;

@Service
public class EventBoard_ServiceImpl implements EventBoard_IService{
	
	@Autowired
	private EventBoard_IDao dao;
	
	private Logger log = LoggerFactory.getLogger(EventBoard_ServiceImpl.class);
	

	@Override
	public List<EventBrdDto> selectInquiry(int ef_id) {
		log.info("selectInquiry 문의 조회"+ef_id);
		return dao.selectInquiry(ef_id);
	}

	@Override
	public boolean insertInquiry(EventBrdDto dto) {
		log.info("insertInquiry 문의 작성",dto);
		
		return dao.insertInquiry(dto);
	}

	@Override
	public boolean reply(EventBrdDto dto) {
		log.info("reply 문의 답변",dto);
		boolean isc = dao.replyIn(dto);
		return isc?true:false;
	}

	@Override
	public boolean modifyInquiry(EventBrdDto dto) {
		log.info("modifyInquiry 문의 수정",dto);
		
		return dao.modifyInquiry(dto);
	}

	@Override
	public boolean delReplyInquiry(EventBrdDto dto) {
		log.info("delInquiry 문의 답변 삭제",dto);
		
		
		
		return dao.delReplyInquiry(dto);
	}
	
	@Override
	public boolean delAllInquiry(int eb_refer) {
		log.info("delAllInquiry 문의 답변 둘다 삭제",eb_refer);
		
		return dao.delAllInquiry(eb_refer);
	}
	

	@Override
	public List<EventBrdDto> selectReview(int ef_id) {
		log.info("selectReview 후기 조회",ef_id);
		return dao.selectReview(ef_id);
	}

	@Override
	public boolean insertReview(EventBrdDto dto) {
		log.info("insertReveiw 후기 작성",dto);
		return dao.insertReview(dto);
	}

	@Override
	public boolean modifyReview(EventBrdDto dto) {
		log.info("modifyReview 후기 수정",dto);
		return dao.modifyReview(dto);
	}

	@Override
	public boolean deleteReview(int eb_seq) {
		log.info("deleteReview 후기 삭제",eb_seq);
		return dao.deleteReview(eb_seq);
	}

	@Override
	public String epAuth(ParticEvtDto dto) {
		log.info("epAuth 참가 권한 확인 ",dto);
		return dao.epAuth(dto);
	}




}
