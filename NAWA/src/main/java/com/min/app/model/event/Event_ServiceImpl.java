package com.min.app.model.event;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.event.PartiSearchDto;
import com.min.app.dto.event.ParticEvtDto;
import com.min.app.dto.event.SearchEvtDto;
import com.min.app.dto.member.PrivacyMemDto;

@Service
public class Event_ServiceImpl implements Event_IService{
	
	private Logger logger = LoggerFactory.getLogger(Event_ServiceImpl.class);
	
	
	@Autowired
	private Event_IDao dao;
	
	/**
	 * <h2>이벤트 조회</h2>
	 * @author NAWA
	 * @return 이벤트 리스트
	 */
	@Override
	public List<InformEvtDto> eventSelect() {
		logger.info("eventSelect 진입");
		return dao.eventSelect();
	}
	
	/**
	 * <h2>이벤트 갯수</h2>
	 * @author NAWA
	 * @return 이벤트 갯수
	 */
	@Override
	public int CountList() {
		logger.info("CountList 진입");
		return dao.CountList();
	}

	/**
	 * <h2>페이징 DTO를 이용한 글 범위 리스트 조회</h2>
	 * @author NAWA
	 * @return 이벤트 리스트 + 페이징
	 */
	@Override
	public List<InformEvtDto> pageList(PagingBrdDto pdto) {
		logger.info("pageList 진입");
		System.out.println("서비스 : "+ pdto);
		return dao.pageList(pdto);
	}
	
	
	/**
	 * <h2>이벤트 개설, 이벤트 참가자 등록, 개설횟수 증가</h2>
	 * @author NAWA
	 * @param 화면에서 입력받은 값 (이벤트명, 상세내용, 참가조건, 인원, 개최일, 모집 마감일, 장소, 카테고리)
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 */
	@Override
	@Transactional
	public boolean eventCreate(InformEvtDto dto, String mi_nck) {
		logger.info("eventCreate 진입");
		System.out.println("서비스 : " + dto.getEf_id());
		int cnt = 0;
		cnt += dao.eventCreate(dto);
		cnt += dao.eventMakeIncre(mi_nck);
		cnt += dao.eventPati(mi_nck);
		cnt += dao.eventIdRefer(dto.getEf_id());
		return cnt==4?true:false;
	}
	
	/**
	 * <h2>이벤트 재개설</h2>
	 * @author NAWA
	 * @param 화면에서 입력받은 값 (이벤트명, 상세내용, 참가조건, 인원, 개최일, 모집 마감일, 장소, 카테고리), 대표이미지는 추가 예정
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	@Transactional
	public boolean eventReCreate(InformEvtDto dto, String mi_nck) {
		logger.info("eventReCreate 진입");
		int cnt = 0;
		cnt += dao.eventReCreate(dto);
		cnt += dao.eventMakeIncre(mi_nck);
		cnt += dao.eventPati(mi_nck);
		return cnt==3?true:false;
	}
	
	/**
	 * <h2>이벤트 상세보기</h2>
	 * @author NAWA
	 * @param ef_id
	 * @return 상세내용(이벤트명, 이벤트 상세내용, 참가조건, 인원수, 마감일, 장소, 카테고리, 이벤트 상태, 개최일, 폐쇄여부)
	 * 
	 */
	@Override
	public InformEvtDto eventDetail(int ef_id) {
		logger.info("eventDetail 진입");
		InformEvtDto dto = dao.eventDetail(ef_id);
		return dto;
	}
	
