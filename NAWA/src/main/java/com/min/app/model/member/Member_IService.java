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

public interface Member_IService {
	
	//1단계 회원가입
	public boolean insertMR(RegistMemDto dto);
	
	//아이디 중복검사
	public boolean duplicateId(String id);
	
	//이메일 중복검사
	public boolean duplicateEmail(String email);
	
	//2단계 회원가입
	public boolean insertMI(InformMemDto dto);
	
	//닉네임 중복 검사
	public boolean duplicateNick(String nick);
	
	//로그인
	public LoginMemDto login(Map<String, String> map);
	
	//유저 정보 가져오기
	public PrivacyMemDto userInfo(String id);
	
	//유저상태변경
	public boolean updateState(Map<String, String> map);
	
	//유저 정보 변경
	public boolean updateInfo(UpdateMemDto dto); 
	
	//전체회원정보보기 아이디, 이름, 이메일, 닉네임, 이용상태, 최근방문일자, 회원등급, 연락처, 지역, 흥미, 상태, 이벤트개설횟수, 참여횟수
	public List<ListMemDto> allUserList();
	public ListMemDto detailUserList(String id);
	
	//회원아이디 정지/해제
	public boolean userBan(String id);
	public boolean userRelease(String id);
	
	//비밀번호확인 비밀번호
	public boolean pwCheck(Map<String, String> map);
	
	//회원탈퇴 아이디
	public boolean signUpDrop(String id);
	
	//종료된이벤트리스트
	public List<InformEvtDto> closeEvent(String nick);
	
	//진행중인이벤트리스트
	public List<InformEvtDto> openEvent(String nick);
	
	//초대된이벤트리스트
	public List<InformEvtDto> inviteEvent(String nick);
	
	//이벤트 대시보드 각 갯수
	public Integer closeEventCount(String nick);
	public Integer openEventCount(String nick);
	public Integer inviteEventCount(String nick);
	
	//이메일인증
	public boolean send(String subject, String text, String from, String to, String filePath);

	//비밀번호 설정
	public String pwReset(Map<String, String> map);
	public boolean pwChange(Map<String, String> map);
	
	//비밀번호 재설정 키값설정/조회/초기화
	public boolean codeUpdate(Map<String, String> map);
	public String codeSelect(String mr_id);
	public boolean codeReset(String mr_id);
	
	//페이징
	public List<ListMemDto> selectCountUser(PagingMemDto paging);
	public int userTotalCount();
	
	//참가중인인원
	public int attendCount(String ef_id);
}

