<%@page import="com.min.app.dto.member.PrivacyMemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>NAWA : Info Update</title>
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

#hrSun{
	margin-top: 62px;
	margin-bottom: 20px;
}

#input{
	float: right;

}
#withdrawal{
	float: right;
}

.box {
    position: relative; 
    width: 100px; 
    height: 100px; 
    overflow: hidden;
    border-radius: 70%;
    border: 1px solid gray;
    float: left;

}
.profile {
 	width: 100px; height: 100px;
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
							<li class="active"><a href="../sign/info">회원정보 변경</a></li>
							<li><a href="../change/form" class="scrolling"> 비밀번호 변경</a>
							</li>
							<li class=""><a href="../sign/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</section>
		<!-- PROCESS SECTION -->
		<section class="clearfix processSection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="processArea">
							<form class="loginForm" action="../sign/update" method="post" enctype="multipart/form-data"
								id="frm" name="frm">
								<input type="hidden" id="mailval" value="0">
								<ul class="list-inline">
									<li>
										<div style="height: 180px;">
										<h2>프로필</h2>
										<div class="form-group">
										<div id="image">
										<div class="box">
											<img id="preview" src="../upload/${fdto.fi_storedname}" class="profile">
										</div>	
											<input type="hidden" name="fi_seq" value="${fdto.fi_seq}">
											<input type="hidden" name="decide" id="decide">
											<div id="input">
											<input type="file" id="file" name="file" onchange="showPreview(this)"><br>
											<a id="reset">취소</a>
											</div>	
										</div>
										</div>
										</div>
									
										<h2>활동정보</h2> <input type="hidden" name="mr_id"
										value="${pDto.mr_id}">
										<div class="form-group">
											<input type="text" class="form-control" id="nick"
												name="mi_nck" placeholder="닉네임(필수)" required="required"
												value="${pDto.mi_nck}">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="phone"
												name="mi_phone" placeholder="연락처(필수)" required="required"
												value="${pDto.mi_phone}">
										</div>
										<hr />
										<h2>이메일 변경</h2>

										<div class="row">
											<div class="col-sm-8 col-xs-12">
												<div class="form-group">
													<input type="text" class="form-control" id="email"
														name="mr_email" placeholder="인증받을 이메일 주소"
														required="required" value="${pDto.mr_email }">
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
										<h2>지역</h2>
										<div class="form-group" style="padding-bottom: 8px;">
											<select name="mi_lc1" id="sido1" class="col-sm-4 col-xs-12"
												style="border: 1px solid #e4e4e4; padding: 4px 10px;"></select>
											 <select name="mi_lc" id="gugun1" class="col-sm-8 col-xs-12"
												style="border: 1px solid #e3e3e3; padding: 4px 10px;"></select>
										</div>
										<hr />
										<h2>취미</h2>
										<div class="form-group">
											<input type="checkbox" id="ossm1" name="mi_interest"
												value="인문학/책/글"> <label for="ossm1"><span
												class="fa fa-quote-right">ㅤ인문학/책/글</span></label> <input
												type="checkbox" id="ossm2" name="mi_interest" value="외국/언어">
											<label for="ossm2"><span class="fa fa-globe">ㅤ외국/언어</span></label>
											<br /> <input type="checkbox" id="ossm3" name="mi_interest"
												value="문화/축제"> <label for="ossm3"><span
												class="fa fa-ticket">ㅤ문화/축제</span></label> <input type="checkbox"
												id="ossm4" name="mi_interest" value="반려동물"> <label
												for="ossm4"><span class="fa fa-paw">ㅤ반려동물</span></label><br />
											<input type="checkbox" id="ossm5" name="mi_interest"
												value="액티비티/여행"> <label for="ossm5"><span
												class="fa fa-map">ㅤ액티비티/여행</span></label> <input type="checkbox"
												id="ossm6" name="mi_interest" value="게임/오락"> <label
												for="ossm6"><span class="fa fa-puzzle-piece">ㅤ게임/오락</span></label>
											<br /> <input type="checkbox" id="ossm7" name="mi_interest"
												value="자유주제"> <label for="ossm7"><span
												class="fa fa-star">ㅤ자유주제</span></label>
										</div>
										<hr /> <br />
										<div class="form-group mgnBtm0">
											<button type="button" style="width: 100%"
												class="btn btn-primary" onclick="check('${pDto.mr_email }')">변경하기</button>
										</div> ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ
									</li>
								</ul>
								<ul>

									<li>
										<hr />
										<button type="button" onclick="signOut()"
											style="border: none; border-bottom: 1px solid #bbb; color: #bbb; background: none; padding-top: 150px;" id="withdrawal">서비스를
											그만 이용하고 싶으신가요?</button>
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
// 프로필 미리보기
function showPreview(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#preview").attr('src', e.target.result);
			$("#decide").removeAttr('value');
		}
		reader.readAsDataURL(input.files[0]);
	}
	if (input!=null) {
		document.getElementById("reset").disabled = false;
	}
}

