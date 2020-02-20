package com.min.app.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.min.app.dto.board.EventBrdDto;
import com.min.app.dto.board.WriteBrdDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.file.InformFileDto;
import com.min.app.dto.member.LoginMemDto;
import com.min.app.dto.member.RegistMemDto;
import com.min.app.model.board.NoticeBoard_IService;
import com.min.app.model.event.Event_IService;
import com.min.app.model.eventboard.EventBoard_IService;
import com.min.app.model.file.InformFile_IService;
import com.min.app.model.member.Member_IService;
import com.min.app.model.util.Util_IService;

@Controller
public class ASyncController {

	private static final Logger logger = LoggerFactory.getLogger(ASyncController.class);

	@Autowired
	private Member_IService m_service;

	@Autowired
	private InformFile_IService f_service;

	@Autowired
	private Util_IService u_service;
	
	@Autowired
	private Event_IService e_service;
	
	@Autowired
	private NoticeBoard_IService n_service;
	
	@Autowired
	private EventBoard_IService eb_service;

	// ------------------------------------------ MEMBER
	// ------------------------------------------------//

	/**
	 * 아이디 중복 확인
	 * 
	 * @author 이창훈
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/check/id", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkId(String id) {
		logger.info("Welcome /check/id : \t{}", id);
		Map<String, String> map = new HashMap<String, String>();
		boolean isc = m_service.duplicateId(id);
		logger.info("Welcome /check/id 결과: \t{} ", isc);
		map.put("isc", isc + "");
		return map;
	}

	/**
	 * 이메일 중복 검사
	 * 
	 * @author 이창훈
	 * @param email
	 * @return
	 */
	@RequestMapping(value = "/check/mail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkMail(String email) {
		logger.info("Welcome /check/mail : \t{}", email);
		Map<String, String> map = new HashMap<String, String>();
		boolean isc = m_service.duplicateEmail(email);
		logger.info("Welcome /check/mail 결과: \t{} ", isc);
		map.put("isc", isc + "");
		return map;
	}

