package com.min.app.model.member;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.min.app.dto.board.PagingMemDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.member.InformMemDto;
import com.min.app.dto.member.ListMemDto;
import com.min.app.dto.member.LoginMemDto;
import com.min.app.dto.member.PrivacyMemDto;
import com.min.app.dto.member.RegistMemDto;
import com.min.app.dto.member.UpdateMemDto;

@Service
public class Member_ServiceImpl implements Member_IService {
	
	private Logger logger = LoggerFactory.getLogger(Member_ServiceImpl.class);
	
	@Autowired
	private Member_IDao dao;
	
	@Autowired
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	
	@Override
	public boolean insertMR(RegistMemDto dto) {
		logger.info("insertMR" + dto);
		return dao.insertMR(dto);
	}

	@Override
	public boolean duplicateId(String id) {
		logger.info("duplicateId \t{}", id);
		return dao.duplicateId(id);
	}

	@Override
	public boolean duplicateEmail(String email) {
		logger.info("duplicateEmail \t{}", email);
		return dao.duplicateEmail(email);
	}

	@Override
	public boolean insertMI(InformMemDto dto) {
		logger.info("insertMI \t{}", dto);
		return dao.insertMI(dto);
	}

	@Override
	public boolean duplicateNick(String nick) {
		logger.info("duplicateNick \t{}", nick);
		return dao.duplicateNick(nick);
	}

	@Override
	public LoginMemDto login(Map<String, String> map) {
		logger.info("login \t{}", map);
		String id = map.get("mr_id");
		boolean isc = dao.loginUpdate(id);
		return isc?dao.login(map):null;
	}

	@Override
	public PrivacyMemDto userInfo(String id) {
		logger.info("userInfo id \t{}", id);
		return dao.userInfo(id);
	}

	@Override
	public boolean updateState(Map<String, String> map) {
		logger.info("updateState \t{}", map);
		return dao.updateState(map);
	}

	@Override
	public boolean updateInfo(UpdateMemDto dto) {
		logger.info("updateInfo \t{}", dto);
		boolean updateMR = dao.updateInfoMR(dto);
		boolean updateMI = dao.updateInfoMI(dto);
		return (updateMR&&updateMI)?true:false;
	}

	@Override
	public List<ListMemDto> allUserList() {
		logger.info("allUserList \t{}", new Date());
		return dao.allUserList();
	}
	
	@Override
	public ListMemDto detailUserList(String id) {
		logger.info("detailUserList \t{}", id);
		return dao.detailUserList(id);
	}

	@Override
	public boolean userBan(String id) {
		logger.info("userBan \t{}", id);
		return dao.userBan(id);
	}
	
	@Override
	public boolean userRelease(String id) {
		logger.info("userRelease \t{}", id);
		return dao.userRelease(id);
	}

	@Override
	public boolean signUpDrop(String id) {
		logger.info("signUpDrop \t{}", id);
		return dao.signUpDrop(id);
	}

	@Override
	public List<InformEvtDto> closeEvent(String nick) {
		logger.info("closeEvent \t{}", nick);
		return dao.closeEvent(nick);
	}

	@Override
	public List<InformEvtDto> openEvent(String nick) {
		logger.info("openEvent \t{}", nick);
		return dao.openEvent(nick);
	}

	@Override
	public List<InformEvtDto> inviteEvent(String nick) {
		logger.info("inviteEvent \t{}", nick);
		return dao.inviteEvent(nick);
	}

	@Override
	public Integer closeEventCount(String nick) {
		logger.info("closeEventCount \t{}", nick);
		return dao.closeEventCount(nick);
	}

	@Override
	public Integer openEventCount(String nick) {
		logger.info("openEventCount \t{}", nick);
		return dao.openEventCount(nick);
	}

	@Override
	public Integer inviteEventCount(String nick) {
		logger.info("inviteEventCount \t{}", nick);
		return dao.inviteEventCount(nick);
	}

	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setSubject(subject);
		helper.setText(text, true);
		helper.setFrom(from);
		helper.setTo(to);
		// 첨부 파일 처리
		if (filePath != null) {
		File file = new File(filePath);
		if (file.exists()) {
		helper.addAttachment(file.getName(), new File(filePath));
		}
		}
		// 첨부 파일 처리 다른방법(이건 확인함)
		// FileSystemResource file = new FileSystemResource(new File("D:/load.gif"));
		// helper.addAttachment("load.gif", file);
		// 메일에 이미지 심어서 보낸는 방법(한글파일은 안됨)
		// String contents = text + "<br><br><img src=\"cid:emailPic.png \">";
		// helper.setText(contents, true);
		// FileSystemResource file = new FileSystemResource(new File("D:/emailPic.png"));
		// helper.addInline("emailPic.png", file);
		javaMailSender.send(message);
		return true;
		} catch (MessagingException e) {
		e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean pwCheck(Map<String, String> map) {
		logger.info("pwCheck \t{}", map);
		return dao.pwCheck(map);
	}

	@Override
	public String pwReset(Map<String, String> map) {
		logger.info("pwReset \t{}", map);
		return dao.pwReset(map);
	}
	
	@Override
	public boolean pwChange(Map<String, String> map) {
		logger.info("pwChange \t{}", map);
		return dao.pwChange(map);
	}
	
	@Override
	public List<ListMemDto> selectCountUser(PagingMemDto paging) {
		return dao.selectCountUser(paging);
	}

	@Override
	public int userTotalCount() {
		return dao.userTotalCount();
	}

	@Override
	public boolean codeUpdate(Map<String, String> map) {
		logger.info("codeUpdate \t{}", map);
		return dao.codeUpdate(map);
	}
	
	@Override
	public String codeSelect(String mr_id) {
		logger.info("codeUpdate \t{}", mr_id);
		return dao.codeSelect(mr_id);
	}

	@Override
	public boolean codeReset(String mr_id) {
		logger.info("codeReset \t{}", mr_id);
		return dao.codeReset(mr_id);
	}

	@Override
	public int attendCount(String ef_id) {
		logger.info("attendCount \t{}", ef_id);
		return dao.attendCount(ef_id);
	}
}
