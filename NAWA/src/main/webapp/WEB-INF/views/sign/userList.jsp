<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>NAWA : UserList</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<link href="../resources/css/sign.css" rel="stylesheet">
</head>

<script src="../resources/js/pagingMem.js"></script>

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
						<div class="table-responsive bgAdd"
							data-pattern="priority-columns">
							<form action="../user/list" method="post" id='frmPaging'>
								<table id="ordersTable"
									class="table table-small-font table-bordered table-striped"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>ID</th>
											<th>NAME</th>
											<th>NICKNAME</th>
											<th>JOINED</th>
											<th>LOGIN-DATE</th>
											<th>DFL</th>
											<th>BAN</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="list" items="${lists}" varStatus="vs">
											<tr>
												<td><a href="../user/detail?id=${list.mr_id}"
													style="color: black;">${list.mr_id}</a></td>
												<td>${list.mr_name}</td>
												<td>${list.mi_nck}</td>
												<td><fmt:parseDate var="dateString"
														value="${list.mr_rgd}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
														value="${dateString}" pattern="yyyy.MM.dd" /></td>
												<td><fmt:parseDate var="dateString"
														value="${list.mr_visited}" pattern="yyyy-MM-dd HH:mm:ss" />
													<fmt:formatDate value="${dateString}"
														pattern="yyyy.MM.dd HH:mm:ss" /></td>
												<td><c:choose>
														<c:when test="${list.mr_dfl eq 'Y'}">
								탈퇴
							</c:when>
														<c:when test="${list.mr_dfl eq 'B'}">
								정지
							</c:when>
														<c:otherwise>
								사용중
							</c:otherwise>
													</c:choose>
												<td><c:choose>
														<c:when test="${list.mr_dfl eq 'Y'}">

														</c:when>
														<c:when test="${list.mr_dfl eq 'B'}">
															<div class="btn-group">
																<button type="button" class="btn btn-primary"
																	onclick="ban('${list.mr_id}')">Ban</button>
																<button type="button" class="btn btn-primary"
																	onclick="release('${list.mr_id}')">Release</button>
															</div>
														</c:when>
														<c:otherwise>
															<div class="btn-group">
																<button type="button" class="btn btn-primary"
																	onclick="ban('${list.mr_id}')">Ban</button>
																<button type="button" class="btn btn-primary"
																	onclick="release('${list.mr_id}')">Release</button>
															</div>
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>

								<!-- 5. paging view -->
								<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
								<input type='hidden' name='index' id='index' value='${paging.index}'> 
								<input type='hidden' name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'> 
								<input type='hidden' name='listCnt' id='listCnt' value='${paging.listCnt}'>
								<div class="center">
									<ul class="pagination">
										<!--맨 첫페이지 이동 -->
										<li><a href='#'
											onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>&laquo;</a></li>
										<!--이전 페이지 이동 -->
										<li><a href='#'
											onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>&lsaquo;</a></li>

										<!--페이지번호 -->
										<c:forEach var='i' begin="${paging.pageStartNum}"
											end="${paging.pageLastNum}" step="1">
											<li><a href='#' onclick='pageIndex(${i});'>${i}</a></li>
										</c:forEach>

										<!--다음 페이지 이동 -->
										<li><a href='#'
											onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>&rsaquo;</a></li>
										<!--마지막 페이지 이동 -->
										<li><a href='#'
											onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>&raquo;</a></li>
									</ul>
								</div>
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
		src="../resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script
		src="../resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="../resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="../resources/plugins/isotope/isotope.min.js"></script>
	<script src="../resources/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script src="../resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="../resources/plugins/rateyo/jquery.rateyo.min.js"></script>

	<script src="../resources/js/app.js"></script>
	<script type="text/javascript">
		function ban(id) {
			location.href = "../user/ban?id=" + id;
			alert("정지 하였습니다.");
		}

		function release(id) {
			location.href = "../user/release?id=" + id;
			alert("정지 해제 하였습니다.");
		}
	</script>

</body>

</html>

