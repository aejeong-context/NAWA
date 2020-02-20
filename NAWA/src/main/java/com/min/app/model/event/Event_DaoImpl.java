package com.min.app.model.event;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.event.PartiSearchDto;
import com.min.app.dto.event.ParticEvtDto;
import com.min.app.dto.event.SearchEvtDto;
import com.min.app.dto.member.PrivacyMemDto;

@Repository
public class Event_DaoImpl implements Event_IDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	private final String NS = "com.min.app.model.event.";
	private Logger logger = LoggerFactory.getLogger(Event_DaoImpl.class);

	// 이벤트 조회
	@Override
	public List<InformEvtDto> eventSelect() {
		return sqlsession.selectList(NS + "eventSelect");
	}

	// 이벤트 검색
	@Override
	public List<InformEvtDto> eventSearch(SearchEvtDto sdto) {
		System.out.println(sdto);
		return sqlsession.selectList(NS + "eventSearch", sdto);
	}

	// 이벤트 검색 결과 갯수
	@Override
	public int eventCountSearch(SearchEvtDto ESdto) {
		return sqlsession.selectOne(NS + "eventCountSearch", ESdto);
	}

	// 글 갯수
	@Override
	public int CountList() {
		return sqlsession.selectOne(NS + "CountList");
	}

	// 이벤트 리스트 조회(페이징)
	@Override
	public List<InformEvtDto> pageList(PagingBrdDto pdto) {
		System.out.println("다오 : " + pdto);
		return sqlsession.selectList(NS + "pageList", pdto);
	}

	// 이벤트 개설
	@Override
	public int eventCreate(InformEvtDto dto) {
		System.out.println("다오 : " + dto.getEf_id());
		return sqlsession.insert(NS + "eventCreate", dto);
	}

	// 개설하고 개설자를 참가자테이블에 등록!
	@Override
	public int eventPati(String mi_nck) {
		System.out.println("eventPati 진입");
		return sqlsession.insert(NS + "eventPati", mi_nck);
	}

	// 개설자의 이벤트 개설횟수 증가
	@Override
	public int eventMakeIncre(String mi_nck) {
		System.out.println("eventMakeIncre 진입");
		return sqlsession.update(NS + "eventMakeIncre", mi_nck);
	}

	// REFER를 EF_ID 같게 해주는 쿼리
	@Override
	public int eventIdRefer(int ef_id) {
		System.out.println("eventIdRefer 진입");
		System.out.println("ef_id : " + ef_id);
		return sqlsession.update(NS + "eventIdRefer", ef_id);
	}

	// 이벤트 상세보기
	@Override
	public InformEvtDto eventDetail(int ef_id) {
		return sqlsession.selectOne(NS + "eventDetail", ef_id);
	}

	// 마감된 이벤트의 상세보기
	@Override
	public InformEvtDto eventCloseDetail(int ef_id) {
		return sqlsession.selectOne(NS + "eventCloseDetail", ef_id);
	}

	// EF_CLOSE = 'Y'
	@Override
	public int eventClose(int ef_id) {
		return sqlsession.update(NS + "eventClose", ef_id);
	}

	// 이벤트 삭제, 폐쇄 전에 참가자 테이블에 있는 참가자 삭제
	@Override
	public int eventEPDel(int ef_id) {
		return sqlsession.delete(NS + "eventEPDel", ef_id);
	}

	// 이벤트 삭제, 폐쇄 전에 초대자 테이블에 있는 초대자 삭제
	@Override
	public int eventEIDel(int ef_id) {
		return sqlsession.update(NS + "eventEIDel", ef_id);
	}

	// 이벤트 삭제 전에 EF_STATUS = 'C'
	@Override
	public int eventUpStat(int ef_id) {
		return sqlsession.update(NS + "eventUpStat", ef_id);
	}

	// 이벤트 삭제 전 백업
	@Override
	public int eventInSel(int ef_id) {
		return sqlsession.insert(NS + "eventInSel", ef_id);
	}

	// 이벤트 삭제
	@Override
	public int eventDelete(int ef_id) {
		return sqlsession.delete(NS + "eventDelete", ef_id);
	}

	// 이벤트 수정
	@Override
	public boolean eventModify(InformEvtDto dto) {
		int cnt = sqlsession.update(NS + "eventModify", dto);
		return cnt > 0 ? true : false;
	}

	// 조회수 증가
	@Override
	public boolean eventReadCount(int ef_id) {
		int cnt = sqlsession.update(NS + "eventReadCount", ef_id);
		return cnt > 0 ? true : false;
	}

	// 이벤트 재개설
	@Override
	public int eventReCreate(InformEvtDto dto) {
		return sqlsession.insert(NS + "eventReCreate", dto);
	}

