<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>NAWA : SignUp</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
</head>
<body id="body" class="body-wrapper boxed-menu ">

	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>

		<!-- PROCESS SECTION -->
		<section class="clearfix processSection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="processArea">
							<form class="loginForm" action="../sign/second" method="post"
								id="frm" name="frm">
								<input type="hidden" id="chkval" value="0"> <input
									type="hidden" id="mailval" value="0">
								<ul class="list-inline">
									<li>
										<h2>회원정보</h2>
										<div class="form-group">
											<input type="text" class="form-control" id="id" name="mr_id"
												placeholder="아이디" required="required">
										</div>
										<div class="form-group">
											<input type="password" class="form-control" id="pw"
												name="mr_pw" placeholder="비밀번호 (특수문자, 영문자, 숫자 포함)"
												required="required">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="name"
												name="mr_name" placeholder="성함" required="required">
										</div>
										<hr />
										<h2>이메일 인증</h2>

										<div class="row">
											<div class="col-sm-8 col-xs-12">
												<div class="form-group">
													<input type="text" class="form-control" id="email"
														name="mr_email" placeholder="인증받을 이메일 주소"
														required="required">
												</div>
											</div>
											<div class="col-sm-4 col-xs-12">
												<div class="form-group mgnBtm0">
													<button type="button" style="width: 100%"
														class="btn btn-primary" id="emailBtn" disabled="disabled">전송</button>
												</div>
											</div>
										</div> <br />
										<div class="form-group">
											<input type="text" class="form-control" id='emailAuth'
												name='emailAuth' placeholder="인증코드" required="required"
												readonly="readonly">
											<div id="emailCode"></div>
										</div>


									</li>
									<li>
										<h2>이용약관</h2>
										<div class="gg"
											style="height: 362px; display: inline-block; overflow: auto;">
											<dl>
												<dt>
													<strong>개인정보보호법 제15조(개인정보의 수집·이용)에 의거 홈페이지 회원가입을
														위한 개인정보를 다음과 같이 수집·이용하고자 합니다.</strong>
												</dt>
												<dd>
													이메일을 정확히 써주세요(비밀번호찾기, 이메일 인증이 필요합니다.)<br /> <br />
												</dd>
												<dt>
													<strong>[개인정보 보유 및 이용기간]</strong>
												</dt>
												<dd>귀하께서 입력하신 개인정보는 6년간 보유되며, 회원 탈퇴시 개인정보는 6개월 이후
													삭제됩니다.</dd>
												<dd>재가입은 6개월 이후 가능합니다.</dd>
												<dd>
													다만, 탈퇴자의 아이디는 동일한 아이디의 중복 가입을 방지하기 위해 보존하며, 기타 관계법령의 규정에
													의하여 보존할 필요가 있는 경우 관계법령에 따릅니다.<br /> <br />
												</dd>
												<dt>
													<strong>[개인정보 수집·이용에 대한 동의를 거부할 권리]</strong>
												</dt>
												<dd>필수항목의 경우 회원 가입 시 필요한 항목으로 동의 거부 시 회원가입이 제한되며, 선택
													항목은 동의하지 않아도 회원가입 및 서비스 거부를 하지 않습니다.(선택항목에 대하여 차후에 회원정보수정을
													통하여 정보를 입력할 수 있으며 입력된 항목은 동의를 한 것으로 간주 합니다.)</dd>
											</dl>
										</div>
										<div class="checkbox">
											<label for="i_agree2"> <input type="checkbox"
												id="i_agree2" name="i_agree2" required="required"><strong>(필수)</strong>
												개인정보 수집 및 이용안내
											</label>
										</div>
										<div class="form-group mgnBtm0">
											<button type="button" style="width: 100%"
												class="btn btn-primary" onclick="check()">다음</button>
										</div>

									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="random" value="${random}">
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
function check(){
	var frm = document.getElementById("frm");
	var i_agree2 = document.getElementById("i_agree2").checked; //동의 체크값
		
	jQuery.ajax({
		type:"get",
		url:"../emailAuth.do",
		data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
		asyn : true,
		success:function(data){
			if(data=="complete"){
				alert("인증이 완료되었습니다.");
				$("#mailval").val("1");

				if(i_agree2 == false){
					alert("개인정보 수집동의 해주세요");
					return false;
				}else{
					frm.submit();
				}
				
			}else if(data == "false"){
				alert("인증번호를 잘못 입력하셨습니다.");
			}
		},
		error:function(data){
			alert("에러가 발생했습니다.");
		}
	});
}


