<%@page import="com.min.app.dto.member.LoginMemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->

<header id="pageTop" class="header">

   <!-- TOP INFO BAR -->

   <div class="nav-wrapper navbarWhite">
      <!-- NAVBAR -->
      <nav id="menuBar" class="navbar navbar-default lightHeader animated "
         role="navigation">
         <div class="container">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse"
                  data-target=".navbar-ex1-collapse">
                  <span class="sr-only">Toggle navigation</span> <span
                     class="icon-bar"></span> <span class="icon-bar"></span> <span
                     class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="..">
               
                  <svg class="logo-svg" version="1.1" style="margin:10px 0px;" height="30px" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
    y="0px" viewBox="0 0 175.2 105.1" style="enable-background:new 0 0 175.2 105.1;" xml:space="preserve">
<path class="path-1" d="M147.1,6.1C139.8,2.2,131.5,0,122.6,0c-11,0-21.6,3.5-30.4,9.7c-1.6,1.1-3.2,2.4-4.7,3.7
   c-2.6,2.4-5.1,5-7.2,7.9l-35.1,51c-0.9,1.3-2.8,1.7-4.1,0.8c-1.3-0.9-1.7-2.8-0.8-4.1l35.1-51.1c2.2-3,4.7-5.7,7.3-8.1
   C74.1,3.5,63.5,0,52.5,0C23.6,0,0,23.6,0,52.5c0,17.6,8.7,33.1,22,42.6c8.6,6.2,19.2,9.9,30.6,9.9c11,0,21.6-3.5,30.4-9.7
   c1.6-1.1,3.2-2.4,4.7-3.7c2.6-2.4,5.1-5,7.2-7.9l35.1-51c0.9-1.3,2.8-1.7,4.1-0.8c1.3,0.9,1.7,2.8,0.8,4.1L99.6,87.2
   c-2.2,3-4.7,5.7-7.3,8.1c8.8,6.2,19.4,9.7,30.4,9.7c29,0,52.5-23.6,52.5-52.5C175.2,32.4,163.8,14.9,147.1,6.1z"/>
<path class="path-1" d="M45.3,72.3c-0.9,1.3-2.8,1.7-4.1,0.8c-1.3-0.9-1.7-2.8-0.8-4.1l35.1-51.1c2.2-3,4.7-5.7,7.3-8.1
   C74.1,3.5,63.5,0,52.5,0C23.6,0,0,23.6,0,52.5c0,17.6,8.7,33.1,22,42.6l18-24.5L22,95.2"/>
