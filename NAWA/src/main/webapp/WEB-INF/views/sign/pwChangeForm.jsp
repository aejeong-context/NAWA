<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- SITE TITTLE -->
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<title>NAWA : Pw Update</title>
<link href="../resources/css/sign.css" rel="stylesheet">

</head>
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
							<li><a href="../user/dashboard">대시보드</a></li>
							<li><a href="#" onclick="conChange('${LDto.mi_condition}');">참가상태
									변경</a></li>
							<li><a href="../sign/info">회원정보 변경</a></li>
							<li class="active"><a href="../change/form" class="scrolling"> 비밀번호 변경</a>
							</li>
							<li class=""><a href="../sign/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</section>

		<!-- PASSWORD CHANGE SECTION -->
		<section class="clearfix loginSection">
			<div class="container">
				<div class="row">
					<div class="center-block col-md-6 col-sm-6 col-xs-12">
						<div class="panel panel-default loginPanel">
							<div class="panel-heading text-center">비밀번호 변경</div>
							<div class="panel-body">
								<form id="frm" class="loginForm" method="post" action="../change/apply">
									<input type="hidden" id="loginChk" name="auth" value="0">
									<label for="newPassword">새 비밀번호</label><br />
									<div class="form-group">
										<input type="hidden" id="id" name="mr_id" value="${dto.mr_id}">
										<input type="password" class="form-control" id="pw"
											name="mr_pw" placeholder="비밀번호 (특수문자, 영문자, 숫자 포함)"
											required="required">
									</div>
									<label for="confirmPassword">새 비밀번호 확인</label>
									<div class="form-group">
										<input type="password" class="form-control" id="pwC"
											name="mr_pwCheck" placeholder="비밀번호 (특수문자, 영문자, 숫자 포함)"
											required="required">
									</div>
									<div class="form-group button3">
										<button type="button" class="btn btn-primary" style="background-color: #ffa019; color:white; font-family: 'Poppins', sans-serif;"
											onclick="changeApply()">변경하기</button>
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
	<script type="text/javascript">

		
		$(document).ready(function(){
			//비밀번호 체크
			$("#pw").keyup(function(){
				var inputLength = $(this).val().length;
				var pw ="";
				var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^_])[A-Za-z\d!@#$^_]{8,16}$/;

				pw = $(this).val();
				if(inputLength < 8 || inputLength > 16){
					// 안될때
					$("#pwcheck").remove();
					$("#pw").after("<i class='fa fa-times' id='pwcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}else if(pw.indexOf(" ") != -1){
					// 안될때
					$("#pwcheck").remove();
					$("#pw").after("<i class='fa fa-times' id='pwcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}else if(pwReg.test($("input[name=mr_pw]").val())){
					// 될때
					$("#pwcheck").remove();
					$("#pw").after("<i class='fa fa-check' id='pwcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
				}else{
					// 안될때
					$("#pwcheck").remove();
					$("#pw").after("<i class='fa fa-times' id='pwcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}
				
				if (pw=='') {
					$("#pwcheck").remove();
				}

			});
			//비밀번호 확인체크
			$("input[name=mr_pwCheck]").keyup(function(){
				var inputLength = $(this).val().length;
				var pw ="";
				var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^_])[A-Za-z\d!@#$^_]{8,16}$/;

				pw = $(this).val();
				if(inputLength < 8 || inputLength > 16){
					// 안될때
					$("#pwCcheck").remove();
					$("#pwC").after("<i class='fa fa-times' id='pwCcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}else if(pw.indexOf(" ") != -1){
					// 안될때
					$("#pwCcheck").remove();
					$("#pwC").after("<i class='fa fa-times' id='pwCcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}else if(pwReg.test($("input[name=mr_pw]").val())){
					// 될때
					$("#pwCcheck").remove();
					$("#pwC").after("<i class='fa fa-check' id='pwCcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
				}else{
					// 안될떄
					$("#pwCcheck").remove();
					$("#pwC").after("<i class='fa fa-times' id='pwCcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}
				
				if (pw=='') {
					$("#pwCcheck").remove();
				}

			});
		});
		
		function changeApply(){
			if($("input[name=mr_pw]").val() == $("input[name=mr_pwCheck]").val() ){
				frm.submit();
				alert("비밀번호가 변경 되었습니다.");
			}else{
				alert("비밀번호가 같지 않습니다.");
			}
			
		}
	
</script>
</body>

</html>