// 파일 취소
$(document).ready(function() {
	document.getElementById("reset").disabled = true;
	   $('#reset').on('click', function(e) {
	      var el = $('#file');
	      el.wrap('<form>').closest('form').get(0).reset();
	      el.unwrap();
	      $("#preview").attr("src","../upload/profile.png");
	      $("#decide").attr("value","profile");
	      
	   });
	});
</script>	
	
	
	<script type="text/javascript">
function check(userMail){
	var frm = document.getElementById("frm");
	var inputMail = $("#email").val();
	if (inputMail==userMail) {
		alert("회원정보가 변경됩니다.");
		frm.submit();
	}else{
		jQuery.ajax({
			type:"get",
			url:"../emailAuth.do",
			data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
			asyn : true,
			success:function(data){
				alert(data);
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					frm.submit();
					
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.");
				}
			},
			error:function(data){
				alert("이메일 인증을 다시 해주세요.");
			}
		});
	}
}


$(document).ready(function(){
	
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
	<script type="text/javascript">


	function cancle(){
		location.href = "./cancle.do";
	}

	$(document).ready(function(){
		
		$("#nick").keyup(function(){
			var inputLength = $(this).val().length;
			var nick ="";
			var nickReg = /^[가-힣a-zA-Z]+$/;

			nick = $(this).val();
			if(inputLength < 2 || inputLength > 16){
				$("#nickcheck").remove();
				$("#nick").before("<i class='fa fa-times' id='nickcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
			}else if(nick.indexOf(" ") != -1){
				$("#nickcheck").remove();
				$("#nick").before("<i class='fa fa-times' id='nickcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
			}else if(nickReg.test($("input[name=mi_nck]").val())){
				jQuery.ajax({
					type : "post",
					url : "../check/nickname",
					data : "nick="+$(this).val(),
					asyn : true,
					success : function(msg){
						if(msg.isc=="true"){
							$("#nickcheck").remove();
							$("#nick").before("<i class='fa fa-check' id='nickcheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
						}else{
							$("#nickcheck").remove();
							$("#nick").before("<i class='fa fa-times' id='nickcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
						}
						
					},
					error: function(){
						alert("잘못된 요청값 입니다");
					}
				});
			}else{
				$("#nickcheck").remove();
				$("#nick").before("<i class='fa fa-times' id='nickcheck' aria-hidden='true' style='color: #FD4000;'></i> ");
			}
			
			if ($("#nick").val()=="") {
				$("#nickcheck").remove();
			}

		});
		
		$("#phone").keyup(function(){
			var inputLength = $(this).val().length;
			var phone ="";
			var phoneReg = /^[0-9]+$/;


			phone = $(this).val();
			if (inputLength<9) {
				$("#phonecheck").remove();
				$("#phone").before("<i class='fa fa-times' id='phonecheck' aria-hidden='true' style='color: #FD4000;'></i> ");
			
			}else if(phone.indexOf(" ") != -1){
				$("#phonecheck").remove();
				$("#phone").before("<i class='fa fa-times' id='phonecheck' aria-hidden='true' style='color: #FD4000;'></i> ");
			}else if(phoneReg.test($("input[name=mi_phone]").val())){
				$("#phonecheck").remove();
				$("#phone").before("<i class='fa fa-check' id='phonecheck' aria-hidden='true' style='color: #90BD3C;'></i> ");
			}else{
				$("#phonecheck").remove();
				$("#phone").before("<i class='fa fa-times' id='phonecheck' aria-hidden='true' style='color: #FD4000;'></i> ");
		}

		});

	});

	function signOut() {
		alert('탈퇴한 회원의 정보는 복구가 불가능합니다. 주의하시기 바랍니다.');
		var isc = confirm('정말로 회원을 탈퇴하시겠습니까?');
		
		if (isc) {
// 			 회원탈퇴하는 서블릿으로 보낸다.
			location.href="../drop/apply";
		}
	}
	
	$('document').ready(function() {
		 var area0 = ["시/도 선택","서울특별시"];
		  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		
		  
		// 시/도 선택 박스 select box가 뿌려주고
			$("select[name^=mi_lc1]").each(function() {
				$selsido = $(this);
				$.each(eval(area0), function() {
					$selsido.append("<option value='"+this+"'>"+this+"</option>");
				});
				$selsido.next().append("<option value=''>구/군 선택</option>");
				
				//서울특별시 선택되게한거고?
						// 아직 시/도를 DB에 못담앗어 그래서 이렇게 해둔거야
				$("#sido1 option:eq(1)").attr("selected","selected");
				
		          var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		          var $gugun = $(this).next();
		          $("option",$gugun).remove(); 

		          if(area == "area0"){	// 시/도 선택해주세요
		             $gugun.append("<option value=''>구/군 선택</option>");
		          }else if(area == "area1") { //시/도의 값이 서울특별시 일때 하위 selectbox더해줌
		             $.each(eval(area), function() {
		                if(this=="강남구"){
		                   $gugun.append("<option value='RE_S10'>"+this+"</option>");
		                }else if(this=="강동구"){
		                    $gugun.append("<option value='RE_S13'>"+this+"</option>");
		                }else if(this=="강북구"){
		                   $gugun.append("<option value='RE_S08'>"+this+"</option>");
		                }else if(this=="강서구"){
		                    $gugun.append("<option value='RE_S11'>"+this+"</option>");
		                }else if(this=="관악구"){
		                    $gugun.append("<option value='RE_S23'>"+this+"</option>");
		                }else if(this=="광진구"){
		                   $gugun.append("<option value='RE_S14'>"+this+"</option>");
		                }else if(this=="구로구"){
		                   $gugun.append("<option value='RE_S06'>"+this+"</option>");
		                }else if(this=="금천구"){
		                   $gugun.append("<option value='RE_S05'>"+this+"</option>");
		                }else if(this=="노원구"){
		                   $gugun.append("<option value='RE_S18'>"+this+"</option>");
		                }else if(this=="도봉구"){
		                   $gugun.append("<option value='RE_S01'>"+this+"</option>");
		                }else if(this=="동대문구"){
		                   $gugun.append("<option value='RE_S03'>"+this+"</option>");
		                }else if(this=="동작구"){
		                   $gugun.append("<option value='RE_S04'>"+this+"</option>");
		                }else if(this=="마포구"){
		                   $gugun.append("<option value='RE_S15'>"+this+"</option>");
		                }else if(this=="서대문구"){
		                   $gugun.append("<option value='RE_S20'>"+this+"</option>");
		                }else if(this=="서초구"){
		                   $gugun.append("<option value='RE_S16'>"+this+"</option>");
		                }else if(this=="성동구"){
		                   $gugun.append("<option value='RE_S24'>"+this+"</option>");
		                }else if(this=="성북구"){
		                   $gugun.append("<option value='RE_S17'>"+this+"</option>");
		                }else if(this=="송파구"){
		                   $gugun.append("<option value='RE_S19'>"+this+"</option>");
		                }else if(this=="양천구"){
		                   $gugun.append("<option value='RE_S21'>"+this+"</option>");
		                }else if(this=="영등포구"){
		                   $gugun.append("<option value='RE_S22'>"+this+"</option>");
		                }else if(this=="용산구"){
		                   $gugun.append("<option value='RE_S25'>"+this+"</option>");
		                }else if(this=="은평구"){
		                   $gugun.append("<option value='RE_S02'>"+this+"</option>");
		                }else if(this=="종로구"){
		                   $gugun.append("<option value='RE_S07'>"+this+"</option>");
		                }else if(this=="중구"){
		                   $gugun.append("<option value='RE_S12'>"+this+"</option>");
		                }else {
		                   $gugun.append("<option value='RE_S09'>"+this+"</option>");
		                }
		                
		             });
		          }else{
		             $gugun.append("<option value=''>"+"없음"+"</option>");
		          }
			});
		// 시/도-하위 selectbox를 뿌려주고 나서 회원이 가지고 있는 원본 값을 선택되게 해준거지
			$("#gugun1").val("${pDto.mi_lc}").attr("selected","selected");
		    });
	</script>
</body>

</html>

