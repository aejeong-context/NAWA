<%@page import="com.min.app.dto.member.PrivacyMemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>NAWA : UserDetail</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<style type="text/css">
input[type=checkbox]+label {
	width: 48%;
	color: #bbb;
	font-size: 10pt;
	padding: 7px 17px 5px 17px;
}

input[type=checkbox]:checked+label {
	width: 48%;
	color: orange;
	font-size: 10pt;
	border: 1px solid orange;
	padding: 6px 16px 4px 16px;
	font-weight: bolder;
	color: orange;
}

input[type=checkbox] {
	display: none;
}

.box {
    position: absolute;
    width: 150px; 
    height: 150px; 
    overflow: hidden;
    border-radius: 70%;
    border: 0.5px solid gray;
    vertical-align:middle;
    align-content: center;
    float: left;
    left: 30%;
    top:4%;
    
}
.profile {
   width: 150px; height: 150px;
    object-fit: cover;
    object-position: top;
}
</style>
</head>
<%
	PrivacyMemDto pDto = (PrivacyMemDto) request.getAttribute("pDto");
%>

<body id="body" class="body-wrapper boxed-menu ">

	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>
		<!-- MENU BAR-->
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
		
		<!-- USERDETAIL SECTION -->
		<section class="clearfix bg-dark profileSection">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-12">
						<div class="profile_area">
							<div class="box">
								<img src="../upload/${fdto.fi_storedname}" class="profile">
							</div>
						</div>
						<div class="dashboardBoxBg mb30">
							<div class="profileUserInfo bt profileName" style="margin-top: 150px;">
								<p>Your Current Plan</p>
								<h5>
									Sign Date: <span>${ddto.mr_rgd }</span>
								</h5>
								<h5>
									Visited Date: <span>${ddto.mr_visited }</span>
								</h5>
								<a href="#" class="btn btn-primary">Change</a>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-sm-7 col-xs-12">
						<form>
							<div class="dashboardBoxBg">
								<div class="profileIntro">
									<h2>${ddto.mr_id }</h2>
								</div>
							</div>
							<div class="dashboardBoxBg mt30">
								<div class="profileIntro">
									<h3>About You</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="name">Name</label> <input type="text"
												class="form-control" id="name"
												placeholder="${ddto.mr_name }">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="nick">Nick Name</label> <input
												type="text" class="form-control" id="nick"
												placeholder="${ddto.mi_nck }">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="email">Email</label> <input type="text"
												class="form-control" id="email"
												placeholder="${ddto.mr_email }">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="phone">Phone</label> <input type="text"
												class="form-control" id="phone"
												placeholder="${ddto.mi_phone }">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="location">Location</label> <input type="text"
												class="form-control" id="location"
												placeholder="${ddto.mi_lc }">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="interest">Interest</label> <input type="text"
												class="form-control" id="interest"
												placeholder="${ddto.mi_interest }">
										</div>

									</div>
								</div>
							</div>
							<div class="dashboardBoxBg mt30">
								<div class="profileIntro">
									<h3>Event</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="attendCnt">Attend Count</label> <input type="text"
												class="form-control" id="attendCnt"
												placeholder="${ddto.mi_attend_cnt }">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="openCnt">Open Count</label> <input
												type="text" class="form-control" id="openCnt"
												placeholder="${ddto.mi_open_cnt }">
										</div>
									</div>
								</div>
							</div>
						</form>
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

