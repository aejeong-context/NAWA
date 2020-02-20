package com.min.app.model.eventboard;

import java.util.List;

import com.min.app.dto.board.EventBrdDto;
import com.min.app.dto.event.ParticEvtDto;

public interface EventBoard_IService {
	
	public List<EventBrdDto> selectInquiry(int ef_id);
	public boolean insertInquiry(EventBrdDto dto);
	public boolean reply(EventBrdDto dto);
	public boolean modifyInquiry(EventBrdDto dto);
	// 문의만 삭제
	public boolean delReplyInquiry(EventBrdDto dto);
	// 문의,문의답변 둘다 삭제
	public boolean delAllInquiry(int eb_refer);
	
	
	public List<EventBrdDto> selectReview(int ef_id);
	public boolean insertReview(EventBrdDto dto);
	public boolean modifyReview(EventBrdDto dto);
	public boolean deleteReview(int eb_seq);
	public String epAuth(ParticEvtDto dto);

}
