<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- SITE TITTLE -->
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<title>NAWA : LOGIN</title>

</head>
<script src="https://apis.google.com/js/platform.js?onload=init"></script>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			loginCheck();
		}
	}

	//로그인체크
	function loginCheck() {
		var id = document.getElementById("userName").value;
		var pw = document.getElementById("userPassword").value;
		var frm = document.forms[0];

		var result = "";

		if (id == null || id.trim() == "") {
			document.getElementById("userName").focus();
			$("#userName").val("");
			alert("아이디를 입력해 주세요");

		} else if (pw == null || pw.trim() == "") {
			document.getElementById("userPassword").focus();
			$("#userPassword").val("");
			alert("비밀번호를 입력해 주세요");
		} else {
			frm.action = "../sign/login";
			$.ajax({
				type : "POST",
				url : "../login/Check",
				data : "mr_id=" + id + "&mr_pw=" + pw,
				asyn : false,
				success : function(msg) {
					if (msg.isc == "정지") {
						alert("정지된 아이디 입니다.");
					} else if (msg.isc == "탈퇴") {
						alert("탈퇴한 아이디 입니다.");
					} else if (msg.isc == "사용") {
						alert("로그인 성공입니다.");
						frm.submit();
					} else {
						alert("아이디, 비밀번호를 확인 해주세요");
					}
				},
				error : function() {
					alert("아이디, 비밀번호를 확인 해주세요");
				}
			});
		}
	}
	
	function init() {
		gapi.load('auth2',function() {
			var gauth = gapi.auth2.init({
										client_id : '560443569372-41hblomaaq28umrvvls5otbbve2voc14.apps.googleusercontent.com',
										scope : 'profile'
										});

			gauth.then(function() {
							console.log('init success'); }, function() {
								console.error('init fall');
							});
			gauth.signIn().then(function(response) {
										var googleUser=gauth.currentUser.get();
										var profile = googleUser.getBasicProfile();
										var form = document.getElementsByTagName("form")[0];
										var action="../google/login?" + "id=" + profile.getId()
										+ "&name=" + profile.getName() + "&email="
										+ profile.getEmail();
										form.action=action;
										form.method = "post";
										form.submit();
										
										var auth2=gapi.auth2.getAuthInstance();
										auth2.disconnect();
									});
			});

	}
</script>
<body id="body" class="body-wrapper boxed-menu ">

	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>

		<!-- LOGIN SECTION -->
		<section class="clearfix loginSection">
			<div class="container">
				<div class="row">
					<div class="center-block col-md-5 col-sm-6 col-xs-12">
						<div class="panel panel-default loginPanel">
							<div class="panel-heading text-center">Members login</div>
							<div class="panel-body">
								<form class="loginForm" method="post">
									<input type="hidden" id="loginChk" name="auth" value="0">
									<div class="form-group">
										<label for="userName">User ID *</label> <input type="text"
											class="form-control" name="mr_id" id="userName"
											required="required">
										<!-- 										<p class="help-block">아이디를 입력해주세요.</p> -->
									</div>
									<div class="form-group">
										<label for="userPassword">Password *</label> <input
											type="password" class="form-control" onkeyup="enterkey()"
											id="userPassword" name="mr_pw" required="required">
										<!-- 										<p class="help-block">비밀번호를 입력해주세요</p> -->
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-primary pull-left"
											onclick="loginCheck()">Login
											</button>
											<a
												href="https://kauth.kakao.com/oauth/authorize?client_id=242d7e23fd86fcbe35c087232698ec28&redirect_uri=http://naw.kr/kakao/login&response_type=code">
												<img src="../resources/img/kakao_02.png" style="margin-top: 5px;">
											</a>
										<div onclick="init()" style="cursor: pointer; width:300px; height:55px; margin-top: 5px;">
											<img src="../resources/img/google_02.png">
										</div>
										<a href="../reset/form" class="pull-right link">비밀번호를
											잊으셨나요?</a>
									</div>
								</form>
							</div>
							<div class="panel-footer text-center">
								<p>
									<a href="../sign/first" class="link">아직 회원이 아니신가요?</a>
								</p>
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