<path class="path-1" d="M129.9,32.8c0.9-1.3,2.8-1.7,4.1-0.8c1.3,0.9,1.7,2.8,0.8,4.1L99.6,87.2c-2.2,3-4.7,5.7-7.3,8.1
   c8.8,6.2,19.4,9.7,30.4,9.7c29,0,52.5-23.6,52.5-52.5c0-17.6-8.7-33.1-22-42.6l-18,24.5l18-24.5"/>
   </svg>
   
               </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
               <ul class="nav navbar-nav navbar-right">
                   <c:if test="${LDto ne null && LDto.mr_auth eq 'U'}">
                     <li class=""><a href="../event/create">이벤트 개설 </a></li>
                  </c:if>
                  
                  <li class=""><a href="../notice/list">공지사항 </a></li>
                  
                  <li class=" dropdown megaDropMenu"><a href="#"
                     class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">주제별 이벤트 <i
                        class="fa fa-angle-down" aria-hidden="true"></i></a>
                     <ul class="row dropdown-menu">
                        <li class="col-sm-4 col-xs-12">
                           <ul class="list-unstyled">
                              <li class="list-item-heading">수도권 이벤트</li>
                              <li><a href="../event/search">전체구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S19">송파구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S18">노원구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S10">강남구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S23">관악구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S11">강서구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S21">양천구</a></li>
                           </ul>
                        </li>
                         <li class="col-sm-4 col-xs-12">
                           <ul class="list-unstyled">
                              <li class="list-item-heading">수도권 이벤트</li>
                              <li><a href="../event/search?ef_lc=RE_S21">양천구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S17">성북구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S06">구로구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S16">서초구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S13">강동구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S04">동작구</a></li>
                              <li><a href="../event/search?ef_lc=RE_S09">중랑구</a></li>
                           </ul>
                        </li>
                        <li class="col-sm-4 col-xs-12">
                           <ul class="list-unstyled">
                              <li class="list-item-heading">카테고리별 이벤트</li>
                              <li><a href="../event/search?uc_id=NH_READER">인문학/책/글</a></li>
                              <li><a href="../event/search?uc_id=NH_LANGUAGE">외국/언어</a></li>
                              <li><a href="../event/search?uc_id=NH_CULTURE">문화/공연/축제</a></li>
                              <li><a href="../event/search?uc_id=NH_ANIMAL">반려동물</a></li>
                              <li><a href="../event/search?uc_id=NH_TRABEL">액티비티/여행</a></li>
                              <li><a href="../event/search?uc_id=NH_GAME">게임/오락</a></li>
                              <li><a href="../event/search?uc_id=NH_FREE">자유주제</a></li>
                           </ul>
                        </li>
                     </ul></li>
                     
                  <c:if test="${LDto ne null}">
                     <c:if test="${LDto.mr_auth eq 'U' }">
                     <li class=" dropdown singleDrop"><a href="#"
                        class="dropdown-toggle" data-toggle="dropdown" role="button"
                        aria-haspopup="true" aria-expanded="false">내 정보 <i
                           class="fa fa-angle-down" aria-hidden="true"></i></a>
                        <ul class="dropdown-menu">
                           <li><a href="../user/dashboard">대시보드</a></li>
                           <li><a href="#"
                              onclick="conChange('${LDto.mi_condition}');">참가상태 변경</a></li>
                           <li><a href="../sign/info">회원정보 변경</a></li>
                          <c:if test="${LDto.mr_platform ne 'K' and LDto.mr_platform ne 'G'}">
											<li><a href="../change/form">비밀번호 변경</a></li>
										</c:if>
                           <li><a href="../sign/logout">로그아웃</a></li>
                        </ul></li>
                     </c:if>
                     <c:if test="${LDto.mr_auth eq 'A'}">
                        <li class=" dropdown singleDrop"><a href="#"
                           class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">관리자 리스트 <i
                              class="fa fa-angle-down" aria-hidden="true"></i></a>
                           <ul class="dropdown-menu">
                              <li><a href="../user/list">회원조회</a></li>
                              <li><a href="../sign/logout">로그아웃</a></li>
                           </ul></li>
                     </c:if>
                  </c:if>
               </ul>
            </div>
            <c:choose>
               <c:when test="${LDto eq null}">
                  <a class="btn btn-default navbar-btn" href="../form/login"> +
                     <span><b>로그인하기</b></span> 
                  </a>
               </c:when>
               <c:otherwise>
                  <c:if test="${LDto.mi_condition eq 'O'}">
                     <a class="btn btn-default navbar-btn" href="#"> <span><b>
                              <span class="fa fa-circle-o" style="color: #41D87D;">ㅤ</span>${LDto.mi_nck }님
                        </b></span>
                     </a>
                  </c:if>
                  <c:if test="${LDto.mi_condition eq 'C'}">
                     <a class="btn btn-default navbar-btn" href="../sign/logout"> <span><b>
                     <span class="fa fa-circle-o" style="color: #9C3213;">ㅤ</span>${LDto.mi_nck }님
               </b></span>
            </a>
                  </c:if>
                  
               </c:otherwise>
            </c:choose>
         </div>
      </nav>
   </div>
</header>

<script>
function conChange(con){
   if (con=='O') {
   //허용이라면
   var cdt = confirm('현재 이벤트 [초대허용] 상태입니다. \n이벤트 [초대거부] 상태로 변경하시겠습니까?');
      if (cdt) {
         //거부로변경
         location.href = '../state/apply?mi_condition=C';
      }
   }else{
   //거부라면
      var cdt = confirm('현재 이벤트 [초대거부] 상태입니다. \n이벤트 [초대허용] 상태로 변경하시겠습니까?');
      if (cdt) {
         //허용로변경
         location.href = '../state/apply?mi_condition=O';
      }
   }
}
</script>