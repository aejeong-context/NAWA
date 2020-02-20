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
										<input type="hidden" id="id" name="mr_id" value="${mr_id}" readonly="readonly">
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
	window.onload  = function() {
		if(${er} == 1){
			alert("만료된 페이지 입니다.");
			self.close();
		}
	}
	
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
					// 안될떄
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
					$("#pwC").before("<i class='fa fa-times' id='pwCcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}else if(pw.indexOf(" ") != -1){
					// 안될때
					$("#pwCcheck").remove();
					$("#pwC").before("<i class='fa fa-times' id='pwCcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
				}else if(pwReg.test($("input[name=mr_pw]").val())){
					// 될때
					$("#pwCcheck").remove();
					$("#pwC").before("<i class='fa fa-check' id='pwCcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
				}else{
					// 안될떄
					$("#pwCcheck").remove();
					$("#pwC").before("<i class='fa fa-times' id='pwCcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
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
				self.close();
			}else{
				alert("비밀번호가 같지 않습니다.");
			}
			
		}
</script>
</body>

</html>

