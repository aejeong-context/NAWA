package com.min.app.model.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.min.app.dto.board.PagingMemDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.member.InformMemDto;
import com.min.app.dto.member.ListMemDto;
import com.min.app.dto.member.LoginMemDto;
import com.min.app.dto.member.PrivacyMemDto;
import com.min.app.dto.member.RegistMemDto;
import com.min.app.dto.member.UpdateMemDto;

@Repository
public class Member_Dao_Impl implements Member_IDao {
	
	private final String NS = "com.min.app.model.member.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public boolean insertMR(RegistMemDto dto) {
		String enPassword = passwordEncoder.encode(dto.getMr_pw());
		dto.setMr_pw(enPassword);
		int n = session.insert(NS+"signUp1MR", dto);
		return (n>0)?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public boolean duplicateId(String id) {
		return session.selectOne(NS+"duplicateId", id)==null?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public boolean duplicateEmail(String email) {
		return session.selectOne(NS+"duplicateEmail", email)==null?true:false;
	}

	@Override
	@Transactional
	public boolean insertMI(InformMemDto dto) {
		int n = session.insert(NS+"signUp2MI", dto);
		return (n>0)?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public boolean duplicateNick(String nick) {
		return session.selectOne(NS+"duplicateNick", nick)==null?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public LoginMemDto login(Map<String, String> map) {
		LoginMemDto mdto = null;
		// 암호화 되어 저장된 비밀번호(입력받은거)
		String pw1 = session.selectOne(NS+"ecPasswordLogin", map);
		
		//화면에서 입력받은 PW
		String inputPw = map.get("mr_pw");
		String enPassword = passwordEncoder.encode(map.get("mr_pw"));
		
		// 화면에서 입력받은 PW -> 암호화 -> enPassword
		System.out.println(enPassword);
		if(passwordEncoder.matches(inputPw, pw1)) {
			System.out.println("비밀번호 일치");
			mdto = session.selectOne(NS+"enLogin", map);
		}
		return mdto;
	}

	@Override
	@Transactional
	public boolean loginUpdate(String id) {
		int n = session.update(NS+"loginUpdate", id);
		return (n>0)?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public PrivacyMemDto userInfo(String id) {
		return session.selectOne(NS+"userInfo", id);
	}

	@Override
	@Transactional
	public boolean updateState(Map<String, String> map) {
		int n = session.update(NS+"updateState", map);
		return (n>0)?true:false;
	}

	@Override
	@Transactional
	public boolean updateInfoMR(UpdateMemDto dto) {
		int n = session.update(NS+"updateInfoMR", dto);
		return (n>0)?true:false;
	}

	@Override
	@Transactional
	public boolean updateInfoMI(UpdateMemDto dto) {
		int n = session.update(NS+"updateInfoMI", dto);
		return (n>0)?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public List<ListMemDto> allUserList() {
		List<ListMemDto> lists = null;
		lists = session.selectList(NS+"allUserList");
		return lists;
	}
	
	@Override
	@Transactional(readOnly = true)
	public ListMemDto detailUserList(String id) {
		return session.selectOne(NS+"detailUserList",id);
	}

	@Override
	@Transactional
	public boolean userBan(String id) {
		int n = session.update(NS+"userBan", id);
		return (n>0)?true:false;
	}
	
	@Override
	@Transactional
	public boolean userRelease(String id) {
		int n = session.update(NS+"userRelease", id);
		return (n>0)?true:false;
	}
	
	@Override
	@Transactional(readOnly = true)
	public boolean pwCheck(Map<String, String> map) {
		String pw1 = session.selectOne(NS+"ecPasswordLogin", map);
		String inputPw = map.get("mr_pw");
		String enPassword = passwordEncoder.encode(map.get("mr_pw"));
		System.out.println(map.get("mr_pw")+":"+enPassword);
		if(passwordEncoder.matches(inputPw, pw1)) {
			System.out.println("비밀번호 일치");
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	@Transactional
	public boolean signUpDrop(String id) {
		int n = session.update(NS+"signUpDrop", id);
		return (n>0)?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public List<InformEvtDto> closeEvent(String nick) {
		List<InformEvtDto> lists = null;
		lists = session.selectList(NS+"closeEvent", nick);
		return lists;
	}

	@Override
	@Transactional(readOnly = true)
	public List<InformEvtDto> openEvent(String nick) {
		List<InformEvtDto> lists = null;
		lists = session.selectList(NS+"openEvent", nick);
		return lists;
	}

	@Override
	@Transactional(readOnly = true)
	public List<InformEvtDto> inviteEvent(String nick) {
		List<InformEvtDto> lists = null;
		lists = session.selectList(NS+"inviteEvent", nick);
		return lists;
	}

	@Override
	@Transactional(readOnly = true)
	public Integer closeEventCount(String nick) {
		int n = session.selectOne(NS+"closeEventCount", nick);
		return n;
	}

	@Override
	@Transactional(readOnly = true)
	public Integer openEventCount(String nick) {
		int n = session.selectOne(NS+"openEventCount", nick);
		return n;
	}

	@Override
	@Transactional(readOnly = true)
	public Integer inviteEventCount(String nick) {
		int n = session.selectOne(NS+"inviteEventCount", nick);
		return n;
	}

	@Override
	@Transactional(readOnly = true)
	public String pwReset(Map<String, String> map) {
		String id = session.selectOne(NS+"pwReset", map);
		return id;
	}

	@Override
	@Transactional
	public boolean pwChange(Map<String, String> map) {
		String enPassword = passwordEncoder.encode(map.get("mr_pw"));
		map.put("mr_pw", enPassword);
		int n = session.update(NS+"pwChange", map);
		return (n>0)?true:false;
	}

	@Override
	public List<ListMemDto> selectCountUser(PagingMemDto paging) {
		return session.selectList(NS+"selectCountUser", paging);
	}

	@Override
	public int userTotalCount() {
		return session.selectOne(NS+"userTotalCount");
	}

	@Override
	@Transactional
	public boolean codeUpdate(Map<String, String> map) {
		int n = session.update(NS+"codeUpdate", map);
		return (n>0)?true:false;
	}
	
	@Override
	@Transactional(readOnly = true)
	public String codeSelect(String mr_id) {
		String code = session.selectOne(NS+"codeSelect", mr_id);
		return code;
	}

	@Override
	@Transactional
	public boolean codeReset(String mr_id) {
		int n = session.update(NS+"codeReset", mr_id);
		return (n>0)?true:false;
	}

	@Override
	@Transactional(readOnly = true)
	public int attendCount(String ef_id) {
		int n = session.selectOne(NS+"attendCount", ef_id);
		return n;
	}


}