//	 이벤트 참가자 조회
	@Override
	public List<PartiSearchDto> eventLineUp(int ef_id) {
		return sqlsession.selectList(NS + "eventLineUp", ef_id);
	}

	// 이벤트 마감
	@Override
	public boolean eventEnd(int ef_id) {
		int cnt = sqlsession.update(NS + "eventEnd", ef_id);
		return cnt > 0 ? true : false;
	}

	// 개설자 닉네임 조회
	@Override
	public String eventNickFind(int ef_id) {
		return sqlsession.selectOne(NS + "eventNickFind", ef_id);
	}

	// 세션 내 지역 확인 후 리스트 조회
	@Override
	public List<InformEvtDto> eventLocationCompare(String mi_lc) {
		return sqlsession.selectList(NS + "eventLocationCompare", mi_lc);
	}

	@Override
	public int eventCount(String mi_nck) {

		logger.info("Event_daoImple.eventcount");
		return sqlsession.update(NS + "eventcount", mi_nck);
	}

	@Override
	public int eventJoin(ParticEvtDto dto) {
		logger.info("Event_daoImple.eventjoin");
		return sqlsession.insert(NS + "eventjoin", dto);
	}

	@Override
	public String checkJoin(int ef_id) {
		logger.info("Event_daoImple.eventminus");
		return sqlsession.selectOne(NS + "checkjoin", ef_id);
	}

	@Override
	public int statusUpdate(int ef_id) {
		logger.info("Event_daoImple.eventminus");
		return sqlsession.update(NS + "statusupdate", ef_id);
	}

	@Override
	public int eventOut(ParticEvtDto dto) {
		logger.info("Event_daoImple.eventout");
		return sqlsession.delete(NS + "eventout", dto);
	}

	@Override
	public int eventMinus(String mi_nck) {
		logger.info("Event_daoImple.eventminus");
		return sqlsession.update(NS + "eventminus", mi_nck);
	}

	@Override
	public int watingEventJoin(ParticEvtDto dto) {
		logger.info("Event_daoImple.watingeventjoin");
		return sqlsession.insert(NS + "watingeventjoin", dto);
	}

	@Override
	public int watingEventOut(String mi_nck) {
		logger.info("Event_daoImple.watingeventout");
		return sqlsession.delete(NS + "watingeventout", mi_nck);
	}

	@Override
	public String checkEnd(int ef_id) {
		logger.info("Event_daoImple.checkend");
		return sqlsession.selectOne(NS + "checkend", ef_id);
	}

	@Override
	public String checkWating() {
		logger.info("Event_daoImple.checkwating");
		return sqlsession.selectOne(NS + "checkwating");
	}

	@Override
	public int addWating(ParticEvtDto dto) {
		logger.info("Event_daoImple.addWating");
		return sqlsession.insert(NS + "addWating", dto);
	}

	@Override
	public String checkJoined(ParticEvtDto dto) {
		logger.info("Event_daoImple.checkjoined");
		return sqlsession.selectOne(NS + "checkjoined", dto);
	}

	@Override
	public int autoWatingOut() {
		logger.info("Event_daoImple.autowatingout");
		return sqlsession.delete(NS + "autowatingout");
	}

	@Override
	public String wcheckJoined(ParticEvtDto dto) {
		return sqlsession.selectOne(NS + "wcheckjoined", dto);
	}

	@Override
	public String checkNum(ParticEvtDto dto) {
		return sqlsession.selectOne(NS + "checknum", dto);
	}

	@Override
	public int openStatus(ParticEvtDto dto) {
		return sqlsession.update(NS + "openstatus", dto);
	}

	@Override
	public int userTotalCount() {
		return sqlsession.selectOne(NS + "userTotalCount");
	}

	@Override
	public int partiUserCount() {
		return sqlsession.selectOne(NS + "partiUserCount");
	}

	@Override
	public int endEvent() {
		return sqlsession.selectOne(NS + "endEvent");
	}

	@Override
	public int continueEvent() {
		return sqlsession.selectOne(NS + "continueEvent");
	}

	@Override
	public PrivacyMemDto eventPhoneEmail(int ef_id) {
		return sqlsession.selectOne(NS + "eventPhoneEmail", ef_id);
	}

	@Override
	public int endEf() {
		logger.info("Event_daoImple.endEf");
		return sqlsession.selectOne(NS + "endEf");
	}

	@Override
	public int endStatus() {
		logger.info("Event_daoImple.endStatus");
		return sqlsession.update(NS + "endStatus");
	}
}
