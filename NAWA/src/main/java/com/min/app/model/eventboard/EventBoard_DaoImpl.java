package com.min.app.model.eventboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.app.dto.board.EventBrdDto;
import com.min.app.dto.event.ParticEvtDto;

@Repository
public class EventBoard_DaoImpl implements EventBoard_IDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String NS ="com.min.app.model.eventboard.";

	@Override
	public List<EventBrdDto> selectInquiry(int ef_id) {
		
		return session.selectList(NS+"selectInquiry",ef_id);
	}

	@Override
	public boolean insertInquiry(EventBrdDto dto) {
		int n = session.insert(NS+"insertInquiry",dto);
		return n>0?true:false;
	}


	@Override
	public boolean replyIn(EventBrdDto dto) {
		int n = session.insert(NS+"replyIn",dto);
		return n>0?true:false;
	}

	@Override
	public boolean modifyInquiry(EventBrdDto dto) {
		int n =session.update(NS+"modifyInquiry",dto);
		return n>0?true:false;
	}

	@Override
	public boolean delReplyInquiry(EventBrdDto dto) {
		int n =session.update(NS+"delReplyInquiry",dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean delAllInquiry(int eb_refer) {
		int n = session.update(NS+"delAllInquiry",eb_refer);
		return n>0?true:false;	
	}
	
	
	@Override
	public List<EventBrdDto> selectReview(int ef_id) {
		
		return session.selectList(NS+"selectReview",ef_id);
	}

	@Override
	public boolean insertReview(EventBrdDto dto) {
		int n =session.insert(NS+"insertReview",dto);
		return n>0?true:false;
	}

	@Override
	public boolean modifyReview(EventBrdDto dto) {
		int n = session.update(NS+"modifyReview",dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteReview(int eb_seq) {
		int n = session.delete(NS+"deleteReview",eb_seq);
		return n>0?true:false;
	}

	@Override
	public EventBrdDto selectOneReview(int eb_seq) {
		
		return session.selectOne(NS+"selectOneReview",eb_seq);
	}

	@Override
	public String epAuth(ParticEvtDto dto) {
		
		return session.selectOne(NS+"epAuth",dto);
	}

	


}
