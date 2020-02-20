<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>PROJECT : NAWA</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
</head>
<body id="body" class="body-wrapper boxed-menu">

	<div class="main-wrapper">
		<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		
		<!-- PAGE TITLE SECTION -->
		<section class="clearfix pageTitleSection bg-image"
			style="background-image: url(../resources/img/background/bg-page-title.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="pageTitle">
							<h2>상세보기</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- BLOG DETAILS -->
		<section class="clearfix blogDetials">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-xs-12">
						<div class="thumbnail blogContent">
							<div class="caption">
								<h4>
									${dto.nb_rgd} <a href="#">Admin</a>
								</h4>
								<h3>${dto.nb_title}</h3>
								<c:forEach items="${fdto}" var="fdto">
									<img src="../upload/${fdto.fi_storedname}"><br>
								</c:forEach>
								
								${dto.nb_con}

							</div>
						</div>
						
					</div>
				</div>
			
			</div>
			
		</section>
		</div>
		
		<!-- FOOTER -->
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

		<!-- JAVASCRIPTS -->
		<script src="../resources/plugins/jquery/jquery.min.js"></script>
		<script src="../resources/plugins/jquery-ui/jquery-ui.min.js"></script>
		<script src="../resources/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="../resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
		<script src="../resources/plugins/waypoints/waypoints.min.js"></script>
		<script src="../resources/plugins/counter-up/jquery.counterup.min.js"></script>
		<script src="../resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
		<script src="../resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="../resources/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script src="../resources/plugins/isotope/isotope.min.js"></script>
		<script src="../resources/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="../resources/plugins/isotope/isotope-triger.min.js"></script>
		<script src="../resources/plugins/rateyo/jquery.rateyo.min.js"></script>

		<script src="../resources/js/app.js"></script>
</body>

</html>

