<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>PROJECT : NAWA</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<link href="../resources/css/eventsearch_thumbnail.css" rel="stylesheet">
<link href="../resources/css/event.css" rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans">
</head>
<script src="../resources/js/searchpaging.js"></script>

<body id="body" class="body-wrapper">
	<div class="page-loader"
		style="background: url(../resources/img/preloader.gif) center no-repeat #fff;"></div>
	<div class="main-wrapper">
		<!-- HEADER -->
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>
		<section class="main-contentiner map-half-content"
			style="padding-top: 0px">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 col-xs-12 col-md-push-6">
						<div class="inner-container">
							<div class="map-lg-fixed">
								<div class="map-container">
									<div id="map" style="height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xs-12 col-md-pull-6 ">
						<!-- CATEGORY SEARCH SECTION -->
						<section class="clearfix searchArea banerInfo searchAreaGray">
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-6 col-xs-12 col-md-6 col-lg-6" style="height: 50px;">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">Find</div>
												<input type="text" class="form-control" id="ef_title1"
													placeholder="What are you looking for?"
													onchange="eventChange()">
											</div>
										</div>
									</div>

									<div class="col-sm-6 col-xs-12 col-md-6 col-lg-6">
										<div class="searchPart">
											<div class="searchPartInner">
												<div class="searchPartTitle">Near</div>
												<div class="searchSelectboxes">
												<select name="guiest_id32" id="ef_location1" class="select-drop" onchange="eventChange()">
													<option value="">전체구</option>
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
										</div>
									</div>

									<div class="col-sm-6 col-xs-12 col-md-8 col-lg-6" style="margin-top: 10px;">
										<div class="searchPart">
											<div class="searchPartInner">
												<div class="searchPartTitle">Category</div>
												<div class="searchSelectboxes">
													<select name="guiest_id32" id="uc_id1" class="select-drop"
														onchange="eventChange()">
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
									</div>
									
									<div class="col-sm-6 col-xs-12 col-md-8 col-lg-6" style="margin-top: 10px;">
										<button id="searchBtn" onclick="frmPaging()" class="btn btn-primary" style="float: right;">Search</button>
									</div>
								</div>
							</div>
						</section>

						<!-- CATEGORY LIST SECTION -->
						<section class="clerfix">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12">
										<!-- 리스트 정렬 부분 -->
										<div style="margin-bottom: 40px;">
											We found <span> ${size} </span> results for
												events <select class='form-control' id="ef_order1"
												name="ef_order1" onchange="eventOrder();"
												style="width: 110px; float: right;">
													<option value="EF_READ_CNT"
														<c:if test="${paging.ef_order eq 'EF_READ_CNT'}">selected</c:if>>인기순</option>
													<option value="EF_RGD"
														<c:if test="${paging.ef_order eq 'EF_RGD'}">selected</c:if>>개설일순</option>
													<option value="EF_DEADLINE"
														<c:if test="${paging.ef_order eq 'EF_DEADLINE'}">selected</c:if>>마감일순</option>
											</select> <select class='form-control' id='listCount' name='listCount'
												onchange='listCnt();'
												style="width: 80px; float: right; margin-right: 5px;">
													<option value='5'
														<c:if test="${paging.listCnt eq 5}">selected</c:if>>5</option>
													<option value='10'
														<c:if test="${paging.listCnt eq 10}">selected</c:if>>10</option>
													<option value='15'
														<c:if test="${paging.listCnt eq 15}">selected</c:if>>15</option>
													<option value='20'
														<c:if test="${paging.listCnt eq 20}">selected</c:if>>20</option>
											</select>
										</div>

										<!-- 이벤트 리스트 부분 -->
										<form action="../event/search" method="post" id='frmPaging'>
											<c:forEach var="dto" items="${lists}" varStatus="status">
												<div class="card card-list card-listing"
													data-lat="-33.922125" data-lag="151.159277" data-id="1"
													style="margin-bottom: 20px;">
													<div class="row">
														<div class="col-sm-5 col-xl-4">
															<div class="card-list-img" id="img_thumbnail">
																<img class="listing-img"
																	src="../upload/${flist[status.index].fi_storedname}" id="thumbnail_r">
															</div>
															<c:if
																test="${dto.ef_status eq 'O' || dto.ef_status eq 'E'}">
																<span class="badge badge-primary">Opened</span>
															</c:if>

														</div>
														<div class="col-sm-7 col-xl-8">
															<div class="card-body p-0">
																<ul class="list-inline list-inline-rating">
																	<li class="list-inline-item"><i class="fa fa-star"
																		aria-hidden="true"></i></li>
																	<li class="list-inline-item"><i class="fa fa-star"
																		aria-hidden="true"></i></li>
																	<li class="list-inline-item"><i class="fa fa-star"
																		aria-hidden="true"></i></li>
																	<li class="list-inline-item"><i class="fa fa-star"
																		aria-hidden="true"></i></li>
																	<li class="list-inline-item"><i
																		class="fa fa-star-o" aria-hidden="true"></i></li>
																</ul>

																<div
																	class="d-flex justify-content-between align-items-center mb-1">
																	<h3 class="card-title listing-title mb-0">
																		<a href="../event/detail?ef_id=${dto.ef_id}">${dto.ef_title}</a>
																	</h3>
																	<button class="btn-like px-2" data-toggle="tooltip"
																		data-placement="top" title=""
																		data-original-title="Favourite this listing">
																		<i class="fa fa-eye" aria-hidden="true"></i> <span>${dto.ef_read_cnt}</span>
																	</button>
																</div>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S01'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		도봉구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S02'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		은평구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S03'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		동대문구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S04'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		동작구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S05'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		금천구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S06'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		구로구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S07'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		종로구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S08'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		강북구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S09'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		중랑구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S10'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		강남구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S11'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		강서구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S12'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		중구 </span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S13'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		강동구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S14'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		광진구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S15'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		마포구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S16'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		서초구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S17'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		성북구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S18'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		노원구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S19'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		송파구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S20'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		서대문구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S21'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		양천구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S22'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		영등포구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S23'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		관악구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S24'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		성동구</span>
																</c:if>
																<c:if test="${dto ne null && dto.ef_lc eq 'RE_S25'}">
																	<span class="d-block mb-4 listing-address">장소 :
																		용산구</span>
																</c:if>
															</div>
															
															<c:if test="${dto.uc_id eq 'NH_ANIMAL'}">
																<div>
																	<a href="../event/search?uc_id=NH_ANIMAL">반려동물</a>
																</div>
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_GAME'}">
																<div>
																	<a href="../event/search?uc_id=NH_GAME">게임 / 오락</a>
																</div>
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_TRABEL'}">
																<div>
																	<a href="../event/search?uc_id=NH_TRABEL">아웃도어 / 여행</a>
																</div>
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_CULTURE'}">
																<div>
																	<a href="../event/search?uc_id=NH_CULTURE">문화 / 공연
																		/ 축제</a>
																</div>
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_FREE'}">
																<div>
																	<a href="../event/search?uc_id=NH_FREE">자유주제</a>
																</div>
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_READER'}">
																<div>
																	<a href="../event/search?uc_id=NH_READER">인문학 / 책 /
																		글</a>
																</div>
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_LANGUAGE'}">
																<div>
																	<a href="../event/search?uc_id=NH_LANGUAGE">외국 / 언어</a>
																</div>
															</c:if>
															
															${dto.ef_con}

															
														</div>
													</div>
												</div>
											</c:forEach>
											<div id="list-items">

												<!-- 5. paging view -->
												<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
												<input type='hidden' name='index' id='index' value='${paging.index}'> 
												<input type='hidden' name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'> 
												<input type='hidden' name='listCnt' id='listCnt' value='${paging.listCnt}'> 
												<input type="hidden" name="ef_title" id="ef_title" value="${search.ef_title}">
												<!-- 여기의 value는 컨트롤러에서 이부분만 model로 만든 애를 EL방식으로 처리한 것! -->
												<input type="hidden" name="ef_lc" id="ef_location" value="${search.ef_lc}">
												<!-- 여기의 value는 컨트롤러에서 이부분만 model로 만든 애를 EL방식으로 처리한 것! -->
												<input type="hidden" name="uc_id" id="uc_id" value="${search.uc_id}"> 
												<input type="hidden" name="ef_order" id="ef_order" value="${search.ef_order}">

												<div class="paginationCommon">
													<nav aria-label="Page navigation">
														<ul class="pagination">
															<!-- 이전페이지 이동 -->
															<li>
																<a href="#"	onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'
																aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
																</a>
															</li>
															<li>
																<a href="#" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'
																aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
																</a>
															</li>
															<!-- PAGE NUMBER -->
															<c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">
																<li class="active">
																	<a href='#' onclick='pageIndex(${i});'>${i}</a>
																</li>
															</c:forEach>
															<!-- 다음페이지 이동 -->
															<li>
																<a href="#" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'
																aria-label="Next"> 
																<span aria-hidden="true">&rsaquo;</span>
																</a>
															</li>
															<li>
																<a href="#" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'
																aria-label="Next"> 
																<span aria-hidden="true">&raquo;</span>
																</a>
															</li>
														</ul>
													</nav>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</section>


					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<!-- JAVASCRIPTS -->
	<script src="../resources/plugins/jquery/jquery.min.js"></script>
	<script src="../resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="../resources/plugins/menuzord/js/menuzord.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>
	<script src="../resources/plugins/selectric/jquery.selectric.min.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>
	<script src="../resources/plugins/dzsparallaxer/dzsparallaxer.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>
	<script src="../resources/plugins/isotope/isotope.pkgd.min.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>
	<script
		src="../resources/plugins/revolution/js/jquery.themepunch.tools.min.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>
	<script
		src="../resources/plugins/revolution/js/jquery.themepunch.revolution.min.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>

	<script src="../resources/js/listty.js"
		type="7e0001c11dc3ea60fe355f64-text/javascript"></script>
	<script src="../resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="../resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="../resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="../resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="../resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="../resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="../resources/plugins/isotope/isotope.min.js"></script>
	<script src="../resources/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script src="../resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="../resources/plugins/rateyo/jquery.rateyo.min.js"></script>

	<script src="../resources/js/app.js"></script>
	<script type="text/javascript"
		src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=431e0af1ef52398982b0d15439c85648&libraries=services"></script>
	<script src="../resources/js/kakao_map.js"></script>
	<script type="text/javascript">
		var user="${user_lc}";
		setOptionMap(user.split(',')[0], user.split(',')[1]);
		setMapControl();
		var positions=${test};
		setMarkers(positions);
	</script>
</body>

</html>

