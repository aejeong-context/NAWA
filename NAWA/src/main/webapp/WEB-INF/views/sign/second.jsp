<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>NAWA : SignUp</title>
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
    width: 90px; 
    height: 90px; 
    overflow: hidden;
    border-radius: 70%;
    border: 1px solid gray;
    float: left;

}
.profile {
    width: 90px; 
    height: 90px;
    object-fit: cover;
    object-position: top;

}
#input{
	float: right;

}

/* #file{
	float: right;
} */

</style>
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
							<form class="loginForm" action="../sign/apply" method="post"
								id="frm" name="frm" enctype="multipart/form-data">
								<input type="hidden" value="${SNDto.mr_id}" name="mr_id" />
								<ul class="list-inline">
									<li>
									<h2>프로필</h2>
									<br>
									<div class="form-group" style="height: 80px;">
										<div class="box">
											<img id="preview" src="../upload/profile.png" class="profile">
										</div>
											<div id="input">
											<input type="file" multiple="multiple" id="file" name="file" 
												onchange="showPreview(this)"><br>
											<a id="reset">취소</a>
											</div>	
										
										
									
									</div>
									<hr />
										<h2>활동정보</h2>
										<div class="form-group">
											<input type="text" class="form-control" id="nick"
												name="mi_nck" placeholder="닉네임(필수)" required="required">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="phone"
												name="mi_phone" placeholder="연락처(필수)" required="required">
										</div>
										
									</li>
									
									<li>
									<h2>지역</h2>
										<div class="form-group">
											<select name="mi_lc1" id="sido1" class="col-sm-4 col-xs-12"
												style="border: 1px solid #e4e4e4; padding: 4px 10px;"></select>
											<select name="mi_lc" id="gugun1" class="col-sm-8 col-xs-12"
												style="border: 1px solid #e3e3e3; padding: 4px 10px;"></select>
										</div>
										<br><br>
										<hr/>
										
										<h2>취미</h2>
										<div class="form-group">
											<input type="checkbox" id="ossm1" name="mi_interest"
												value="인문학/책/글"> <label for="ossm1"><span class="fa fa-quote-right">ㅤ인문학/책/글</span></label>
											<input type="checkbox" id="ossm2" name="mi_interest"
												value="외국/언어"> <label for="ossm2"><span class="fa fa-globe">ㅤ외국/언어</span></label>
											<br /> <input type="checkbox" id="ossm3" name="mi_interest"
												value="문화/축제"> <label for="ossm3"><span class="fa fa-ticket">ㅤ문화/축제</span></label> <input
												type="checkbox" id="ossm4" name="mi_interest" value="반려동물">
											<label for="ossm4"><span class="fa fa-paw">ㅤ반려동물</span></label><br />
											<input type="checkbox" id="ossm5" name="mi_interest"
												value="액티비티/여행"> <label for="ossm5"><span class="fa fa-map">ㅤ액티비티/여행</span></label> <input
												type="checkbox" id="ossm6" name="mi_interest" value="게임/오락">
											<label for="ossm6"><span class="fa fa-puzzle-piece">ㅤ게임/오락</span></label> <br /> <input
												type="checkbox" id="ossm7" name="mi_interest"
												value="자유주제"> <label for="ossm7"><span class="fa fa-star">ㅤ자유주제</span></label>
										</div>

										<div class="form-group mgnBtm0">
											<button type="submit" style="width: 100%"
												class="btn btn-primary">가입하기</button>
										</div> ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>

			</div>
			<input type="hidden" id="random" value="${random }">

		</section>


		<!-- FOOTER -->
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	</div>

	<!-- LOGIN  MODAL -->
	<div id="loginModal" tabindex="-1" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Log In to your Account</h4>
				</div>
				<div class="modal-body">
					<form class="loginForm">
						<div class="form-group">
							<i class="fa fa-envelope" aria-hidden="true"></i> <input
								type="email" class="form-control" id="email" placeholder="Email">
						</div>
						<div class="form-group">
							<i class="fa fa-lock" aria-hidden="true"></i> <input
								type="password" class="form-control" id="pwd"
								placeholder="Password">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Log
								In</button>
						</div>
						<div class="checkbox">
							<label><input type="checkbox"> Remember me</label> <a
								href="#" class="pull-right link">Fogot Password?</a>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<p>
						Don’t have an Account? <a href="#" class="link">Sign up</a>
					</p>
				</div>
			</div>
		</div>
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
		      
		   });
		});
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

	$('document').ready(function() {
		 var area0 = ["시/도 선택","서울특별시"];
		  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		 
		// 시/도 선택 박스 초기화
		$("select[name^=mi_lc1]").each(function() {
			$selsido = $(this);
			$.each(eval(area0), function() {
				$selsido.append("<option value='"+this+"'>"+this+"</option>");
			});
			$selsido.next().append("<option value=''>구/군 선택</option>");
		});

		$("select[name^=mi_lc1]").change(function() {
			var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
			var $gugun = $(this).next();
			$("option",$gugun).remove(); 

			if(area == "area0"){
				$gugun.append("<option value=''>구/군 선택</option>");
			}else if(area == "area1") {
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
	});
	</script>
</body>

</html>

