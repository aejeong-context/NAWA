package com.min.app.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.board.PagingMemDto;
import com.min.app.dto.board.WriteBrdDto;
import com.min.app.dto.event.InformEvtDto;
import com.min.app.dto.event.PartiSearchDto;
import com.min.app.dto.event.ParticEvtDto;
import com.min.app.dto.event.SearchEvtDto;
import com.min.app.dto.file.InformFileDto;
import com.min.app.dto.member.InformMemDto;
import com.min.app.dto.member.ListMemDto;
import com.min.app.dto.member.LoginMemDto;
import com.min.app.dto.member.PrivacyMemDto;
import com.min.app.dto.member.RegistMemDto;
import com.min.app.dto.member.UpdateMemDto;
import com.min.app.model.board.NoticeBoard_IService;
import com.min.app.model.event.Event_IService;
import com.min.app.model.eventboard.EventBoard_IService;
import com.min.app.model.file.InformFile_IService;
import com.min.app.model.member.Member_IService;
import com.min.app.model.util.Util_IService;
import com.min.app.module.KakaoApi;
import com.min.app.module.Scheduler;

@Controller
public class GeneralController {

	private static final Logger logger = LoggerFactory.getLogger(GeneralController.class);

	@Autowired
	private KakaoApi kakao;	//kako login api
	
	@Autowired
	private Member_IService m_service;	//member
	
	@Autowired
	private Util_IService u_service; //util
	
	@Autowired
	private Event_IService e_service; //event
	
	@Autowired
	private NoticeBoard_IService n_service;	//board
	
	@Autowired
	private InformFile_IService f_service;	//file
	
	@Autowired
	private EventBoard_IService eb_service; //eventboard
	

//  *	Main Page	*  //
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String init() {
		logger.info("GeneralController.init()");
		return "redirect:project/index";
	}
	
	@RequestMapping(value = "/project/index", method = RequestMethod.GET)
	public String index(PrivacyMemDto dto, HttpSession session, Model model) {
		
		logger.info("GeneralController.index() \t {}", dto);
		model.addAttribute("userCount",Scheduler.userCount);
		model.addAttribute("partiUser",Scheduler.partiUser);
		model.addAttribute("endEvent",Scheduler.endEvent);
		model.addAttribute("continueEvent",Scheduler.continueEvent);
		LoginMemDto LDto = (LoginMemDto)session.getAttribute("LDto");
		List<InformFileDto> flist = new ArrayList<InformFileDto>();

		if(LDto == null) {
			List<InformEvtDto> lists = e_service.eventSelect();
			for (int i = 0; i < lists.size(); i++) {
				int ef_id = lists.get(i).getEf_id();
				InformFileDto fdto = f_service.selectRfile(ef_id);
				flist.add(fdto);
			}
			model.addAttribute("list", lists);
			model.addAttribute("flist",flist);
			return "index";
		}else {
			PrivacyMemDto pDto = m_service.userInfo(LDto.getMr_id());	// 회원이 가입할때 입력한 지역을 찾기위해 세션에 있는 mr_id를 집어넣고 관련된 회원의 정보를 가져오는 DTO
			System.out.println(pDto.getMi_lc());						// 잘 가져왔나 확인
			List<InformEvtDto> lists = e_service.eventLocationCompare(pDto.getMi_lc());	// pDto에서 가져온 회원의 정보중 지역을 eventLocationCompare메소드에 집어넣으면 회원이 회원가입할때 입력했던 지역과 일치하는 리스트를 가져옴
			System.out.println(lists);
			for (int i = 0; i < lists.size(); i++) {
				int ef_id = lists.get(i).getEf_id();
				InformFileDto fdto = f_service.selectRfile(ef_id);
				flist.add(fdto);
			}
			model.addAttribute("list", lists);
			model.addAttribute("flist",flist);
			
			
			return "index";
		}
	}

	   //------------------------------------------MEMBER------------------------------------------------//
	   //  *   Sign Page   *  //
	   @RequestMapping(value = "/form/login", method = RequestMethod.GET)
	   public String login() {
	      logger.info("GeneralController.login()");
	      return "/sign/login";
	   }

	   /**
	    * 로그인
	    * @author 이창훈
	    * @param dto
	    * @param session
	    * @return
	    */
	   @SuppressWarnings("unused")
	   @RequestMapping(value = "/sign/login", method = RequestMethod.POST)
	   public String login(RegistMemDto dto, HttpSession session) {
	      logger.info("Welcome /sign/login : \t{} ", dto);
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("mr_id", dto.getMr_id());
	      map.put("mr_pw", dto.getMr_pw());
	      LoginMemDto LDto = m_service.login(map);
	      if(LDto != null) {
	         session.setAttribute("LDto", LDto);

	         if(LDto.getMr_dfl().equalsIgnoreCase("B")) {
	            System.out.println("정지먹은회원아이디");
	            return "blockPage";
	         }else if(LDto.getMr_dfl().equalsIgnoreCase("Y")) {
	            System.out.println("탈퇴한아이디");
	            return "redirect:/form/login";
	         }else {
	            if(LDto.getMr_auth().equalsIgnoreCase("A")) {
	               return "redirect:/";
	            }else {
	               return "redirect:/";
	            }
	         }
	      }else
	      {
	         return "redirect:/form/login";
	      }
	   }