	/**
	 * <h2>마감된 이벤트 상세보기</h2>
	 * @author NAWA
	 * @param ef_id
	 * @return 상세내용(이벤트명, 이벤트 상세내용, 참가조건, 인원수, 마감일, 장소, 카테고리, 이벤트 상태, 개최일, 폐쇄여부)
	 * 
	 */
	@Override
	public InformEvtDto eventCloseDetail(int ef_id) {
		logger.info("eventCloseDetail 진입");
		InformEvtDto dto = dao.eventCloseDetail(ef_id);
		
		return dto;
	}

	
	/**
	 * <h2>이벤트 조회수증가</h2>
	 * @author NAWA
	 * @param ef_id
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	@Transactional
	public boolean eventReadCount(int ef_id) {
		logger.info("eventReadCount 진입");
		boolean isc = dao.eventReadCount(ef_id);
		return isc;
	}

	/**
	 * <h2>이벤트 폐쇄</h2>
	 * @author NAWA
	 * @param ef_id
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	@Transactional
	public boolean eventClose(int ef_id) {
		logger.info("eventClose 진입");
		int cnt = 0;
		cnt += dao.eventEPDel(ef_id);	// 참가자 테이블에 있는 참가자 삭제
		cnt += dao.eventEIDel(ef_id);	// 초대자 테이블에 있는 초대자 삭제
		cnt += dao.eventClose(ef_id);	// EF_CLOSE = 'Y'로 변경
		cnt += dao.eventUpStat(ef_id);  // EF_STATUS = 'C'로 변경 
		cnt += dao.eventInSel(ef_id);	// 백업 테이블에 삽입
		cnt += dao.eventDelete(ef_id);	// 이벤트 삭제
		return (cnt==6)?true:false;	
		// return cnt==3?true:false;	
	}

	
	/**
	 * <h2>이벤트 삭제</h2>
	 * @author NAWA
	 * @param 이벤트 아이디
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	@Transactional
	public boolean eventDelete(int ef_id) {
		logger.info("eventDelete 진입");
		logger.info("ServiceImpl 들어왔음 " + ef_id);
		int n = 0;
		n += dao.eventEPDel(ef_id);      // 참가자 테이블에 있는 참가자 삭제 
		n += dao.eventEIDel(ef_id);      // 초대자 테이블에 있는 초대자 삭제 
		n += dao.eventUpStat(ef_id);     // EF_STATUS = 'C'로 변경 
		n += dao.eventInSel(ef_id);      // 백업 테이블에 삽입         
		n += dao.eventDelete(ef_id);     // 이벤트 삭제             
		return (n==5)?true:false;
	}

	
	/**
	 * <h2>이벤트 수정</h2>
	 * @author NAWA
	 * @param 화면에서 입력받은 값 (이벤트명, 상세내용, 참가조건, 인원, 개최일, 모집 마감일, 장소, 카테고리), 대표이미지는 추가 예정
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	@Transactional
	public boolean eventModify(InformEvtDto dto) {
		logger.info("eventModify 진입");
		boolean isc = dao.eventModify(dto);
		return isc?true:false;
	}

	
	/**
	 * <h2>이벤트 검색</h2>
	 * @author NAWA
	 * @param Event_SearchDto
	 * @return 이벤트 리스트
	 * 
	 */
	@Override
	public List<InformEvtDto> eventSearch(SearchEvtDto sdto) {
		logger.info("eventSearch 진입\t{}",sdto);
		return dao.eventSearch(sdto);
	}
	
	/**
	 * <h2>이벤트 검색 결과 갯수</h2>
	 * @author NAWA
	 * @param Event_SearchDto
	 * @return 이벤트 검색 결과 갯수
	 */
	@Override
	public int eventCountSearch(SearchEvtDto sdto) {
		logger.info("eventCountSearch 진입");
		return dao.eventCountSearch(sdto);
	}

	/**
	 * <h2>이벤트 참가자 조회</h2>
	 * @author NAWA
	 * @param 이벤트 아이디
	 * @return 이벤트 참가자 리스트
	 * 
	 */
	@Override
	public List<PartiSearchDto> eventLineUp(int ef_id) {
		return dao.eventLineUp(ef_id);
	}


