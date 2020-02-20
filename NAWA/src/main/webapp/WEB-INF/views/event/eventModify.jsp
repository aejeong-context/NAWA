<%@page import="com.min.app.dto.member.InformMemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EVENT - MODIFY</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<link href="../resources/css/event_img.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="../resources/js/jquery.form.js"></script>
<script src="../resources/js/jquery.MultiFile.js"></script>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
</head>

<body id="body" class="body-wrapper boxed-menu">
	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>
		<!-- Dashboard header -->
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
							<c:if test="${LDto ne null && LDto.mr_auth eq 'U'}">
								<li class=""><a href="../user/dashboard"><i
										class="fa fa-tachometer icon-dash" aria-hidden="true"></i>
										Dashboard</a></li>
							</c:if>
							<li class=""><a href="../project/index"><i
									class="fa fa-list icon-dash" aria-hidden="true"></i> Main</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</section>


		<!-- Dashboard breadcrumb section -->
		<div class="section dashboard-breadcrumb-section bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<h2>이벤트 수정 페이지</h2>
						<ol class="breadcrumb">
							<c:if test="${LDto ne null && LDto.mr_auth eq 'A'}">
								<li class=" dropdown singleDrop"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">관리자 리스트 <i
										class="fa fa-angle-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu">
										<li><a href="../user/list">회원조회</a></li>
										<li><a href="../sign/logout">로그아웃</a></li>
									</ul></li>
							</c:if>
						</ol>
					</div>
				</div>
			</div>
		</div>


		<!-- DASHBOARD ORDERS SECTION -->
		<section class="clearfix bg-dark listingSection" id="listing-add-edit">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<form action="../event/modisuccess" method="post"
							class="listing__form" id="modifyForm"
							enctype="multipart/form-data">
							<input type="hidden" name="ef_id" value="${dto.ef_id}" id="ef_id">
							<div class="dashboardBoxBg mb30">
								<div class="profileIntro paraMargin">
									<h3>이벤트 정보</h3>
									<p>NAWA는 모임중개서비스이며 모임참가의 당사자가 아닙니다. 따라서 NAWA는 이벤트 정보 및 진행에
										대하여 책임을 지지 않습니다.</p>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
									<label for="listingTitle">이벤트 제목</label>
									<input type="text" name="ef_title" class="form-control" id="listingTitle" value="${dto.ef_title}" >
								</div>
								<div class="form-group col-sm-6 col-xs-12">
									<label for="listingTitle">개설자 닉네임</label>
									<input type="text" name="mi_nck" class="form-control" id="listingNck" value="${mi_nck}" placeholder="${mi_nck}" readonly="readonly">
								</div>
								<div class="form-group col-sm-6 col-xs-12">
									<label for="listingCategory">공개여부</label>
									<div class="contactSelect">
										<select name="ef_open_status" id="listingOpenStatus" class="select-drop">
											<option value="PUBLIC">공개</option>
											<option value="PRIVATE">비공개</option>
										</select>
									</div>
								</div>
								<div class="form-group col-sm-6 col-xs-12">
									<label for="listingTitle">이벤트 인원</label>
									<input type="number" name="ef_num_cnt" class="form-control" id="listingNum" value="${dto.ef_num_cnt}" min="2" max="20">
								</div>
								<div class="form-group col-sm-6 col-xs-12">
									<label for="listingCategory">카테고리</label>
									<div class="contactSelect">
										<select name="uc_id" id="uc_id1" class="select-drop">
											<option value="">카테고리</option>
											<option value="NH_ANIMAL">반려동물</option>
											<option value="NH_GAME">게임/오락</option>
											<option value="NH_TRABEL">아웃도어/여행</option>
											<option value="NH_CULTURE">문화/공연/축제</option>
											<option value="NH_FREE">자유주제</option>
											<option value="NH_READER">인문학/책/글</option>
											<option value="NH_LANGUAGE">외국/언어</option>
										</select>
									</div>
								</div>
							</div>
								<div style="width: auto; height: 350px; margin-bottom: 30px;">
									<label for="discribeTheListing">이벤트 내용</label>
									<div id="editor">${dto.ef_con}</div>
									<input type='hidden' name='ef_con' id="ef_con">
								</div>
						</div>
								<div style="margin-top: 115px;">
									<label for="addTags">참가 조건</label>
									<input name="ef_attend_con" type="text" class="form-control" id="addTags" value="${dto.ef_attend_con}" placeholder="25세이상  , 민증 필수">
							</div>
							</div>
							<div class="dashboardBoxBg mb30">
								<div class="profileIntro paraMargin">
									<h3>연락처 / 장소</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="listingRegion">지역구</label>
											<div class="contactSelect">
												<select name="ef_lc" id="guiest_id19" class="select-drop">
													<option value="RE_S00">전체구</option>
													<option value="RE_S01">도봉구</option>
													<option value="RE_S02">은평구</option>
													<option value="RE_S03">동대문구</option>
													<option value="RE_S04">동작구</option>
													<option value="RE_S05">금천구</option>
													<option value="RE_S06">구로구</option>
													<option value="RE_S07">종로구</option>
													<option value="RE_S08">강북구</option>
													<option value="RE_S09">중랑구</option>
													<option value="RE_S10">강남구</option>
													<option value="RE_S11">강서구</option>
													<option value="RE_S12">중구</option>
													<option value="RE_S13">강동구</option>
													<option value="RE_S14">광진구</option>
													<option value="RE_S15">마포구</option>
													<option value="RE_S16">서초구</option>
													<option value="RE_S17">성북구</option>
													<option value="RE_S18">노원구</option>
													<option value="RE_S19">송파구</option>
													<option value="RE_S20">서대문구</option>
													<option value="RE_S21">양천구</option>
													<option value="RE_S22">영등포구</option>
													<option value="RE_S23">관악구</option>
													<option value="RE_S24">성동구</option>
													<option value="RE_S25">용산구</option>
												</select>
											</div>
										</div>

										<div class="form-group col-sm-6 col-xs-12">
											<label for="listingAddress">상세주소</label> <input type="text"
												class="form-control" id="listingAddress"
												placeholder="Type Location"> <input
												name="ef_lc_detail" type="hidden" id="latlng">
										</div>
										<div class="form-group col-sm-6 col-sm-push-6 col-xs-12">
											<div class="map_wrap">
												<div id="map"
													style="width: 100%; height: 250px; position: relative; overflow: hidden;"></div>
											</div>
										</div>
										<div class="form-group col-sm-6 col-sm-pull-6 col-xs-12">
									<label for="listingPhone">연락처</label>
									<input type="text" class="form-control" id="listingPhone" placeholder="${phone}" readonly="readonly">
								</div>

								<div class="form-group col-sm-6 col-sm-pull-6 col-xs-12">
									<label for="listingEmail">이메일</label>
									<input type="text" class="form-control" id="listingEmail" placeholder="${email}" readonly="readonly">
								</div>

									</div>
								</div>
							</div>
							<div class="dashboardBoxBg mb30">
								<div class="profileIntro paraMargin">
									<h3>대표 이미지</h3>
									<div class="row">
										<div class="form-group col-xs-12">
											<input type="hidden" name="decide" id="decide"> <input
												type="hidden" value="${fdto.fi_seq}" name="fi_seq">
												
											<div class="img_area">
											<div class="img_thumbnail">
												<img class="thumbnail_r" src="../upload/${fdto.fi_storedname}">
											</div>
										</div><br> 
												<input type="file" name="basicfile" id="basicfile"
												onchange="showPreview(this)"> <a
												onclick="resetPreview()">취소</a>
										</div>

										<div class="form-group col-xs-12">
											<h3>첨부 이미지</h3>
											<div id="afileList">첨부된 파일 리스트</div>
											<div id="afileList"></div>
											<input type="file" name="file" multiple="multiple" id="file" />
											<div id="filelist" style="height: 150px"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="dashboardBoxBg mb30">
								<div class="profileIntro paraMargin">
							<h3>마감일 / 개최일</h3>
							<div class="row">
								<div class="col-sm-6 col-xs-12">
									<div class="dateSelect">
										<label for="mondayTime">이벤트 개최일</label>
										<div class="input-group date ed-datepicker filterDate" data-provide="datepicker">
											<input type="text" name="ef_event_start" class="form-control" placeholder="yyyy-mm-dd">
											<div class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-6 col-xs-12">
									<div class="dateSelect">
										<label for="mondayTime">이벤트 모집 마감일</label>
										<div class="input-group date ed-datepicker filterDate" data-provide="datepicker">
											<input type="text" name="ef_deadline" class="form-control" placeholder="yyyy-mm-dd">
											<div class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							</div>
							<div class="form-footer text-center">
								<button type="submit" class="btn-submit" id="eventmodify">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>


		<!-- FOOTER -->
		<footer class="copyRightDashboard">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p>Copyright © 2016. All Rights Reserved</p>
					</div>
				</div>
			</div>
		</footer>
	</div>


	<script type="text/javascript">
		var ef_id = document.getElementById("ef_id").value;
		
		$(document).ready(function() {
			
			getfileList();
		});


		function getfileList(){
			   $.ajax({
			      type:'get',
			      url : '../event/fileList',
			      data : {"ef_id":ef_id},
			      success : function(data){
			         var html ="";
			         $.each(data,function(){
			            if (data.file.length>0) {
			               for (var i = 0; i < data.file.length; i++) {
			                  //alert(data.file[i].fi_seq);
			                  var filename = data.file[i].fi_originname;
			                  html += "<p style='width: 200px; float: left; margin: 0px;'>"+filename+"</p>";
			                  html +="<a onclick='delfile("+data.file[i].fi_seq+")'>삭제</a><br><br>"
			                  
			               }
			            }
			         });
			         $("#afileList").html(html);
			      },
			      error : function(){
			         alert("첨부된 이미지를 불러오지 못했습니다.");
			      }
			      
			   });
			   
			}
		// 대표이미지 미리보기
		function showPreview(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$(".thumbnail_r").attr('src', e.target.result);
					$("#decide").attr('value', 'update');
				}
				reader.readAsDataURL(input.files[0]);
			}

		}

		// 대표이미지 리셋(기본이미지로 변경)
		function resetPreview() {
			var el = $('#basicfile');
			el.wrap('<form>').closest('form').get(0).reset();
			el.unwrap();
			$(".thumbnail_r").attr("src", "../upload/eventbasic.jpg");
			$("#decide").attr('value', 'eventbasic');
		}

		//파일 삭제
		function delfile(seq) {
			if (!confirm("삭제하시겠습니까?")) {
				return;
			}
			$.ajax({
				url : '../file/delete',
				data : {
					"fi_seq" : seq
				},
				dataType : 'text',
				type : 'post',
				success : function() {
					alert("삭제 되었습니다");
					getfileList();
				},
				error : function() {
					alert("에러");
				}

			});
		}

		var $j = jQuery.noConflict();

		$j(function() {
			// sumbit 버튼 클릭시 editor내용을 hidden ef_con에 담김
			$j("#eventmodify").click(function() {
				var div = $(".ql-editor").html();

				document.getElementById('ef_con').setAttribute("value", div);
			});

			//use jQuery MultiFile Plugin 
			$j('#modifyForm input[name=file]').MultiFile({
				max : 5,
				accept : 'jpg|png|gif',
				maxfile : 1024, //각 파일 최대 업로드 크기
				maxsize : 3024, //전체 파일 최대 업로드 크기
				STRING : {
					remove : "x",
					duplicate : "$file 은 이미 선택된 파일입니다.",
					denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
					selected : '$file 을 선택했습니다.',
					toomuch : "업로드할 수 있는 최대크기를 초과하였습니다.($size)",
					toomany : "업로드할 수 있는 최대 갯수는 $max개 입니다.",
					toobig : "$file 은 크기가 매우 큽니다. (max $size)"
				},
				list : "#filelist"
			});

			$j('#modifyForm').ajaxForm({
				dataType : "json",
				success : function(data) {
					// eventDetail로 화면 넘기기 
					
					location.href = "../event/detail?ef_id=" + data;
				},
				//ajax error
				error : function(e) {
					alert("이벤트 개설 실패");
					console.log(e);
				}
			});

		});

		var toolbarOptions = [ [ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
		[ 'blockquote', 'code-block' ], [ {
			'header' : 1
		}, {
			'header' : 2
		} ], // custom button values
		[ {
			'list' : 'ordered'
		}, {
			'list' : 'bullet'
		} ], [ {
			'size' : [ 'small', false, 'large', 'huge' ]
		} ], // custom dropdown
		[ {
			'header' : [ 1, 2, 3, 4, 5, 6, false ]
		} ],

		[ {
			'color' : []
		}, {
			'background' : []
		} ], // dropdown with defaults from theme
		[ {
			'font' : []
		} ], [ {
			'align' : []
		} ], [ 'clean' ] // remove formatting button
		];

		var quill = new Quill('#editor', {
			modules : {
				toolbar : toolbarOptions
			},
			theme : 'snow'
		});
	</script>
	<!-- JAVASCRIPTS -->
	<script src="../resources/plugins/jquery/jquery.min.js"></script>
	<script src="../resources/plugins/jquery/jquery-migrate.js"></script>
	<script src="../resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="../resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="../resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="../resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script
		src="../resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="../resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="../resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="../resources/plugins/isotope/isotope.min.js"></script>
	<script src="../resources/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script src="../resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="../resources/plugins/rateyo/jquery.rateyo.min.js"></script>
	<script src="../resources/js/app.js"></script>
	
	<script src="../resources/js/kakao_map.js"></script>
	<script type="text/javascript">
		var ef_lc = "${dto.ef_lc_detail}";
	 	$('#guiest_id19 option[value=${dto.ef_lc}]').attr('selected',
				'selected');
		setMap(ef_lc.split(',')[0], ef_lc.split(',')[1], 6);
		setMarker(ef_lc.split(',')[0], ef_lc.split(',')[1]);
		setMapControl();
		getAddress();
		printAddress(ef_lc.split(',')[0], ef_lc.split(',')[1]);
	</script>


</body>

</html>

