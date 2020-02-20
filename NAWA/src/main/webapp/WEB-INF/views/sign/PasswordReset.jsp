<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- SITE TITTLE -->
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<title>NAWA : SEARCH</title>

</head>
<script type="text/javascript">
	function searchCheck() {
		var id = document.getElementById("InputId").value;
		var email = document.getElementById("InputEmail").value;
		var frm = document.forms[0];

		var result = "";

		if (id == null || id.trim() == "") {
			document.getElementById("InputId").focus();
			$("#InputId").val("");
			alert("아이디를 입력해 주세요");
		} else if (email == null || email.trim() == "") {
			document.getElementById("InputEmail").focus();
			$("#InputEmail").val("");
			alert("이메일을 입력해 주세요");
		} else {
			$.ajax({
				type : "post",
				url : "../pwReset/Check",
				data : "mr_id=" + id + "&mr_email=" + email,
				asyn : false,
				success : function(msg) {
					if (msg.isc == "통과") {
						frm.action = "../pw/EmailSend";
						frm.submit();
						alert("메일을 발송하였습니다.");
					} else {
						alert(msg.isc);
						alert("아이디, 이메일을 확인 해주세요");
					}
				},
				error : function() {
					alert("아이디, 이메일를 확인 해주세요");
				}
			});
		}
	}
</script>
<body id="body" class="body-wrapper boxed-menu ">

	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>
		
		<!-- MENU BAR -->
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
							<li><a href="#"
								onclick="conChange('${LDto.mi_condition}');">참가상태 변경</a></li>
							<li><a href="../sign/info">회원정보 변경</a></li>
							<li><a href="../change/form" class="scrolling"> 비밀번호 변경</a>
							</li>
							<li class=""><a href="../sign/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</section>
		<!-- PASSWORD CHANGE INFO CHECK SECTION -->
		<section class="clearfix loginSection">
			<div class="container">
				<div class="row">
					<div class="center-block col-md-5 col-sm-6 col-xs-12">
						<div class="panel panel-default loginPanel">
							<div class="panel-heading text-center">비밀번호 재설정</div>
							<div class="panel-body">
								<form class="loginForm" method="post" action="../pw/reset">
									<input type="hidden" id="loginChk" name="auth" value="0">
									<div class="form-group">
										<label for="userName">User ID *</label> <input type="text"
											class="form-control" name="mr_id" id="InputId"
											required="required">
										<!-- 										<p class="help-block">아이디를 입력해주세요.</p> -->
									</div>
									<div class="form-group">
										<label for="userPassword">Email *</label> <input type="text"
											class="form-control" onkeyup="enterkey()" id="InputEmail"
											name="mr_email" required="required">
										<!-- 										<p class="help-block">이메일을 입력해주세요</p> -->
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-primary pull-left"
											onclick="searchCheck()">확인</button>
									</div>
								</form>
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