	/**
	 * <h2>이벤트 마감</h2>
	 * @author NAWA
	 * @param 이벤트 아이디
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	@Transactional
	public boolean eventEnd(int ef_id) {
		return dao.eventEnd(ef_id);
	}
	
	
	/**
	 * <h2>개설자 닉네임 조회</h2>
	 * @author NAWA
	 * @param 이벤트 아이디
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@Override
	public String eventNickFind(int ef_id) {
		return dao.eventNickFind(ef_id);
	}
	
	
	/**
	 * <h2>세션 내 지역과 일치하는 이벤트 리스트 조회</h2>
	 * @author NAWA
	 * @param 세션 내 지역
	 * @return 이벤트 리스트
	 * 
	 */
	@Override
	public List<InformEvtDto> eventLocationCompare(String mi_lc) {
		return dao.eventLocationCompare(mi_lc);
	}



	@Override
	@Transactional
	public int eventCount(ParticEvtDto dto) {
		logger.info("eventCount 진입");
		int n = 0;
	
		if(dao.eventCount(dto.getMi_nck())==1) {
			n++;
		}
		if(n==1) {
			dao.eventJoin(dto);
			n++;
		}

		return n;
	}

	@Override
	@Transactional
	public int evetOut(ParticEvtDto dto) {
		logger.info("evetOut 진입");
		int n = 0;
		if(dao.eventOut(dto)==1) {
			n++;
		}
		if(n==1) {
			dao.eventMinus(dto.getMi_nck());
			n++;
		}

		return n;
	}


	@Override
	public String checkJoin(int ef_id) {
		logger.info("checkJoin 진입");
		String result = dao.checkJoin(ef_id);
		return result;
	}

	@Override
	public int statusUpdate(int ef_id) {
		logger.info("statusUpdate 진입");
		int n = dao.statusUpdate(ef_id);
		return n;
	}



	//이벤트 취소 눌렀을때 대기자 참여시키기
	@Override
	public int wating(ParticEvtDto dto) {
		logger.info("wating 진입");
		int n=0;
		String wait="";
		wait=dao.checkWating();
		if(wait==null) {
			evetOut(dto);
			if(dao.checkNum(dto).equalsIgnoreCase("E")) {
				n+=dao.openStatus(dto);
			}
		}
		if(wait!=null) {
			System.out.println(wait);
			evetOut(dto);
			n+=dao.eventCount(dto.getMi_nck());
			n+=dao.watingEventJoin(dto);
			n+=dao.autoWatingOut();
		}
		return n;
	}

	@Override
	public String checkEnd(int ef_id) {
		logger.info("checkEnd 진입");
		String result = dao.checkEnd(ef_id);
		System.out.println(result);
		return result;
	}

	@Override
	public int addWating(ParticEvtDto dto) {
		logger.info("addWating 진입");
		int n = dao.addWating(dto);
		return n;
	}

	@Override
	public int watingEventOut(String mi_nck) {
		logger.info("watingEventOut 진입");
		int n = dao.watingEventOut(mi_nck);
		return n;
	}

	@Override
	public String checkJoined(ParticEvtDto dto) {
		logger.info("checkJoined 진입");
		
		return dao.checkJoined(dto); 
	}
	@Override
	public String wcheckJoined(ParticEvtDto dto) {
		logger.info("wcheckJoined 진입");
		
		return dao.wcheckJoined(dto);
	}

	@Override
	public int userTotalCount() {
		logger.info("userTotalCount 진입");
		return dao.userTotalCount();
	}

	@Override
	public int partiUserCount() {
		return dao.partiUserCount();
	}

	@Override
	public int endEvent() {
		return dao.endEvent();
	}

	@Override
	public int continueEvent() {
		return dao.continueEvent();
	}

	@Override
	public PrivacyMemDto eventPhoneEmail(int ef_id) {
		return dao.eventPhoneEmail(ef_id);
		}
	
	@Override
	   public int endEf() {
		logger.info("endEf 진입");
	      int count= dao.endEf();
	      if(count>0) {
	        int n = dao.endStatus();
	        return n;
	      }
	      return count;
	   }
}