	   /**
	    * 로그아웃
	    * @author 이창훈
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/sign/logout", method = RequestMethod.GET)
	   public String logout(HttpSession session) {
	      logger.info("Welcome /sign/logout : \t{}", new Date());
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         session.removeAttribute("LDto");
	      }
	      return "redirect:/form/login";
	   }

	   //-------------- API LOGIN -----------------------
	   /**
	    * 카카오 로그인 API
	    * @author hej
	    * @param code
	    * @return
	    */
	   @RequestMapping(value = "/kakao/login", method = RequestMethod.GET)
	   public String login(String code, HttpSession session) {
	      logger.info("/kakao/login \t{}",code);
	      String access_Token = kakao.getAccessToken(code);
	      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	      System.out.println("login Controller : " + userInfo);


	      RegistMemDto rdto=new RegistMemDto();
	      rdto.setMr_id(String.valueOf(userInfo.get("id")));
	      rdto.setMr_pw(String.valueOf(userInfo.get("id")));
	      rdto.setMr_email(String.valueOf(userInfo.get("email")));
	      rdto.setMr_name(String.valueOf(userInfo.get("name")));
	      rdto.setMr_platform("K");

	      if (!m_service.duplicateId(rdto.getMr_id())) {
	         System.out.println("이미 회원가입이 되어있는 ID!");
	         Map<String, String> map = new HashMap<String, String>();
	         map.put("mr_id", rdto.getMr_id());
	         map.put("mr_pw", rdto.getMr_pw());
	         LoginMemDto LDto = m_service.login(map);
	         System.out.println(LDto);
	         session.setAttribute("LDto", LDto);
	         return "redirect:/";
	      } else {
	         System.out.println(rdto);
	         session.setAttribute("SNDto", rdto);
	         return "sign/second";
	      }
	   }

	   // GOOGLE
	   /**
	    * 구글 로그인 API
	    * @author hej
	    * @param id google토큰으로 추출해온 정보
	    * @param name
	    * @param email
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/google/login", method = RequestMethod.POST)
	   public String googleCallback(String id, String name,String email,HttpSession session){
	      logger.info("/google/login \t{}",id+"/"+name+"/"+email);

	      RegistMemDto rdto = new RegistMemDto(); 
	      rdto.setMr_id(id);
	      rdto.setMr_pw(id);
	      rdto.setMr_name(name);
	      rdto.setMr_email(email);
	      rdto.setMr_platform("G");

	      System.out.println(rdto);

	      if (!m_service.duplicateId(rdto.getMr_id())) {
	         System.out.println("이미 회원가입이 되어있는 ID!");
	         Map<String, String> map = new HashMap<String, String>();
	         map.put("mr_id", rdto.getMr_id());
	         map.put("mr_pw", rdto.getMr_pw());
	         LoginMemDto LDto = m_service.login(map);
	         System.out.println(LDto);
	         System.out.println(LDto.getMr_platform()+"\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	         session.setAttribute("LDto", LDto);
	         return "redirect:/";
	      } else {

	         System.out.println(rdto);
	         session.setAttribute("SNDto", rdto);
	         return "sign/second";
	      }
	   }

	   /**
	    * 1단계 회원가입
	    * @author 이창훈
	    * @param model
	    * @return
	    */
	   @RequestMapping(value = "/sign/first", method = RequestMethod.GET)
	   public String signUpFirst(Model model) {
	      int ran = new Random().nextInt(900000) + 100000;
	      model.addAttribute("random", ran);
	      return "sign/first";
	   }

	   /**
	    * 2단계 회원가입
	    * @author 이창훈
	    * @return
	    */
	   @RequestMapping(value = "/sign/second", method = RequestMethod.POST)
	   public String signUpSecond(RegistMemDto dto, HttpSession session){
	      logger.info("Welcome /sign/second : \t{} ", dto);
	      session.setAttribute("SNDto", dto);
	      return "sign/second";
	   }

