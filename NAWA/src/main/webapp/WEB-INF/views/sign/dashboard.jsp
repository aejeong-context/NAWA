<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NAWA : DashBoard</title>
<style type="text/css">
.plr{
 	height: 400px; 
 	overflow: auto; 
}
</style>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
</head>
<body id="body" class="body-wrapper boxed-menu">
	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>

		<!-- Dashboard header -->
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
							<li class="active"><a href="../user/dashboard">대시보드</a></li>
							<li><a href="#" onclick="conChange('${LDto.mi_condition}');">참가상태
									변경</a></li>
							<li><a href="../sign/info">회원정보 변경</a></li>
							<li><a href="../change/form" class="scrolling"> 비밀번호 변경</a>
							</li>
							<li class=""><a href="../sign/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</section>

		<!-- Dashboard breadcrumb section -->
		<div class="section dashboard-breadcrumb-section bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<h2>Dashboard</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- DASHBOARD SECTION -->
		<section class="clearfix bg-dark equalHeight dashboardSection">
			<div class="container">

				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<div class="panel panel-default panel-card">
							<div class="panel-heading">
								초대받은 이벤트 <span class="label label-primary">${inviteCount}개</span>
							</div>
							<div class="panel-body plr">
								<ul class="list-unstyled panel-list">
									<c:choose>
										<c:when test="${empty ilists}">
											<li>
											<div class="listWrapper">
												<div class="listName">
													<h3>
														-<small></small>
													</h3>
												</div>
												<div class="listResult">
													<ul class="list-inline rating">
														<li></li>
													</ul>
												</div>
											</div>
										</li>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${ilists}" varStatus="vs">
											<li>
												<div class="listWrapper">
													<div class="listName">
														<h3>
															<a href="../event/detail?ef_id=${list.ef_id }">${list.ef_title}<small>${list.ef_lc }</small></a>
														</h3>
													</div>
													<div class="listResult">
														<ul class="list-inline rating">
															<li>/전체${list.ef_num_cnt }명</li>
														</ul>
														
														<span class="likeResult">개설일: <strong> <fmt:parseDate
																	var="dateString" value="${list.ef_rgd}"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${dateString}" pattern="yyyy-MM-dd" /></strong></span>
													</div>
												</div>
											</li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="panel panel-default panel-card">
							<div class="panel-heading">
								진행중인 이벤트 <span class="label label-primary">${openCount}개</span>
							</div>
							<div class="panel-body plr">
								<ul class="list-unstyled panel-list">
									<c:choose>
										<c:when test="${empty olists}">
											<li>
											<div class="listWrapper">
												<div class="listName">
													<h3>
														-<small></small>
													</h3>
												</div>
												<div class="listResult">
													<ul class="list-inline rating">
														<li></li>
													</ul>
												</div>
											</div>
										</li>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${olists}" varStatus="vs">
											<li>
												<div class="listWrapper">
													<div class="listName">
														<h3>
															<a href="../event/detail?ef_id=${list.ef_id }">${list.ef_title}<small>${list.ef_lc }</small></a>
														</h3>
													</div>
													<div class="listResult">
														<ul class="list-inline rating">
															<li>현재${list.attend_num }명/전체${list.ef_num_cnt }명</li>
														</ul>
														<span class="likeResult">개설일: <strong> <fmt:parseDate
																	var="dateString" value="${list.ef_rgd}"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${dateString}" pattern="yyyy-MM-dd" /></strong></span>
													</div>
												</div>
											</li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="panel panel-default panel-card">
							<div class="panel-heading">
								마감된 이벤트 <span class="label label-primary">${closeCount}개</span>
							</div>
							<div class="panel-body plr">
								<ul class="list-unstyled panel-list">
									<c:choose>
										<c:when test="${empty clists}">
											<li>
											<div class="listWrapper">
												<div class="listName">
													<h3>
														-<small></small>
													</h3>
												</div>
												<div class="listResult">
													<ul class="list-inline rating">
														<li></li>
													</ul>
												</div>
											</div>
										</li>
										</c:when>
										<c:otherwise>
											<li>
											<c:forEach var="list" items="${clists}" varStatus="vs">
												<div class="listWrapper">
													<div class="listName">
														<h3>
															<a href="../event/detail?ef_id=${list.ef_id }">${list.ef_title}<small>${list.ef_lc }</small></a>
														</h3>
													</div>
													<div class="listResult">
														<ul class="list-inline rating">
															<li>/전체${list.ef_num_cnt }명</li>
														</ul>
														<span class="likeResult">마감일: <strong> <fmt:parseDate
																	var="dateString" value="${list.ef_deadline}"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${dateString}" pattern="yyyy-MM-dd" /></strong></span>
													</div>
												</div>
											</c:forEach>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
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
		src="../resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
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