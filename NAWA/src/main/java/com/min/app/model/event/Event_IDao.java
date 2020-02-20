package com.min.app.model.event;

import java.util.List;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.event.PartiSearchDto;
import com.min.app.dto.event.ParticEvtDto;
import com.min.app.dto.event.SearchEvtDto;
import com.min.app.dto.member.PrivacyMemDto;

public interface Event_IDao {

	// 이벤트 조회
	public List<InformEvtDto> eventSelect();

	// 페이징
	// 글 갯수
	public int CountList();

	// 이벤트 리스트(페이징)
	public List<InformEvtDto> pageList(PagingBrdDto pdto);

	// 이벤트 검색
	public List<InformEvtDto> eventSearch(SearchEvtDto sdto);

	// 이벤트 검색 결과 갯수
	public int eventCountSearch(SearchEvtDto sdto);

	// 이벤트 개설, 재개설
	public int eventCreate(InformEvtDto dto);
	public int eventReCreate(InformEvtDto dto);
	public int eventPati(String mi_nck);
	public int eventMakeIncre(String mi_nck);
	public int eventIdRefer(int ef_id);

	// 이벤트 상세보기
	public InformEvtDto eventDetail(int ef_id);
	public boolean eventReadCount(int ef_id);
	public PrivacyMemDto eventPhoneEmail(int ef_id);

	// 마감된 이벤트 상세보기
	public InformEvtDto eventCloseDetail(int ef_id);

	// 이벤트 폐쇄(+참가자, 초대자 테이블 삭제)
	public int eventEPDel(int ef_id);

	public int eventEIDel(int ef_id);

	public int eventClose(int ef_id);

	// 1. EF_CLOSE = 'Y'로
	// 2. 이벤트 삭제전 백업
	// 3. 이벤트 삭제
	public int eventUpStat(int ef_id);

	public int eventInSel(int ef_id);

	public int eventDelete(int ef_id);

	// public int eventEPDel(String ef_id);
	// 이벤트 수정
	public boolean eventModify(InformEvtDto dto);

	// 이벤트 참가자 조회
	public List<PartiSearchDto> eventLineUp(int ef_id);

	// 이벤트 마감
	public boolean eventEnd(int ef_id);

	// 참가자 조회
	public String eventNickFind(int ef_id);

	public List<InformEvtDto> eventLocationCompare(String mi_lc);

	// 이벤트 참가하기전에 정원으로 마지막참가자,참가가능,불가 확인
	public String checkJoin(int ef_id);

	// 이벤트 테이블에 자신의 닉네임이 있는지 확인해서 중복 막기
	public String checkJoined(ParticEvtDto dto);

	// 대기자 테이블에 자신의 닉네임이 있는지 확인해서 중복 막기
	public String wcheckJoined(ParticEvtDto dto);

	// 마지막 인원이 참가했을때 이벤트 상태 조기마감으로 변경
	public int statusUpdate(int ef_id);

	// 이벤트 참가시 참가횟수 +1 , 참가자테이블에 추가
	public int eventCount(String mi_nck);

	// 참가자테이블에 추가
	public int eventJoin(ParticEvtDto dto);

	// 이벤트 취소시 참가횟수 -1, 참가자테이블에서 제거
	public int eventOut(ParticEvtDto dto);
	public int eventMinus(String mi_nck);

	// 참가취소시 최대정원 비교함
	public String checkNum(ParticEvtDto dto);
	public int openStatus(ParticEvtDto dto);

	// 이벤트가 조기마감이었는지 확인
	public String checkEnd(int ef_id);

	// 대기자가 있는지 확인
	public String checkWating();

	// 대기자가 있다면 참가자로 바뀜
	public int watingEventJoin(ParticEvtDto dto);

	public int autoWatingOut();

	// -----대기참가 버튼 활성화
	// 대기자 테이블에서 삭제
	public int watingEventOut(String mi_nck);

	// 대기자 테이블에 추가
	public int addWating(ParticEvtDto dto);

	// 총회원,참가중,마감된이벤트,진행중인 이벤트
	public int userTotalCount();
	public int partiUserCount();
	public int endEvent();
	public int continueEvent();

	// 마감된 이벤트 카운트
	public int endEf();

	// 마감으로 변경
	public int endStatus();
}
