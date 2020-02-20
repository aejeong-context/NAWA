<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>EVENT : LINEUP</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<link href="../resources/css/event.css"" rel="stylesheet">
</head>

<script src="../resources/js/paging.js"></script>

<body id="body" class="body-wrapper boxed-menu ">

   <div class="main-wrapper">
      <!-- HEADER -->
      <%@ include file="/WEB-INF/views/layout/header-white.jsp"%>
      <!-- MENU -->
      <section class="navbar-dashboard-area">
         <nav class="navbar navbar-default lightHeader navbar-dashboard"
            role="navigation">
            <div class="container">

               <!-- Brand and toggle get grouped for better mobile display -->
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse"
                     data-target=".navbar-dash">
                     <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                  </button>
               </div>

               <!-- Collect the nav links, forms, and other content for toggling -->
               <div class="collapse navbar-collapse navbar-dash">
                  <ul class="nav navbar-nav mr0">
                     <li class="active"><a href="../user/list">회원조회</a></li>
                     <li class=""><a href="../sign/logout">로그아웃</a></li>
                  </ul>
               </div>
            </div>
         </nav>
      </section>
      <!-- USERLIST SECTION -->
      <section class="clearfix bg-dark dashboardOrders">
         <div class="container">
            <div class="row">
               <div class="col-xs-12">
               <h2>이벤트 참가자 리스트</h2>
                  <div class="table-responsive bgAdd"
                     data-pattern="priority-columns">
                     <form action="../user/list" method="post" id='frmPaging'>
                        <table id="ordersTable"
                           class="table table-small-font table-bordered table-striped"
                           cellspacing="0" width="100%">
                           <thead>
                              <tr>
                                 <th>이름</th>
                                 <th>전화번호</th>
                                 <th>이메일</th>
                                 <th>참가자 권한</th>
                              </tr>
                           </thead>
                           <tbody>

                              <c:forEach var="dto" items="${list}" varStatus="vs">
                                 <tr>
                                    <td>${dto.mr_name}</td>
                                    <c:set var="phone" value="${dto.mi_phone}"/>
                                    <td>
                                    	${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,11)}
                                    </td>	
                                    <td>${dto.mr_email}</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${dto.ep_auth eq 'F' }">개설자</c:when>
                                    		<c:otherwise>참가자</c:otherwise>
                                    	</c:choose>
                                    </td>
                                 </tr>
                              </c:forEach>

                           </tbody>
                        </table>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- FOOTER -->
      <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
   </div>

   <!-- JAVASCRIPTS -->

   <script src="../resources/plugins/jquery/jquery.min.js"></script>
   <script src="../resources/plugins/jquery-ui/jquery-ui.min.js"></script>
   <script src="../resources/plugins/bootstrap/js/bootstrap.min.js"></script>
   <script src="../resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
   <script src="../resources/plugins/waypoints/waypoints.min.js"></script>
   <script src="../resources/plugins/counter-up/jquery.counterup.min.js"></script>
   <script
      src="../resources/plugins/datepicker/bootstrap-datepicker.js"></script>
   <script
      src="../resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
   <script src="../resources/plugins/owl-carousel/owl.carousel.min.js"></script>
   <script src="../resources/plugins/isotope/isotope.min.js"></script>
   <script src="../resources/plugins/fancybox/jquery.fancybox.min.js"></script>
   <script src="../resources/plugins/isotope/isotope-triger.min.js"></script>
   <script src="../resources/plugins/rateyo/jquery.rateyo.min.js"></script>

   <script src="../resources/js/app.js"></script>

</body>

</html>