$(document).ready(function(){
	
	//아이디 체크
	$("#id").keyup(function(){
		var inputLength = $(this).val().length;
		var id ="";
		var idReg = /^[a-z]+[a-z0-9_.]{7,17}$/g;

		id = $(this).val();
		if(id.indexOf(" ") != -1){
			$("#idcheck").remove();
			$("#id").before("<i class='fa fa-times' id='idcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}else if(idReg.test($("input[name=mr_id]").val())){
			jQuery.ajax({
				type : "post",
				url : "../check/id",
				data : "id="+$(this).val(),
				asyn : true,
				success : function(msg){
					if(msg.isc=="true"){
						if(inputLength < 8 || inputLength > 16){
							$("#idcheck").remove();
							$("#id").before("<i class='fa fa-times' id='idcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
						}else{
							$("#idcheck").remove();
							$("#id").before("<i class='fa fa-check' id='idcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
						}
					}else{
						$("#idcheck").remove();
						$("#id").before("<i class='fa fa-times' id='idcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
					}
				},
				error: function(){
					alert("잘못된 요청값 입니다");
 				}
			});
		}else{
			$("#idcheck").remove();
			$("#id").before("<i class='fa fa-times' id='idcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}
		
		if(id==''){
			$("#idcheck").remove();
		}

	});
	
	//비밀번호 체크
	$("#pw").keyup(function(){
		var inputLength = $(this).val().length;
		var pw ="";
		var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^_])[A-Za-z\d!@#$^_]{8,16}$/;

		pw = $(this).val();
		if(inputLength < 8 || inputLength > 16){
			// 안될때
			$("#pwcheck").remove();
			$("#pw").before("<i class='fa fa-times' id='pwcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}else if(pw.indexOf(" ") != -1){
			// 안될때
			$("#pwcheck").remove();
			$("#pw").before("<i class='fa fa-times' id='pwcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}else if(pwReg.test($("input[name=mr_pw]").val())){
			// 될때
			$("#pwcheck").remove();
			$("#pw").before("<i class='fa fa-check' id='pwcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
		}else{
			// 안될떄
			$("#pwcheck").remove();
			$("#pw").before("<i class='fa fa-times' id='pwcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}
		
		if (pw=='') {
			$("#pwcheck").remove();
		}

	});
	
	//이메일체크
	$("#email").keyup(function(){
		var inputLength = $(this).val().length;
		var email ="";
		var emailReg =  /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g

		email = $(this).val();
		if(email.indexOf(" ") != -1){
			// x
			$( "#emailBtn" ).prop( "disabled", true );
			$("#mailcheck").remove();
			$("#email").before("<i class='fa fa-times' id='mailcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}else if(emailReg.test($("input[name=mr_email]").val())){
			jQuery.ajax({
				type : "post",
				url : "../check/mail",
				data : "email="+$(this).val(),
				asyn : true,
				success : function(msg){
					if(msg.isc=="true"){
						// o 
						$( "#emailBtn" ).prop( "disabled", false );
						$("#mailcheck").remove();
						$("#email").before("<i class='fa fa-check' id='mailcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
					}else{
						// x
						$( "#emailBtn" ).prop( "disabled", true );
						$("#mailcheck").remove();
						$("#email").before("<i class='fa fa-times' id='mailcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
					}
					
				},
				error: function(){
					$( "#emailBtn" ).prop( "disabled", true );
					alert("잘못된 요청값 입니다");
				}
			});
		}else{
			// x
			$( "#emailBtn" ).prop( "disabled", true );
			$("#mailcheck").remove();
			$("#email").before("<i class='fa fa-times' id='mailcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}
		
		if (email=='') {
			//x
			$("#mailcheck").remove();
		}

	});
	
	//이름 정규식
	$("#name").keyup(function(){
		var inputLength = $(this).val().length;
		var name ="";
		var nameReg =  /^[가-힣a-zA-Z]+$/;
		name = $(this).val();
		if(name.indexOf(" ") != -1){
			// 안될 때
			$("#namecheck").remove();
			$("#name").before("<i class='fa fa-times' id='namecheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}else if(nameReg.test($("input[name=mr_name]").val())){
			if(inputLength < 2 || inputLength > 20){
				// 안될 때
				$("#namecheck").remove();
				$("#name").before("<i class='fa fa-times' id='namecheck' aria-hidden='true' style='color: #FD4000;'></i> ");
			}else{
				// 될때
				$("#namecheck").remove();
				$("#name").before("<i class='fa fa-check' id='namecheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
			}
		}else{
			// 안될때 
			$("#namecheck").remove();
			$("#name").before("<i class='fa fa-times' id='namecheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}
		
		if (name=='') {
			$("#namecheck").remove();
		}
	});
	
	//이메일인증
	$(document).on("click", "#emailBtn", function(){
		jQuery.ajax({
			type:"get",
			url : "../createEmailCheck.do",
			data : "userEmail=" + $("#email").val()+ "&random=" + $("#random").val(),
			asyn : true,
			success : function(data){
				alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
				$( "#emailAuth" ).prop( "readonly", false );
				
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		})
	})
	
});
	
</script>
</body>

</html>