	   /**
	    * 최종 회원가입
	    * @author 이창훈
	    * @return
	    * @throws IOException 
	    * @throws IllegalStateException 
	    */
	   @RequestMapping(value = "/sign/apply", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	   public String signUpSecondApply(InformMemDto dto, HttpSession session,MultipartHttpServletRequest request) throws IllegalStateException, IOException{
	      logger.info("Welcome /sign/apply : \t{} ", dto);

	      RegistMemDto rdto=(RegistMemDto)session.getAttribute("SNDto");
	      dto.setMr_id(rdto.getMr_id());

	      boolean isc1 = m_service.insertMR(rdto);
	      boolean isc2 = m_service.insertMI(dto);

	      logger.info("Welcome /signup/apply 결과: \t{}{} ", isc1,isc2);
	      session.removeAttribute("SNDto");


	      MultipartFile file = request.getFile("file");
	      boolean isc = file.isEmpty();

	      // session에서 가져올 예정
	      String mr_id =dto.getMr_id() ;
	      if (isc) {
	         //System.out.println("파일 없음");
	         String basic ="basicprofile";
	         InformFileDto idto = new InformFileDto(basic, "profile.png", 1160, basic);
	         f_service.insertProFile(idto, mr_id);
	      }else {
	         //System.out.println("파일 있음");
	         String originalname =file.getOriginalFilename();
	         logger.info("파일 원본이름 :"+originalname);
	         long filesize =file.getSize();
	         logger.info("파일 사이즈 : "+filesize);
	         String ext =originalname.substring(originalname.lastIndexOf("."));
	         logger.info("확장자명: "+ext);
	         String storedname = UUID.randomUUID()+ext;
	         logger.info("저장될 파일 이름 :"+storedname);
	         String path =request.getSession().getServletContext().getRealPath("/upload");

	         File dir = new File(path);
	         if (!dir.exists()) {
	            dir.mkdirs();
	         }

	         file.transferTo(new File(path+"/"+storedname));
	         logger.info("업로드 :"+path+"/"+storedname);

	         InformFileDto idto = new InformFileDto(originalname, storedname, filesize, path);
	         f_service.insertProFile(idto, mr_id);

	      }

	      return isc1&&isc2?"redirect:/form/login":"redirect:/sign/second";
	   }

	   /**
	    * 회원상태변경
	    * @author 이창훈
	    * @param model
	    * @param session
	    * @param mi_condition
	    * @return
	    */
	   @RequestMapping(value = "/state/apply", method = RequestMethod.GET)
	   public String updateStateApply(Model model,HttpSession session, String mi_condition) {
	      logger.info("Welcome /state/apply : \t{}", mi_condition);
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         ldto.setMi_condition(mi_condition);
	         session.removeAttribute("LDto");
	         session.setAttribute("LDto", ldto);
	         Map<String, String> map = new HashMap<String, String>();
	         map.put("mr_id", ldto.getMr_id());
	         map.put("mi_condition", mi_condition);
	         m_service.updateState(map);
	         return "redirect:/";
	      }
	      else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 회원정보변경 이동
	    * @author 이창훈
	    * @param model
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/sign/info", method = RequestMethod.GET)
	   public String updateInfo(Model model,HttpSession session) {
	      logger.info("Welcome /sign/info : \t{}", new Date());
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         PrivacyMemDto pDto = m_service.userInfo(ldto.getMr_id());
	         model.addAttribute("pDto", pDto);
	         int ran = new Random().nextInt(900000) + 100000;
	         model.addAttribute("random", ran);
	         InformFileDto fdto = f_service.selectProFile(ldto.getMr_id());
	         model.addAttribute("fdto", fdto);
	         return "/sign/info";
	      }
	      else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 회원 정보 변경
	    * @author 이창훈
	    * @param session
	    * @param dto
	    * @return
	    * @throws IOException 
	    * @throws IllegalStateException 
	    */
	   @RequestMapping(value = "/sign/update", method = RequestMethod.POST)
	   public String updateInfoApply(int fi_seq,String decide,HttpSession session, UpdateMemDto dto,MultipartHttpServletRequest request) throws IllegalStateException, IOException {
	      logger.info("Welcome /sign/update : \t{}", dto);
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	      boolean isc = m_service.updateInfo(dto);
	      LoginMemDto sDto = (LoginMemDto) session.getAttribute("LDto");
	      PrivacyMemDto pDto = m_service.userInfo(dto.getMr_id());
	      LoginMemDto lDto = new LoginMemDto(pDto.getMr_id(), pDto.getMi_nck(), "U", pDto.getMi_profile(), null, pDto.getMi_condition(), pDto.getMi_lc(), sDto.getMr_platform() );
	      session.removeAttribute("LDto");
	      session.setAttribute("LDto", lDto);

	      MultipartFile mf = request.getFile("file");
	      logger.info("업데이트될 파일 seq : "+fi_seq);

	      // 파일 업로드 경로
	      String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
	      boolean fisc = mf.isEmpty();
	      logger.info("파일 비어 있는지 여부 :"+fisc);

	      if (decide.equals("profile")) { // 기본 프로필 사진일 경우 
	         InformFileDto fdto = new InformFileDto(fi_seq,"profile.png", "profile.png", 23108, uploadPath);
	         f_service.updateProFile(fdto);
	      }else if(!fisc){
	         String originname = mf.getOriginalFilename();
	         logger.info("프로필 원본 이름 :"+originname);
	         long size = mf.getSize();
	         String storedname = UUID.randomUUID()+originname.substring(originname.lastIndexOf("."));
	         logger.info("프로필 저장될 이름 : "+storedname);

	         File storage = new File(uploadPath);
	         if (!storage.exists()) {
	            storage.mkdir();
	         }
	         mf.transferTo(new File(uploadPath+"/"+storedname)); // 파일 업로드
	         InformFileDto fdto = new InformFileDto(fi_seq,originname, storedname, size, uploadPath);
	         f_service.updateProFile(fdto);
	      }


	      return isc?"redirect:/":"redirect:/sign/info";
	      }
	      else {
	         return "/sign/login";
	      }
	   }



