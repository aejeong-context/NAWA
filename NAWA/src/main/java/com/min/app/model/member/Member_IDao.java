package com.min.app.model.member;

import java.util.List;
import java.util.Map;

import com.min.app.dto.board.PagingMemDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.member.InformMemDto;
import com.min.app.dto.member.ListMemDto;
import com.min.app.dto.member.LoginMemDto;
import com.min.app.dto.member.PrivacyMemDto;
import com.min.app.dto.member.RegistMemDto;
import com.min.app.dto.member.UpdateMemDto;

public interface Member_IDao {
	// 1단계 회원가입
	public boolean insertMR(RegistMemDto dto);
	
	// 아이디중복
	public boolean duplicateId(String id);
	
	// 이메일중복
	public boolean duplicateEmail(String email);
	
	// 2단계 회원가입
	public boolean insertMI(InformMemDto dto);
	
	// 닉네임 중복
	public boolean duplicateNick(String nick);
	
	// API 회원가입
	
	// 일반 로그인
	public LoginMemDto login(Map<String, String> map);
	
	// 로그인 시간 최신날짜로 변경
	public boolean loginUpdate(String id);
	
	// 일반 로그아웃
	
	// API 로그인
	
	// API 로그아웃
	
	// 회원 정보 가져오기
	public PrivacyMemDto userInfo(String id);
	
	// 회원 상태 변경
	public boolean updateState(Map<String, String> map);
	
	// 회원 정보 변경
	public boolean updateInfoMR(UpdateMemDto dto);
	public boolean updateInfoMI(UpdateMemDto dto);

	// 이메일 인증
	
	// 관리자 회원 정지
	public boolean userBan(String id);
	// 관리자 회원 정지 해제
	public boolean userRelease(String id);
	
	// 관리자 회원 조회
	public List<ListMemDto> allUserList();
	// 관리자 회원 상세 조회
	public ListMemDto detailUserList(String id);
	
	// 회원 탈퇴 비밀번호 확인
	public boolean pwCheck(Map<String, String> map);
	// 회원 탈퇴
	public boolean signUpDrop(String id);
	
	// 마감된 이벤트 보기/갯수
	public List<InformEvtDto> closeEvent(String nick);
	public Integer closeEventCount(String nick);
	
	// 진행중인 이벤트 보기/갯수
	public List<InformEvtDto> openEvent(String nick);
	public Integer openEventCount(String nick);
	
	// 초대받은 이벤트 보기/갯수
	public List<InformEvtDto> inviteEvent(String nick);
	public Integer inviteEventCount(String nick);
	
	// 비밀번호 재설정 정보확인/적용
	public String pwReset(Map<String, String> map);
	public boolean pwChange(Map<String, String> map);
	
	// 비밀번호 재설정 키값등록/조회/초기화
	public boolean codeUpdate(Map<String, String> map);
	public String codeSelect(String id);
	public boolean codeReset(String mr_id);
	
	// 회원리스트 페이징
	public List<ListMemDto> selectCountUser(PagingMemDto paging);
	public int userTotalCount();
	
	//이벤트 현재 참가인원
	public int attendCount(String ef_id);
}
