package com.min.app.model.event;

import java.util.List;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.event.PartiSearchDto;
import com.min.app.dto.event.ParticEvtDto;
import com.min.app.dto.event.SearchEvtDto;
import com.min.app.dto.member.PrivacyMemDto;

public interface Event_IService {

	// 이벤트 조회
	public List<InformEvtDto> eventSelect();

	// 페이징
	// 글갯수
	public int CountList();

	// 페이지 리스트 조회
	public List<InformEvtDto> pageList(PagingBrdDto pdto);

	// 조회 + 페이징 + 검색
	public List<InformEvtDto> eventSearch(SearchEvtDto SDto);

	// 검색 결과 갯수
	public int eventCountSearch(SearchEvtDto Sdto);

	// 이벤트 개설
	public boolean eventCreate(InformEvtDto dto, String mi_nck);

	// 이벤트 재개설
	public boolean eventReCreate(InformEvtDto dto, String mi_nck);

	// 이벤트 상세보기
	public InformEvtDto eventDetail(int ef_id);
	
	// 이벤트 개설자의 전화번호, 이메일 조회
	public PrivacyMemDto eventPhoneEmail(int ef_id);

	// 마감된 이벤트의 상세보기
	public InformEvtDto eventCloseDetail(int ef_id);

	// 이벤트 조회수증가
	public boolean eventReadCount(int ef_id);

	// 이벤트 폐쇄
	// 1. 참가자 리스트 삭제
	// 2. 초대자 리스트 삭제
	// 3. EF_CLOSE = 'Y'
	// 4. 이벤트 삭제전에 백업
	// 5. 삭제
	public boolean eventClose(int ef_id);


	// 1. 이벤트 삭제 전에 참가자 테이블에 있는 참가자 삭제
	// 2. 이벤트 삭제전에 EF_CLOSE = 'Y'로 
	// 3. 이벤트 삭제전 백업               
	// 4. 이벤트 삭제                   
	public boolean eventDelete(int ef_id);

	// 이벤트 수정
	public boolean eventModify(InformEvtDto dto);

	// 이벤트 참가자 조회
	public List<PartiSearchDto> eventLineUp(int ef_id);

	// 이벤트 마감
	public boolean eventEnd(int ef_id);	

	// 개설자 닉네임 조회
	public String eventNickFind(int ef_id);

	// 세션에 있는 내 지역과 맞는 지역의 이벤트 리스트 가져오는 쿼리
	public List<InformEvtDto> eventLocationCompare(String mi_lc);

	//========================이벤트 참가 ==================================


	//이미 이벤트에 참가중인지 확인
	public String checkJoined(ParticEvtDto dto);
	//이미 이벤트에 참가중인지 확인
	public String wcheckJoined(ParticEvtDto dto);
	//이벤트 참가시 참가횟수 +1 , 참가자테이블에 추가
	public int eventCount(ParticEvtDto dto);
	public int evetOut(ParticEvtDto dto);
	//참가자테이블에 추가
	public String checkJoin(int ef_id);

	//마지막참가자가 참가했을때 이벤트 상태가 E(조기마감)으로 변한다
	public int statusUpdate(int ef_id);
	//이벤트 상태 확인
	public String checkEnd(int ef_id);
	//대기 취소일 경우 자동으로 대기참가자가 참가할때
	public int wating(ParticEvtDto dto);
	//자동으로 대기테입블에서 삭제
	//public int autowatingout();
	//대기자 참가 하기
	public int addWating(ParticEvtDto dto);
	//대기자 취소하기 
	public int watingEventOut(String mi_nck);
	
	public int userTotalCount();
	public int partiUserCount();
	public int endEvent();
	public int continueEvent();
	
	public int endEf();
}