	   /**
	    * 회원 탈퇴 적용
	    * @author 이창훈
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/drop/apply", method = RequestMethod.GET)
	   public String signUpDropApply(HttpSession session) {
	      logger.info("Welcome admin/block : \t{}", new Date());
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         m_service.signUpDrop(ldto.getMr_id());
	         if(ldto != null) {
	            session.removeAttribute("LDto");
	         }
	         return "redirect:/";
	      }else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 대시보드 이동
	    * @author 이창훈
	    * @param model
	    * @param session
	    * @return
	    */
	   @RequestMapping(value="/user/dashboard",method = RequestMethod.GET)
	   public String dashBoard(HttpSession session, Model model) {
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         //관련된 이벤트 정보
	         List<InformEvtDto> clists = m_service.closeEvent(ldto.getMi_nck());
	         List<InformEvtDto> olists = m_service.openEvent(ldto.getMi_nck());
	         List<InformEvtDto> ilists = m_service.inviteEvent(ldto.getMi_nck());
	         model.addAttribute("clists", clists);
	         model.addAttribute("olists", olists);
	         model.addAttribute("ilists", ilists);

	         //관련된 이벤트 수
	         int closeCount = m_service.closeEventCount(ldto.getMi_nck());
	         int openCount = m_service.openEventCount(ldto.getMi_nck());
	         int inviteCount = m_service.inviteEventCount(ldto.getMi_nck());
	         model.addAttribute("closeCount", closeCount);
	         model.addAttribute("openCount", openCount);
	         model.addAttribute("inviteCount", inviteCount);
	         
	         return "/sign/dashboard";
	      }else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 비밀번호 변경 이동
	    * @author 이창훈
	    * @param model
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/change/form", method= RequestMethod.GET)
	   public String pwChangeForm(Model model, HttpSession session) {
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         model.addAttribute("dto", ldto);
	         return "/sign/pwChangeForm";
	      }
	      else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 비밀번호 변경 적용
	    * @author 이창훈
	    * @param mr_id
	    * @param mr_pw
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/change/apply", method = RequestMethod.POST)
	   public String ChangeApply(String mr_id, String mr_pw, HttpSession session) {
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("mr_id", mr_id);
	      map.put("mr_pw", mr_pw);
	      m_service.pwChange(map);
	      m_service.codeReset(mr_id);
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         session.removeAttribute("LDto");
	      }
	      return "/sign/login";
	   }

	   /**
	    * 비밀번호 재설정 이동
	    * @author 이창훈
	    * @return
	    */
	   @RequestMapping(value = "/reset/form", method= RequestMethod.GET)
	   public String resetForm() {
	      return "/sign/PasswordReset";
	   }

	   /**
	    * 비밀번호 재설정 링크 메일 보내기
	    * @author 이창훈
	    * @param session
	    * @param mr_id
	    * @param mr_email
	    * @return
	    */
	   @RequestMapping(value="/pw/EmailSend", method=RequestMethod.POST)
	   public String pwEmailSend(HttpSession session, String mr_id, String mr_email){
	      int ran = new Random().nextInt(900000) + 100000;
	      String mr_code = String.valueOf(ran);
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("mr_code", mr_code);
	      map.put("mr_id", mr_id);
	      m_service.codeUpdate(map);
	      String subject = "비밀번호 재설정 안내 입니다.";
	      StringBuilder sb = new StringBuilder();
	      String sendEmailId = "nawacp.2020@gmail.com";
	      sb.append("<a href='http://naw.kr/pw/change?mr_id="+mr_id+"&mr_code="+mr_code+"'>"+"\n 이 링크로 들어가서 재설정할 패스워드를 입력 해주세요.");
	      String email = mr_email;
	      m_service.send(subject, sb.toString(), sendEmailId, email, null);
	      return "/sign/login";
	   }

	   /**
	    * 비밀번호 재설정 이동
	    * @author 이창훈
	    * @param model
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/pw/change", method= RequestMethod.GET)
	   public String pwChange(Model model, String mr_id, HttpSession session, String mr_code) {
	      String setCode = m_service.codeSelect(mr_id);
	      System.out.println(setCode+"@@@@@@@@@@@");
	      System.out.println(mr_code+"###########");
	      if(setCode.equalsIgnoreCase("없음")){
	         int er = 1;
	         model.addAttribute("er", er);
	         return "/sign/pwChangeForm2";
	      }else if(setCode.equalsIgnoreCase(mr_code)) {
	         int er = 0;
	         model.addAttribute("er", er);
	         model.addAttribute("mr_id", mr_id);
	         return "/sign/pwChangeForm2";
	      }else{
	         int er = 1;
	         model.addAttribute("er", er);
	         return "/sign/pwChangeForm2";
	      }
	   }

	   /**
	    * 회원리스트 조회 이동
	    * @author 이창훈
	    * @param model
	    * @return
	    */
	   // 3. Controller
	   @RequestMapping(value="/user/list", method={RequestMethod.POST,RequestMethod.GET})
	   public String paging(Model model, HttpServletRequest req, HttpSession session){
	      LoginMemDto ldto = (LoginMemDto) session.getAttribute("LDto");
	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            PagingMemDto paging = new PagingMemDto(req.getParameter("index"),
	                  req.getParameter("pageStartNum"),
	                  req.getParameter("listCnt"));
	            List<ListMemDto> lists = m_service.selectCountUser(paging);
	            paging.setTotal(m_service.userTotalCount());
	            model.addAttribute("lists", lists);
	            model.addAttribute("paging", paging);
	            logger.info("페이징DTO 값 "+paging.toString()+" Controller 리턴전 실행 시간 : "+(new Date()));
	            return "/sign/userList";
	         }else{
	            return "redirect:/";
	         }
	      }
	      else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 회원 정지 하기
	    * @author 이창훈
	    * @param id
	    * @return
	    */
	   @RequestMapping(value = "/user/ban", method = RequestMethod.GET)
	   public String ban(String id, HttpSession session) {
	      LoginMemDto ldto = (LoginMemDto)session.getAttribute("LDto");
	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            logger.info("Welcome /user/ban : \t{}", id);
	            m_service.userBan(id);
	            return "redirect:/user/list";
	         }else{
	            return "redirect:/";
	         }
	      }
	      else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 회원 정지 풀기
	    * @author 이창훈
	    * @param id
	    * @return
	    */
	   @RequestMapping(value = "/user/release", method = RequestMethod.GET)
	   public String release(String id, HttpSession session) {
	      logger.info("Welcome /user/release : \t{}", id);
	      LoginMemDto ldto = (LoginMemDto)session.getAttribute("LDto");
	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            m_service.userRelease(id);
	            return "redirect:/user/list";
	         }else{
	            return "redirect:/";
	         }
	      }
	      else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 회원 상세 이동
	    * @author 이창훈
	    * @param model
	    * @param id
	    * @return
	    */
	   @RequestMapping(value = "/user/detail", method = RequestMethod.GET)
	   public String userList(Model model, String id, HttpSession session) {
	      logger.info("Welcome /user/detail : \t{}", id);
	      LoginMemDto ldto = (LoginMemDto)session.getAttribute("LDto");
	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            ListMemDto dto = m_service.detailUserList(id);
	            String changeCode=u_service.changeLC(dto.getMi_lc());
	            dto.setMi_lc(changeCode);
	            model.addAttribute("ddto", dto);
	            InformFileDto fdto = f_service.selectProFile(id);
	            model.addAttribute("fdto",fdto);
	            return "/sign/userDetail";
	         }else{
	            return "redirect:/";
	         }
	      }
	      else {
	         return "/sign/login";
	      }
	   }
	//------------------------------------------ EVENT ------------------------------------------------//
	/**
	 * <h2>이벤트 조회</h2>
	 * @author 오종택
	 * @return 이벤트 리스트
	 */
	@RequestMapping(value = "/event/list", method = {RequestMethod.GET , RequestMethod.POST})
	public String eventSelect(Model model, HttpSession session ,PagingBrdDto pdto) {
		session.getAttribute("LDto");

		logger.info("이벤트 조회  eventlist : {}", pdto);

		List<InformEvtDto> lists = e_service.pageList(pdto);
		pdto.setTotal(e_service.CountList());
		System.out.println(pdto.getTotal());
		model.addAttribute("lists", lists);
		model.addAttribute("paging", pdto);

		return "event/eventList";
	}

	/**
	 * <h2>이벤트 검색</h2>
	 * @author 오종택
	 * @param Event_SearchDto
	 * @return 이벤트 리스트
	 * 
	 */
	@RequestMapping(value = "/event/search", method = {RequestMethod.GET, RequestMethod.POST})
	public String eventSelect(HttpSession session, SearchEvtDto dto, Model model, PagingBrdDto pdto) {
		logger.info("이벤트 검색 eventSearch: {} \t{}", dto, pdto);

		session.setAttribute("search", dto);
		
		int count = e_service.eventCountSearch(dto);
		System.out.println(count);
		
		List<InformFileDto> flist = new ArrayList<InformFileDto>();
		List<String> map = new ArrayList<String>();
		
		if (session.getAttribute("search") == null) {
			System.out.println("여기1");
			List<InformEvtDto> list = e_service.pageList(pdto);
			for (int i = 0; i < list.size(); i++) {
				int ef_id = list.get(i).getEf_id();
				InformFileDto fdto = f_service.selectRfile(ef_id);
				flist.add(fdto);
				String ef_title = list.get(i).getEf_title();
				// '[n회차]' 라는 말이 들어가면 공백이 생겨서 if문으로 공백여부 판단 후 공백이 있다면 공백제거, 없으면 그냥 전송!
				if(ef_title.contains("\n" + 
						"		")) {
					map.add("{ "+"content : '<div> <input id=\"url\" type=\"hidden\" value=\"../event/detail?ef_id="+ef_id+"\">" +ef_title.replaceAll("\n" + 
							"		", " ")+"</a></div>', latlng : new kakao.maps.LatLng("+list.get(i).getEf_lc_detail()+")}");
				}else {
					map.add("{ "+"content : '<div> <input id=\"url\" type=\"hidden\" value=\"../event/detail?ef_id="+ef_id+"\">"+list.get(i).getEf_title()+"</a> </div>', latlng : new kakao.maps.LatLng("+list.get(i).getEf_lc_detail()+")}");
				}									
			}
			pdto.setTotal(e_service.CountList());
			model.addAttribute("lists", list);
			model.addAttribute("size", list.size());	// 이벤트 리스트에 출력되는 이벤트 갯수
			model.addAttribute("paging", pdto);
			System.out.println(">>>>>>>>>>>>>"+map);
			model.addAttribute("test",map);
		}else {
			System.out.println("여기2");
			List<InformEvtDto> lists = e_service.eventSearch(dto); // lists
			for (int i = 0; i < lists.size(); i++) {
				int ef_id = lists.get(i).getEf_id();
				InformFileDto fdto = f_service.selectRfile(ef_id);
				flist.add(fdto);
				String ef_title = lists.get(i).getEf_title();
				// '[n회차]' 라는 말이 들어가면 공백이 생겨서 if문으로 공백여부 판단 후 공백이 있다면 공백제거, 없으면 그냥 전송!
				if(ef_title.contains("\n" + 
						"		")) {
					map.add("{ "+"content : '<div> <input id=\"url\" type=\"hidden\" value=\"../event/detail?ef_id="+ef_id+"\">"+ef_title.replaceAll("\n" + 
							"		", " ")+"</a></div>', latlng : new kakao.maps.LatLng("+lists.get(i).getEf_lc_detail()+")}");
				}else {
					map.add("{ "+"content : '<div> <input id=\"url\" type=\"hidden\" value=\"../event/detail?ef_id="+ef_id+"\">"+lists.get(i).getEf_title()+"</a> </div>', latlng : new kakao.maps.LatLng("+lists.get(i).getEf_lc_detail()+")}");
				}
			}	
			model.addAttribute("flist",flist);
			dto.setTotal(e_service.eventCountSearch(dto));
			model.addAttribute("lists", lists);
			model.addAttribute("size", lists.size());	// 이벤트 리스트에 출력되는 이벤트 갯수
			model.addAttribute("paging", dto);
			System.out.println(">>>>>>>>>>>>>"+map);
			model.addAttribute("test",map);
		}
		
		if(session.getAttribute("LDto")==null)
		{
			model.addAttribute("user_lc","37.499983,127.035579");
		}else
		{
			LoginMemDto ldto=(LoginMemDto) session.getAttribute("LDto");
			System.out.println(ldto);
			model.addAttribute("user_lc",u_service.getLatitude(ldto.getMi_lc()));
		}
		return "event/eventSearch";
	}

	/**
	 * <h2>이벤트 개설</h2>
	 * @author NAWA
	 * @param 화면에서 입력받은 값 (이벤트명, 상세내용, 참가조건, 인원, 개최일, 모집 마감일, 장소, 카테고리)
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 */
	@RequestMapping(value = "/event/create", method = RequestMethod.GET)
	public String eventCreate(HttpSession session,Model model) {
		logger.info("이벤트 개설  eventCreate : {}", new Date());
		LoginMemDto dto = (LoginMemDto)session.getAttribute("LDto");

		if(session.getAttribute("LDto") == null) {
			return "redirect:/form/login";
		}else {
			PrivacyMemDto pdto = m_service.userInfo(dto.getMr_id());	// 이벤트 개설시 회원의 연락처, 이메일을 가져오기 위한 문장
			model.addAttribute("email", pdto.getMr_email());	// email이란 이름으로 회원의 이메일을 넘김
			model.addAttribute("phone", pdto.getMi_phone());	// phone이란 이름으로 회원의 전화번호를 넘김
			return "event/eventCreate";
		}
	}

	

	/**
	 * <h2>이벤트 재개설</h2>
	 * @author 오종택
	 * @param 화면에서 입력받은 값 (이벤트명, 상세내용, 참가조건, 인원, 개최일, 모집 마감일, 장소, 카테고리), 대표이미지는 추가 예정
	 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
	 * 
	 */
	@RequestMapping(value = "/event/recreate", method = RequestMethod.POST)
	public String eventReCreate(Model model, int ef_id, HttpSession session) {
		logger.info("이벤트 재개설  eventRecreate : {}", ef_id);
		LoginMemDto Ldto =  (LoginMemDto)session.getAttribute("LDto");
		
		if(session.getAttribute("LDto") == null) {
			return "redirect:/form/login";
		}else {
		InformEvtDto dto =  e_service.eventDetail(ef_id);
		PrivacyMemDto pdto = m_service.userInfo(Ldto.getMr_id());	// 회원정보가 담긴 PrivacyMemDto에 있는 정보를 가져오기 위해 추가함

		model.addAttribute("edto", dto);
		model.addAttribute("email", pdto.getMr_email());	
		model.addAttribute("phone", pdto.getMi_phone());	// pdto에서 가져온 이메일과 전화번호를 같이 넘김
		System.out.println(pdto);
		return "event/eventRecreate";
		}
	}



	/**
	 * <h2>이벤트 상세보기</h2>
	 * @author 오종택
	 * @param 이벤트 아이디
	 * @return 상세내용(이벤트명, 이벤트 상세내용, 참가조건, 인원수, 마감일, 장소, 카테고리, 이벤트 상태, 개최일, 폐쇄여부)
	 */
	@RequestMapping(value = "/event/detail", method = RequestMethod.GET)
	public String eventDetail(Model model, ParticEvtDto dto, HttpSession session) {
		logger.info("이벤트 상세보기  eventdetail : {}", dto.getEf_id());
		LoginMemDto Ldto =  (LoginMemDto)session.getAttribute("LDto");	// 세션

		PrivacyMemDto pmdto = e_service.eventPhoneEmail(dto.getEf_id());
		
		//로그인 했을 경우에만 닉네임값 가지고옴
		if(Ldto!=null) {
			dto.setMi_nck(Ldto.getMi_nck());
		}
		model.addAttribute("LDto",Ldto);
		model.addAttribute("email",pmdto.getMr_email());
		model.addAttribute("phone",pmdto.getMi_phone());
		
		String eventCreateNick = e_service.eventNickFind(dto.getEf_id());	// ef_id에 맞는 개설자 닉네임을 가져오는 거
		String checkjoined=e_service.checkJoined(dto);
		
		System.out.println("checkjoined 참가했니?"+checkjoined);
		String wcheckjoined=e_service.wcheckJoined(dto);
		
		System.out.println("wcheckjoined 대기참가했니?"+wcheckjoined);
		String ep_auth = eb_service.epAuth(dto);
		
	    logger.info("ep_auth:",ep_auth);
	    model.addAttribute("ep_auth", ep_auth);
	    
	    List<InformFileDto> fdto = f_service.selectDfile(dto.getEf_id());
	    List<InformFileDto> plist = new ArrayList<InformFileDto>();
	    model.addAttribute("fdto",fdto);
	    
	    // 참가자 프로필 가져오기 
	       List<PartiSearchDto> list = e_service.eventLineUp(dto.getEf_id());
	      System.out.println(list);
	      for (int i = 0; i < list.size(); i++) {
	         InformFileDto pdto =  f_service.selectProFile(list.get(i).getMr_id());
	         plist.add(pdto);
	      }
	       logger.info("참가자프로필 리스트 : "+plist);
	       model.addAttribute("plist",plist);
	    
		if(Ldto!=null) {
			if(Ldto.getMi_nck().equalsIgnoreCase(eventCreateNick)) {	// 세션에 있는 닉네임이랑 개설자 닉네임을 비교해서 같으면 실행할 문장
				e_service.eventReadCount(dto.getEf_id());
				InformEvtDto idto = e_service.eventDetail(dto.getEf_id());
				System.out.println(idto);
				model.addAttribute("edto", idto);
				model.addAttribute("mi", Ldto.getMi_nck());
				model.addAttribute("eventCreateNick", eventCreateNick);
			}else{	// 세션에 있는 닉네임이랑 개설자 닉네임이 다를경우 실행할 문장
				e_service.eventReadCount(dto.getEf_id());
				InformEvtDto idto = e_service.eventDetail(dto.getEf_id());
				model.addAttribute("edto", idto);
				model.addAttribute("mi", Ldto.getMi_nck());
				model.addAttribute("eventCreateNick", eventCreateNick);
				//로그인후 참가자가 해당 이벤트에 참가중이 아닐떄 "n"리턴
				if(checkjoined==null) {
					checkjoined="n";
					model.addAttribute("checkjoined",checkjoined);
				}else if(checkjoined!=null) {
					//참가자가 이벤트에 참가중일때 본인 닉네임 리턴
					checkjoined=e_service.checkJoined(dto);
					System.out.println(checkjoined);
					model.addAttribute("checkjoined",checkjoined);
				}

				//대기 참가자가 아닐때
				if(wcheckjoined==null) {
					wcheckjoined="n";
					model.addAttribute("wcheckjoined",wcheckjoined);
				}else if(wcheckjoined!=null){
					//대기참가자 일때
					wcheckjoined=e_service.wcheckJoined(dto);
					model.addAttribute("wcheckjoined",wcheckjoined);
				}
			}
		}
		if(session.getAttribute("LDto") == null) {	// 세션이 NULL이라면 실행 시킬 EventDetail
			System.out.println(session);
			e_service.eventReadCount(dto.getEf_id());
			InformEvtDto idto = e_service.eventDetail(dto.getEf_id());
			model.addAttribute("edto", idto);

			//(비회원) 일때 "n" 리턴
			checkjoined="n";
			model.addAttribute("checkjoined",checkjoined);
		}
		
			return "event/eventDetail";
		}


		/**
		 * 참가하기 버튼 클릭시
		 * @author 신애정
		 * @param session
		 * @param dto
		 * @return 참가가능 여부
		 */
		@RequestMapping(value = "/event/enter",method = RequestMethod.POST)
		public String evnetEnter(HttpSession session,ParticEvtDto dto) {
			LoginMemDto logindto =(LoginMemDto) session.getAttribute("LDto");
			session.setAttribute("LDto", logindto);
			dto.setMi_nck(logindto.getMi_nck());
			String check = e_service.checkJoin(dto.getEf_id());
			System.out.println(check);
			int n = 0;

			switch (check) 
			{ case "참가가능": 
				//이벤트 참가 테이블에 자신의 닉네임이 없을때
				if(e_service.checkJoined(dto)==null) { 
					//내가 참여한 이벤트 수 증가 n+=
					e_service.eventCount(dto); 
					System.out.println(check+"실행된 쿼리수"+n); 
				} 
				break;
			case "마지막참가자": 
				//이벤트 참가 테이블에 자신의 닉네임이 없을때
				if(e_service.checkJoined(dto)==null) { 
					//마지막참가자일때 이벤트상태가 조기마감된다.
					n+=e_service.statusUpdate(dto.getEf_id()); 
					System.out.println(check+"실행된 쿼리수"+n);
					if(n==1) { 
						//내가 참여한 이벤트 수 증가 
						e_service.eventCount(dto);
						System.out.println(check+"실행된 쿼리수"+n); 
					} 
				} break; 
			case "불가하다":
				if(e_service.checkJoined(dto)!=null) {
					n=0; 
				} 
				break;

			default: //에러페이지로 이동 
				System.out.println(check+"실행된 쿼리수"+n); 
				break;
			}
			return (n>0)?"redirect:/event/detail?ef_id="+dto.getEf_id():"redirect:/event/detail?ef_id="+dto.getEf_id();
		}

		/**
		 * 참가취소 버튼 클릭시
		 * @author 신애정
		 * @param dto
		 * @param session
		 */

		@RequestMapping(value = "/event/exit",method = RequestMethod.POST)
		public String eventOut(HttpSession session,ParticEvtDto dto) {
			LoginMemDto logindto =(LoginMemDto) session.getAttribute("LDto");
			session.setAttribute("dto", logindto);
			dto.setMi_nck(logindto.getMi_nck());
			int n = 0;
			n = e_service.evetOut(dto);

			String check = e_service.checkEnd(dto.getEf_id());
			if(check.equalsIgnoreCase("E")) {
				n = e_service.wating(dto);
			}
			return (n>0)?"redirect:/event/detail?ef_id="+dto.getEf_id():"redirect:/event/detail?ef_id="+dto.getEf_id();
		}

		/**
		 * 대기참가 버튼 클릭시
		 * @author 신애정
		 * @param dto
		 * @param session
		 */

		@RequestMapping(value = "/wait/enter",method = RequestMethod.POST)
		public void waitEnter(HttpSession session,ParticEvtDto dto) {
			LoginMemDto logindto =(LoginMemDto) session.getAttribute("LDto");
			dto.setMi_nck(logindto.getMi_nck());
			int n =e_service.addWating(dto);
			//return (n>0)?"redirect:/":"redirect:/";
		}

		/**
		 * 대기취소 버튼 클릭시
		 * @author 신애정
		 * @param dto
		 * @param session
		 */

		@RequestMapping(value = "/wait/exit",method = RequestMethod.POST)
		public void waitExit(HttpSession session,ParticEvtDto dto) {
			LoginMemDto logindto =(LoginMemDto) session.getAttribute("LDto");
			dto.setMi_nck(logindto.getMi_nck());
			int n =e_service.watingEventOut(dto.getMi_nck());
			//return (n>0)?"redirect:/":"redirect:/";
		}




		/**
		 * <h2>이벤트 폐쇄</h2>
		 * @author 오종택
		 * @param 이벤트 아이디
		 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
		 */
		@RequestMapping(value = "/event/close", method = RequestMethod.POST)
		public String eventClose(Model model, int ef_id) {
			logger.info("이벤트 폐쇄 eventClose: {}", ef_id);

			e_service.eventClose(ef_id);

			return "redirect:/project/index";
		}

		/**
		 * <h2>이벤트 마감</h2>
		 * @author NAWA
		 * @param 이벤트 아이디
		 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
		 */
		@RequestMapping(value = "/event/end", method = RequestMethod.POST)
		public String eventEnd(int ef_id) {
			logger.info("이벤트 마감 eventEnd: {}", ef_id);
			boolean isc = e_service.eventEnd(ef_id);

			return isc?"redirect:/event/list":"redirect:/event/open";
		}

		/**
		 * <h2>이벤트 수정 페이지 이동</h2>
		 * @author 오종택
		 * @return 이벤트 수정 페이지
		 */
		@RequestMapping(value = "/event/modify", method = {RequestMethod.POST, RequestMethod.GET})
		public String eventModify(Model model, int ef_id, HttpSession session, String mi_nck) {
			logger.info("이벤트 수정 eventModify: {} \t {}", ef_id, mi_nck);

			LoginMemDto Ldto = (LoginMemDto)session.getAttribute("LDto");
			InformEvtDto dto =  e_service.eventDetail(ef_id);
			String eventCreateNick = e_service.eventNickFind(dto.getEf_id());	// ef_id에 맞는 개설자 닉네임을 가져오는 거
			
			// 2020-02-05 수정! 이벤트 조치사항 요약.txt 6번항목에 조치사항 적어놨음
			if(session.getAttribute("LDto") == null) {
				return "redirect:/form/login";
			}else {
				if(Ldto.getMi_nck().equalsIgnoreCase(eventCreateNick)) {
					PrivacyMemDto pdto = m_service.userInfo(Ldto.getMr_id());
					InformFileDto fdto = f_service.selectRfile(ef_id);
					model.addAttribute("dto", dto);
					model.addAttribute("mi", Ldto.getMi_nck());
					model.addAttribute("mi_nck", mi_nck);
					model.addAttribute("LDto", Ldto);
					model.addAttribute("email", pdto.getMr_email());
					model.addAttribute("phone", pdto.getMi_phone());
					model.addAttribute("fdto",fdto);
					return "event/eventModify";
				}else {
					return "redirect:/form/login";
				}
			}
		}


		/**
		 * <h2>이벤트 삭제</h2>
		 * @author 오종택
		 * @param 이벤트 아이디
		 * @return 성공여부 boolean(성공 : true &#47; 실패 : false)
		 */
		@RequestMapping(value = "/event/delete", method = RequestMethod.POST)
		public String eventDelete(int ef_id) {
			logger.info("이벤트 삭제 eventDelete: {}", ef_id);
			e_service.eventDelete(ef_id);

			return "redirect:/project/index";
		}

		/**
		 * <h2>이벤트 참가자 조회</h2>
		 * @author 오종택
		 * @param 이벤트 아이디
		 * @return 이벤트 참가자 리스트
		 */
		@RequestMapping(value = "/event/lineup", method = RequestMethod.POST)
		public String eventLineUp(Model model, int ef_id) {
			logger.info("이벤트 참가자 조회 eventLineUp: {}", ef_id);

			List<PartiSearchDto> list = e_service.eventLineUp(ef_id);
			System.out.println(list);
			model.addAttribute("list", list);

			return "event/eventLineUp";
		}	

	//------------------------------------------ NOTICE BOARD ------------------------------------------------//

	/**
	 * 공지사항 리스트
	 * 
	 * @author 신애정
	 * @param dto,ndto
	 * @return
	 */
	@RequestMapping(value = "/notice/list", method = {RequestMethod.GET,RequestMethod.POST})
	public String noticeList(Model model,PagingBrdDto dto,WriteBrdDto ndto) {
		logger.info("GeneralController.noticeList() {}",dto);

		//페이징 , 리스트
		List<WriteBrdDto> lists = n_service.selectPaging(dto);
		dto.setTotal(n_service.selectTotalPaging());
		model.addAttribute("lists",lists);
		model.addAttribute("paging",dto);
		
		// 공지사항 이미지 
	      List<List<InformFileDto>> flist = new ArrayList<List<InformFileDto>>();
	      for (int i = 0; i < lists.size(); i++) {
	         int nb_seq = lists.get(i).getNb_seq();
	         List<InformFileDto> fdto = f_service.selectNoticeFile(nb_seq);
	         flist.add(fdto);
	      }
	      System.out.println("공지사항 이미지 리스트 : "+flist);
	      model.addAttribute("flist",flist);
	      
		return "noticeboard/noticeboard";
	}

	/**
	 * 공지사항 상세보기
	 * 
	 * @author 신애정
	 * @param model
	 * @param seq
	 * @return
	 */
	@RequestMapping(value = "/notice/detail",method = RequestMethod.GET)
	public String noticedetail(Model model, String seq) {
		logger.info("/notice/detail \t{}",seq);
		WriteBrdDto dto = n_service.boardSelectOne(seq);

		int nb_seq = Integer.parseInt(seq);
		List<InformFileDto> fdto = f_service.selectNoticeFile(nb_seq);

		model.addAttribute("dto",dto);
		model.addAttribute("fdto",fdto);
		return "noticeboard/noticedetails";
	}

	/**
	    * 공지사항 글쓰기 폼 이동
	    * 
	    * @author 신애정
	    * @param 
	    * @return
	    */
	   @RequestMapping(value = "/notice/writeform",method = RequestMethod.GET)
	   public String writeform(HttpSession session) {

	      LoginMemDto ldto = (LoginMemDto)session.getAttribute("LDto");

	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            logger.info("GeneralController.writeform()");

	            return "noticeboard/noticewrite";

	         }else {
	            return "redirect:/";
	         }
	      }else {
	         return "/sign/login";
	      }
	   }

	   /**
	    * 공지사항 수정폼 이동
	    * @author 신애정
	    * @param seq
	    * @return
	    */
	   @RequestMapping(value = "/notice/modifyform",method = RequestMethod.GET)
	   public String modifyForm(Model model , String seq,HttpSession session) {

	      LoginMemDto ldto = (LoginMemDto)session.getAttribute("LDto");

	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            logger.info("/notice/modifyform \t{}",seq);
	            WriteBrdDto dto = n_service.boardSelectOne(seq);
	            model.addAttribute("dto", dto);
	            return "noticeboard/noticemodify";

	         }else {
	            return "redirect:/";
	         }
	      }else {
	         return "/sign/login";
	      }
	   }


	   /**
	    * 공지사항 삭제
	    * 
	    * @author 신애정
	    * @param seq
	    * @return
	    */
	   @RequestMapping(value = "/notice/delete",method = RequestMethod.GET)
	   public String del(String seq,HttpSession session) {

	      LoginMemDto ldto = (LoginMemDto)session.getAttribute("LDto");

	      if(ldto != null) {
	         if(ldto.getMr_auth().equalsIgnoreCase("A")) {
	            logger.info("/notice/delete \t{}",seq);
	            int n = n_service.deleteNotice(seq);
	            return (n>0)?"redirect:/notice/list":"main";

	         }else {
	            return "redirect:/";
	         }
	      }else {
	         return "/sign/login";
	      }
	   }

	
}