	/**
	 * 닉네임 중복 검사
	 * 
	 * @author 이창훈
	 * @param nick
	 * @return
	 */
	@RequestMapping(value = "/check/nickname", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkNickName(String nick) {
		logger.info("Welcome /check/nickname : \t{}", nick);
		Map<String, String> map = new HashMap<String, String>();
		boolean isc = m_service.duplicateNick(nick);
		logger.info("Welcome /check/nickname 결과: \t{} ", isc);
		map.put("isc", isc + "");
		return map;
	}

	/**
	 * 로그인 확인
	 * 
	 * @author 이창훈
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/login/Check", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> loginCheck(RegistMemDto dto) {
		Map<String, String> map = new HashMap<String, String>();
		logger.info("Welcome loginCheckMap/do : \t{}", dto);
		map.put("mr_id", dto.getMr_id());
		map.put("mr_pw", dto.getMr_pw());
		LoginMemDto mDto = m_service.login(map);
		Map<String, String> map2 = new HashMap<String, String>();
		if (mDto.getMr_dfl().equalsIgnoreCase("B")) {
			map2.put("isc", "정지");
		} else if (mDto.getMr_dfl().equalsIgnoreCase("Y")) {
			map2.put("isc", "탈퇴");
		} else if (mDto.getMr_dfl().equalsIgnoreCase("N")) {
			map2.put("isc", "사용");
		}
		System.out.println(map2);
		return map2;
	}

	/**
	 * 이메일 인증 발송
	 * 
	 * @author 이창훈
	 * @param userEmail
	 * @param random
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random, HttpSession session) {

		// 이메일 인증번호 랜덤으로 셋팅(6자리)
		int ran = new Random().nextInt(900000) + 100000;
		String authCode = String.valueOf(ran);

		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);

		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		String sendEmailId = "nawacp.2020@gmail.com";
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
		System.out.println(subject);
		System.out.println(sb.toString());
		System.out.println(sendEmailId);
		System.out.println(userEmail);
		return m_service.send(subject, sb.toString(), sendEmailId, userEmail, null);
	}

	/**
	 * 이메일 인증 확인
	 * 
	 * @author 이창훈
	 * @param authCode
	 * @param random
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random,
			HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));

		System.out.println("auth :" + authCode);
		System.out.println("random ==========:" + originalRandom);

		if (originalJoinCode.equals(authCode) && originalRandom.equals(random)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}

	/**
	 * 비밀번호 재설정 계정확인
	 * 
	 * @author 이창훈
	 * @param mr_id
	 * @param mr_email
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/pwReset/Check", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> pwcheck(String mr_id, String mr_email, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		logger.info("Welcome pwResetCheck : \t{}", mr_id);
		logger.info("Welcome pwResetCheck : \t{}", mr_email);
		map.put("mr_id", mr_id);
		map.put("mr_email", mr_email);
		String cid = m_service.pwReset(map);
		System.out.println(map);
		Map<String, String> map2 = new HashMap<String, String>();
		if (cid.equalsIgnoreCase(mr_id)) {
			session.setAttribute("cid", cid);
			map2.put("isc", "통과");
		} else {
			map2.put("isc", "실패");
		}
		return map2;
	}

	// ------------------------------------------ NOTICE BOARD ------------------------------------------------//
	
	// ------------------------------------------ NOTICE BOARD ------------------------------------------------//
	
	/**
	 * 공지사항 작성
	 * @author 신애정,김수정
	 * @param request
	 * @param dto
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/notice/write" , method = RequestMethod.POST)
	@ResponseBody 
	public int noticeWrite(MultipartHttpServletRequest request,WriteBrdDto dto) throws IllegalStateException, IOException {
		logger.info("공지사항 작성 ");
		logger.info("nb_title: "+dto.getNb_title());
		logger.info("nb_con: "+dto.getNb_con());
					
		int n = n_service.insertBoard(dto);
		int nb_seq = dto.getNb_seq();
		logger.info("nb_seq: "+nb_seq);
					
		boolean isc = n>0?true:false;
			 		
		//업로드한 파일 리스트
		List<MultipartFile> mfList = request.getFiles("file");            
		logger.info("업로드 파일 개수:"+mfList.size()); 
					
		List<InformFileDto> fileList = new ArrayList<InformFileDto>();        
					
		if (isc&&mfList.size()!=0) {
					
		for(MultipartFile mf:mfList){            
					
		logger.info("파일명:"+mf.getOriginalFilename());
		logger.info("파일사이즈:"+mf.getSize());
					
					
		String fileName = mf.getOriginalFilename(); //파일명 얻기
		long fileSize =mf.getSize();
		String ext =fileName.substring(fileName.lastIndexOf("."));
		logger.info("확장자 명 : "+ext);
					
		//업로드 파일명을 변경후 저장            
		String uploadFileName =UUID.randomUUID()+ext;
		logger.info("uuid 파일명: "+uploadFileName);
					
		// 물리 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
					
		logger.info("파일 업로드 경로 : "+uploadPath);
					      
		File storage = new File(uploadPath);
		if (!storage.exists()) { //디렉토리가 있는지 확인
			storage.mkdir(); //디렉토리 생성 
		}
					
		if(mf.getSize() != 0) {            
		mf.transferTo(new File(uploadPath+"/"+uploadFileName));  // 파일 업로드 
		logger.info("경로 + 파일 이름 :"+uploadPath+"/"+uploadFileName);
		}   
		InformFileDto file = new InformFileDto(fileName, uploadFileName, fileSize, uploadPath);         
		
		fileList.add(file);
		f_service.insertNoticeFile(file, nb_seq);
		logger.info("파일 :"+file);
		logger.info("nb_seq :"+nb_seq);
		}
					
	}// if 
		return isc?nb_seq:0;
		}
	
	
	/**
	 * 공지사항 수정시 이미지 리스트
	 * 
	 * @author 김수정
	 * @param nb_seq
	 * @return
	 */
	@RequestMapping(value = "/notice/fileList")
	@ResponseBody
	public HashMap<String, Object> noticefileList(int nb_seq) {
		logger.info("nb_seq: " + nb_seq);
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<InformFileDto> dto = f_service.selectNoticeFile(nb_seq);
		map.put("file", dto);

		return map;
	}

	/**
	 * 파일 삭제
	 * 
	 * @author 김수정
	 * @param fi_seq
	 * @return
	 */
	@RequestMapping(value = "/file/delete", method = RequestMethod.POST)
	@ResponseBody
	public String fileDel(int fi_seq) {
		logger.info("파일 seq : " + fi_seq);
		boolean isc = f_service.deleteFile(fi_seq);

		return isc ? "success" : "error";
	}
	
	/**
	 * 공지사항 수정(파일 업로드,에디터)
	 * 
	 * @author 신애정,김수정
	 * @param dto
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/notice/modify", method = RequestMethod.POST)
	@ResponseBody
	public int noticemodify(WriteBrdDto dto, MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("/notice/modify \t{}",dto);
		
		int n = n_service.updateBoard(dto);
		List<MultipartFile> mflist = request.getFiles("file");
		int nb_seq = dto.getNb_seq();
		logger.info("업로드 파일 개수:"+mflist.size()); 

		if (n > 0) {	//공지사항 수정 성공 시 파일 업로드 진행
			System.out.println(mflist);
			
			if (mflist.size()!=0) { // mflist.size() 는 파일업로드 개수 
				String path = request.getSession().getServletContext().getRealPath("/upload");
				

				for (MultipartFile mf : mflist) {
					String originname = mf.getOriginalFilename();
					int filesize = (int) mf.getSize();
					String ext = originname.substring(originname.lastIndexOf("."));
					String storedname = UUID.randomUUID() + ext;

					File storage = new File(path);
					if (!storage.exists()) {
						storage.mkdir();
					}

					if (filesize != 0) {
						mf.transferTo(new File(path + "/" + storedname)); // 파일 업로드
					}
					InformFileDto idto = new InformFileDto(originname, storedname, filesize, path);
					f_service.insertNoticeFile(idto, nb_seq);
				} // for
			}
		} else {
			System.out.println("공지사항 수정에 실패하였습니다.");
		}
		return n>0?nb_seq:0; //nb_seq를 가지고 상세보기화면을 넘어감 return 값이 1이면 error
	}
	
	// ------------------------ event -----------------------------------
	/**
	 * <h2>이벤트 개설완료</h2>
	 * @author 오종택
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value = "/event/create", method = RequestMethod.POST)
	@ResponseBody
	public int eventCreateTwo(Model model, InformEvtDto dto, HttpSession session,MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("이벤트 개설1  eventCreate : {}", dto);
		LoginMemDto Ldto =  (LoginMemDto)session.getAttribute("LDto");
		boolean isc = e_service.eventCreate(dto, Ldto.getMi_nck());
		System.out.println(isc);
		System.out.println(dto.getEf_id());
		System.out.println(Ldto.getMi_nck());
		
		//이벤트  대표 이미지 
		MultipartFile mRfile = request.getFile("basicfile");
		//System.out.println(mRfile);	
		// 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
			
				
		if (isc) { // eventCreate가 insert성공 했을때 
					
			// 이벤트 대표이미지 업로드
			if (mRfile==null) {
				// 대표이미지를 기본이미지로 했을경우 
				InformFileDto fdto = new InformFileDto("eventbasic", "eventbasic.jpg", 8060, uploadPath);
				f_service.insertRfile(fdto, dto.getEf_id());
			}else {
				String originalname = mRfile.getOriginalFilename();
				logger.info("대표 이미지 원본 이름 : "+originalname);
				long filesize = mRfile.getSize();
				String storedname = UUID.randomUUID()+originalname.substring(originalname.lastIndexOf("."));
				logger.info("대표 이미지 저장될 이름 : "+storedname);
					
				File storage = new File(uploadPath);
				if (!storage.exists()) {
					storage.mkdir();
				}
				mRfile.transferTo(new File(uploadPath+"/"+storedname)); // 파일 업로드
				InformFileDto fdto = new InformFileDto(originalname, storedname, filesize, uploadPath);
				f_service.insertRfile(fdto, dto.getEf_id());
			}
			//이벤트 첨부이미지 리스트
			List<MultipartFile> mfList = request.getFiles("file");
			logger.info("이벤트 첨부 이미지 업로드 개수 :"+mfList.size());	
					
			if (mfList.size()!=0) { // 이벤트 첨부이미지가 존재한다면 실행
				File storage = new File(uploadPath);
				if (!storage.exists()) {
					storage.mkdir();
				}
				
				for (MultipartFile mf : mfList) {
						String originalname = mf.getOriginalFilename();
						logger.info("이벤트 첨부이미지 원본 이름 : "+originalname);
						long filesize = mf.getSize();
						String storedname = UUID.randomUUID()+originalname.substring(originalname.lastIndexOf("."));
						logger.info("이벤트 대표이미지 저장될 이름 : "+storedname);
						mf.transferTo(new File(uploadPath+"/"+storedname));
						InformFileDto fdto = new InformFileDto(originalname, storedname, filesize, uploadPath);
						f_service.insertDfile(fdto, dto.getEf_id());
					}
				}
			}
				
	return isc?dto.getEf_id():1; // 1을 반환하면 실패
	}
	
	/**
	 * <h2>이벤트 재개설완료</h2>
	 * @author 오종택
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * 
	 */
	@RequestMapping(value = "/event/recresuccess", method = RequestMethod.POST)
	@ResponseBody
	public int eventReCreateSuccess(String decide,Model model, InformEvtDto dto, HttpSession session,MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("이벤트 재개설완료 eventReCreateSuccess : {}", dto);
		LoginMemDto Ldto =  (LoginMemDto)session.getAttribute("LDto");
		System.out.println(dto.getEf_refer());
		System.out.println(Ldto.getMi_nck());
		boolean isc = e_service.eventReCreate(dto, Ldto.getMi_nck());

		//이벤트  대표 이미지 
				MultipartFile mRfile = request.getFile("basicfile");
				//System.out.println(mRfile);	
				// 파일 업로드 경로
				String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
					
						
				if (isc) { // eventCreate가 insert성공 했을때 
							
					// 이벤트 대표이미지 업로드
					if (decide.equals("eventbasic")) {
						// 대표이미지를 기본이미지로 했을경우 
						InformFileDto fdto = new InformFileDto("eventbasic", "eventbasic.jpg", 8060, uploadPath);
						f_service.insertRfile(fdto, dto.getEf_id());
					}else {
						String originalname = mRfile.getOriginalFilename();
						logger.info("대표 이미지 원본 이름 : "+originalname);
						long filesize = mRfile.getSize();
						String storedname = UUID.randomUUID()+originalname.substring(originalname.lastIndexOf("."));
						logger.info("대표 이미지 저장될 이름 : "+storedname);
							
						File storage = new File(uploadPath);
						if (!storage.exists()) {
							storage.mkdir();
						}
						mRfile.transferTo(new File(uploadPath+"/"+storedname)); // 파일 업로드
						InformFileDto fdto = new InformFileDto(originalname, storedname, filesize, uploadPath);
						f_service.insertRfile(fdto, dto.getEf_id());
					}
					//이벤트 첨부이미지 리스트
					List<MultipartFile> mfList = request.getFiles("file");
					logger.info("이벤트 첨부 이미지 업로드 개수 :"+mfList.size());	
							
					if (mfList.size()!=0) { // 이벤트 첨부이미지가 존재한다면 실행
						File storage = new File(uploadPath);
						if (!storage.exists()) {
							storage.mkdir();
						}
						
						for (MultipartFile mf : mfList) {
								String originalname = mf.getOriginalFilename();
								logger.info("이벤트 첨부이미지 원본 이름 : "+originalname);
								long filesize = mf.getSize();
								String storedname = UUID.randomUUID()+originalname.substring(originalname.lastIndexOf("."));
								logger.info("이벤트 대표이미지 저장될 이름 : "+storedname);
								mf.transferTo(new File(uploadPath+"/"+storedname));
								InformFileDto fdto = new InformFileDto(originalname, storedname, filesize, uploadPath);
								f_service.insertDfile(fdto, dto.getEf_id());
							}
						}
					}
		
		
		return isc?dto.getEf_id():1; // 1을 반환하면 실패;
	}
	
	/**
	 * <h2>이벤트 수정</h2>
	 * @author 오종택
	 * @param 화면에서 입력받은 값 (이벤트명, 상세내용, 참가조건, 인원, 개최일, 모집 마감일, 장소, 카테고리), 대표이미지는 추가 예정
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * 
	 */
	@RequestMapping(value = "/event/modisuccess", method = RequestMethod.POST)
	@ResponseBody
	public int eventModifyClear(String decide,InformEvtDto dto,int fi_seq,String ef_id, HttpSession session,MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("이벤트 수정완료 eventModifyClear: {} {}", dto, ef_id);
		boolean isc = e_service.eventModify(dto);
		LoginMemDto Ldto = (LoginMemDto)session.getAttribute("LDto");
		System.out.println(Ldto.getMi_nck());
		//이벤트  대표 이미지 
		MultipartFile mRfile = request.getFile("basicfile");
		
		// 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
			
		if (isc) { 
			
			// 이벤트 대표이미지 업로드
			if (decide.equals("eventbasic")) {
				// 대표이미지를 기본이미지로 했을경우 
				InformFileDto fdto = new InformFileDto(fi_seq,"eventbasic", "eventbasic.jpg", 8060, uploadPath);
				f_service.updateRfile(fdto);
			}else if(decide.equals("update")){
				String originalname = mRfile.getOriginalFilename();
				logger.info("대표 이미지 원본 이름 : "+originalname);
				long filesize = mRfile.getSize();
				String storedname = UUID.randomUUID()+originalname.substring(originalname.lastIndexOf("."));
				logger.info("대표 이미지 저장될 이름 : "+storedname);
					
				File storage = new File(uploadPath);
				if (!storage.exists()) {
					storage.mkdir();
				}
				mRfile.transferTo(new File(uploadPath+"/"+storedname)); // 파일 업로드
				InformFileDto fdto = new InformFileDto(fi_seq, originalname, storedname, filesize, uploadPath);
				f_service.updateRfile(fdto);
			}
			//이벤트 첨부이미지 리스트
			List<MultipartFile> mfList = request.getFiles("file");
			logger.info("이벤트 첨부 이미지 업로드 개수 :"+mfList.size());	
					
			if (mfList.size()!=0) { // 이벤트 첨부이미지가 존재한다면 실행
				File storage = new File(uploadPath);
				if (!storage.exists()) {
					storage.mkdir();
				}
				
				for (MultipartFile mf : mfList) {
						String originalname = mf.getOriginalFilename();
						logger.info("이벤트 첨부이미지 원본 이름 : "+originalname);
						long filesize = mf.getSize();
						String storedname = UUID.randomUUID()+originalname.substring(originalname.lastIndexOf("."));
						logger.info("이벤트 대표이미지 저장될 이름 : "+storedname);
						mf.transferTo(new File(uploadPath+"/"+storedname));
						InformFileDto fdto = new InformFileDto(originalname, storedname, filesize, uploadPath);
						f_service.insertDfile(fdto, dto.getEf_id());
					}
				}
			}

		return isc?dto.getEf_id():1; // 1을 반환하면 실패;
	}
	
		/** 이벤트 수정시 파일 리스트
		 * @author 김수정
		 * @param ef_id
		 * @return map
		 */
			@RequestMapping(value = "/event/fileList")
			@ResponseBody
			public HashMap<String, Object> eventfileList(int ef_id){
				logger.info("이벤트 수정시 파일 가져오기 ",ef_id);
				HashMap<String , Object> map = new HashMap<String, Object>();
				List<InformFileDto> dto = f_service.selectDfile(ef_id);
				logger.info("이벤트 수정시 파일 리스트 :"+dto);
				map.put("file", dto);
				
				return map;
			}
	/**
	 * 이벤트 후기 리스트
	 * @author 김수정
	 * @param ef_id
	 * @return
	 */
	@RequestMapping(value = "/review/list")
	@ResponseBody
	public Map<String, Object> commentList(int ef_id) {
		Map<String, Object> map = new HashMap<String, Object>();
			 
		// 후기 리스트 
		List<EventBrdDto> reviewDTO = eb_service.selectReview(ef_id);
		       
		map.put("rdto", reviewDTO);
		System.out.println(map);
		return map;
		}
	
	/**
	 * 이벤트 후기 작성
	 * @author 김수정
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	@ResponseBody
	public String review(EventBrdDto dto) {
		logger.info("후기 작성 review :{}",dto);
			
		boolean isc = eb_service.insertReview(dto);
			
		return isc?"success":"error";
	}
	
	/**
	 * 이벤트 후기 삭제
	 * @author 김수정
	 * @param eb_seq
	 * @return
	 */
	@RequestMapping(value = "/review/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delReview(int eb_seq) {
		logger.info("delReview 후기 삭제 : ",eb_seq);
		boolean isc = eb_service.deleteReview(eb_seq);
			
		return isc?"success":"error";
	}
	
	/**
	 * 이벤트 후기 수정
	 * @author 김수정
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/review/modify ", method = RequestMethod.GET)
	@ResponseBody
	public String upReview(EventBrdDto dto) {
		logger.info("후기 수정 modifyReview :{}",dto);
		boolean isc = eb_service.modifyReview(dto);
			
		return isc?"success":"error";
	}
	
	/**
	 * 이벤트 문의 리스트
	 * @author 김수정
	 * @param ef_id
	 * @return
	 */
	@RequestMapping(value = "/ask/list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> inquiryList(int ef_id) {
		Map<String, Object> map = new HashMap<String, Object>();
			 
		// 문의 리스트
		List<EventBrdDto> inquiryDTO = eb_service.selectInquiry(ef_id);
		       
		map.put("dto", inquiryDTO);
		System.out.println(map);
		return map;
		}
	/**
	 * 이벤트 문의 작성
	 * @author 김수정
	 * @param dto
	 * @return
	 */
		@RequestMapping(value = "/ask/write", method = RequestMethod.POST)
		@ResponseBody
		public String insertInquiry(EventBrdDto dto) {
			logger.info("문의 작성 insertInquiry :{}",dto );
			
			boolean isc = eb_service.insertInquiry(dto);
			
			return isc?"success":"error";
		}
	/**
	 * 이벤트 문의 답변 
	 * @author 김수정
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/ask/reply",method = RequestMethod.GET)
	@ResponseBody
	public String replyIn(EventBrdDto dto) {
		logger.info("replyIn 문의 답변 ");
		boolean isc = eb_service.reply(dto);
			
		return isc?"success":"error";
	}
	/**
	 * 이벤트 문의 수정
	 * @author 김수정
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/ask/modify",method = RequestMethod.GET)
	@ResponseBody
	public String upInquiry(EventBrdDto dto) {
		logger.info("문의 수정 modifyInquiry");
		boolean isc =eb_service.modifyInquiry(dto);
			
		return isc?"success":"error";
	}	
	/**
	 * 이벤트 문의 삭제
	 * @author 김수정
	 * @param dto
	 * @param eb_seq
	 * @param eb_step
	 * @param eb_refer
	 * @return
	 */
	@RequestMapping(value = "/ask/delete" , method = RequestMethod.GET)
	@ResponseBody
	public String delInquiry(EventBrdDto dto, int eb_seq, int eb_step,int eb_refer) {
		logger.info("delInquiry.do 문의 삭제 {}",eb_step);
		boolean isc1 = false;
		if (eb_step==1) {
			isc1 = eb_service.delReplyInquiry(dto);
		}else {
			isc1 = eb_service.delAllInquiry(eb_refer);
		}
			
		return isc1?"success":"error";
	}

	@RequestMapping(value = "/moveMap.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> getMapdata(String uc_id){
		logger.info("/moveMap.do\t {}",uc_id);
		String latitude=u_service.getLatitude(uc_id);
		Map<String, String> map=new HashMap<String,String>();
		map.put("positionX", latitude.split(",")[0]);
		map.put("positionY", latitude.split(",")[1]);
		map.put("level","6");
		return map;
	}
}
