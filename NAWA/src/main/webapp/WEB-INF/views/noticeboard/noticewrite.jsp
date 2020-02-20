<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>

<!-- SITE TITTLE -->
<title>PROJECT : NAWA</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="../resources/js/jquery.form.js"></script>
<script src="../resources/js/jquery.MultiFile.js"></script>


<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">

<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<script src="../resources/js/paging.js"></script>

</head>

<body id="body" class="body-wrapper boxed-menu">

	<div class="main-wrapper">
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>
		<!-- DASHBOARD ORDERS SECTION -->
		<section class="clearfix bg-dark listingSection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<form action="../notice/write" method="post" class="listing__form"
							id="noticeForm" enctype="multipart/form-data">
							<input type="hidden" name="mi_nck" value="${LDto.mi_nck}">
							<div class="dashboardBoxBg mb30">
								<div class="profileIntro paraMargin" style="height: 600px;">
									<h3>글쓰기</h3>
									<!-- <p>글쓰기 작성합니다</p> -->
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="listingTitle">제목</label> <input type="text"
												class="form-control" id="listingTitle" name="nb_title"
												placeholder="New City Hotel">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="listingCategory">카테고리</label>
											<div class="contactSelect">
												<select name="uc_id" id="guiest_id9" class="select-drop">
													<option value="NV_ETC">기타</option>
													<option value="NV_CHECK">점검</option>
													<option value="NV_UPDATE">업데이트</option>
													<option value="NV_NOTICE" selected="selected">관리자공지</option>
												</select>
											</div>
										</div>
										<div style="width: 1078px; height: 400px; padding: 15px;">
											<label for="discribeTheListing">내 용</label>
											<div id="editor"></div>
											<input type='hidden' name='nb_con' id="nb_con">
										</div>
									</div>
								</div>
								<div>
									<input type="file" name="file" multiple="multiple" id="file" />
									<div id="filelist" style="height: 200px"></div>
								</div>

								<div style="text-align: center;">
									<button class="btn-submit" type="submit" id="noticewrite">작성완료</button>
								</div>

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

	<!-- JAVASCRIPTS -->
	<script type="text/javascript">
		var $j = jQuery.noConflict();

		$j(document).ready(function() {

			$j("#noticewrite").click(function() {
				var div = $(".ql-editor").html();
				document.getElementById('nb_con').setAttribute("value", div);
			});

			//use jQuery MultiFile Plugin 
			$j('#noticeForm input[name=file]').MultiFile({
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

			$j('#noticeForm').ajaxForm({
				success : function(data) {
					if (data == 0) {
						alert("공지사항 작성 에러");
					} else {
						// 공지사항 상세보기 페이지로 이동
						location.href = "../notice/list";
					}
				},
				error : function(e) {
					alert("공지사항 작성 에러");
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
	<script src="../resources/plugins/jquery/jquery.min.js"></script>
	<script src="../resources/plugins/jquery/jquery-migrate.js"></script>
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

