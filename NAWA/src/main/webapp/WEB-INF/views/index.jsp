<%@page import="com.min.app.dto.event.InformEvtDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>PROJECT : NAWA</title>
<link href="../resources/css/index_thumbnail.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
</head>
<script src="../resources/js/paging.js"></script>

<body id="body" class="body-wrapper boxed-menu">
	<!-- Preloader -->
	<div id="preloader" class="smooth-loader-wrapper">
		<div class="smooth-loader">
			<div class="loader1">
				<div class="loader-target">
					<div class="loader-target-main"></div>
					<div class="loader-target-inner"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="main-wrapper">
		<%@ include file="/WEB-INF/views/layout/header.jsp"%>

		<!-- BANNER SECTION -->
		<section class="clearfix homeBanner"
			style="background-image: url(../resources/img/banner/banner1.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="banerInfo">
							<h1>PROJECT : NAWA</h1>
							<p>좋아하는 문화생활을 새로운 친구와 함께하세요!</p>
							<form class="form-inline" action="../event/search" method="post" id="frmPaging">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">이벤트</div>
										<input type="text" class="form-control" id="ef_title1" onchange="eventChange()"
											placeholder="제주도 여행">
										<div class="input-group-addon addon-right"></div>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">장소</div>
										<input type="text" class="form-control" id="ef_location1" onchange="eventChange()"
											placeholder="서울시 강남구">
										<div class="input-group-addon addon-right">
											<i class="icon-listy icon-target" aria-hidden="true"></i>
										</div>
									</div>
								</div>
								
								<input type="hidden" name="ef_title" id="ef_title">
								<input type="hidden" name="ef_lc" id="ef_location">
								<input type="hidden" name="uc_id" id="uc_id"> 
								<!-- <input type="hidden" name="ef_order" id="ef_order"> -->
								
								<button type="submit" class="btn btn-primary" id="searchBtn" onclick="frmPaging()">
									검색 <i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- INTEREST SECTION -->
		<section class="clearfix interestArea">
			<div class="container">
				<div class="page-header text-center">
					<h2>
						취미가 있으신가요? <small>혼자여도 걱정하지마세요!</small>
					</h2>
				</div>
				<div class="row">
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_READER"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-quote-right" aria-hidden="true"></i>
								인문학/책/글
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_LANGUAGE"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-globe" aria-hidden="true"></i> 외국/언어
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_CULTURE"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-ticket" aria-hidden="true"></i> 문화/축제
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_ANIMAL"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-paw" aria-hidden="true"></i> 반려동물
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_TRABEL"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-map" aria-hidden="true"></i> 아웃도어/여행
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_GAME"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-puzzle-piece" aria-hidden="true"></i>
								게임/오락
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search?uc_id=NH_FREE"
							class="interestContent"> <span> <i
								class="icon-listy fa fa-star" aria-hidden="true"></i> 자유주제
						</span>
						</a>
					</div>
					<div class="col-sm-3 col-xs-12">
						<a href="../event/search" class="interestContent"> <span>
								<i class="icon-listy fa fa-ellipsis-h" aria-hidden="true"></i>
								전체보기
						</span>
						</a>
					</div>
				</div>
			</div>
		</section>


		<!-- THINGS SECTION -->
		<section class="clearfix thingsArea">
			<div class="container">
				<div class="page-header text-center">
					<h2>
						인기많은 나의 지역 이벤트<small>주변 사람들은 이미 NAWA를 즐기고 있어요!</small>
					</h2>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div id="thubmnailSlider" class="carousel slide thumbnailCarousel">
							<c:if test="${LDto eq null}">
							<!-- Carousel items -->
							<div class="carousel-inner">
								<div class="item row active">
								<c:forEach var="dto" items="${list}" varStatus="status">
								<c:if test="${dto.ef_close ne 'Y'}">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="thingsBox" style="margin-bottom: 20px;">
											<div class="thingsImage" id="img_thumbnail">
												<img src="../upload/${flist[status.index].fi_storedname}" id="thumbnail_r">
												<div class="thingsMask">
													<ul class="list-inline rating">
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
													</ul>
													<a href="../event/detail?ef_id=${dto.ef_id}"><h2>
															${dto.ef_title} <i class="fa fa-check-circle"
																aria-hidden="true"></i>
														</h2></a>
													<p>${dto.ef_con}</p>
												</div>
											</div>
											<div class="thingsCaption ">
												<ul class="list-inline captionItem">
													<li><i class="fa fa-heart-o" aria-hidden="true"></i> ${dto.ef_read_cnt}</li>
													<li><a href="../event/search?uc_id=${dto.uc_id}">
															<c:if test="${dto.uc_id eq 'NH_ANIMAL'}">
																반려동물
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_GAME'}">
																게임 / 오락
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_TRABEL'}">
																아웃도어 / 여행
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_CULTURE'}">
																문화 / 공연 / 축제
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_FREE'}">
																자유주제
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_READER'}">
																인문학 / 책 / 글
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_LANGUAGE'}">
																외국 / 언어
															</c:if>
														</a></li>
												</ul>
											</div>
										</div>
									</div>
									</c:if>
								</c:forEach>	
								</div>
							</div>
							</c:if>
							
							<c:if test="${LDto ne null}">
								<div class="item row active">
								<c:forEach var="dto" items="${list}" varStatus="status">
								<c:if test="${dto.ef_close ne 'Y'}">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="thingsBox" style="margin-bottom: 20px;">
											<div class="thingsImage" id="img_thumbnail" >
												<img src="../upload/${flist[status.index].fi_storedname}" id="thumbnail_r">
												<div class="thingsMask">
													<ul class="list-inline rating">
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
													</ul>
													<a href="../event/detail?ef_id=${dto.ef_id}"><h2>
															${dto.ef_title} <i class="fa fa-check-circle"
																aria-hidden="true"></i>
														</h2></a>
													<p>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S01'}">
															<span class="d-block mb-4 listing-address">장소 : 도봉구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S02'}">
															<span class="d-block mb-4 listing-address">장소 : 은평구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S03'}">
															<span class="d-block mb-4 listing-address">장소 : 동대문구</span>
														</c:if>	
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S04'}">
															<span class="d-block mb-4 listing-address">장소 : 동작구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S05'}">
															<span class="d-block mb-4 listing-address">장소 : 금천구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S06'}">
															<span class="d-block mb-4 listing-address">장소 : 구로구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S07'}">
															<span class="d-block mb-4 listing-address">장소 : 종로구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S08'}">
															<span class="d-block mb-4 listing-address">장소 : 강북구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S09'}">
															<span class="d-block mb-4 listing-address">장소 : 중랑구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S10'}">
															<span class="d-block mb-4 listing-address">장소 : 강남구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S11'}">
															<span class="d-block mb-4 listing-address">장소 : 강서구</span>
														</c:if>
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S12'}">
															<span class="d-block mb-4 listing-address">장소 : 중구 </span>
														</c:if>                                           
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S13'}">           
															<span class="d-block mb-4 listing-address">장소 : 강동구</span>
														</c:if>                                           
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S14'}">           
															<span class="d-block mb-4 listing-address">장소 : 광진구</span>
														</c:if>                                           
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S15'}">           
															<span class="d-block mb-4 listing-address">장소 : 마포구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S16'}">        
															<span class="d-block mb-4 listing-address">장소 : 서초구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S17'}">        
															<span class="d-block mb-4 listing-address">장소 : 성북구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S18'}">        
															<span class="d-block mb-4 listing-address">장소 : 노원구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S19'}">        
															<span class="d-block mb-4 listing-address">장소 : 송파구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S20'}">        
															<span class="d-block mb-4 listing-address">장소 : 서대문구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S21'}">        
															<span class="d-block mb-4 listing-address">장소 : 양천구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S22'}">        
															<span class="d-block mb-4 listing-address">장소 : 영등포구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S23'}">        
															<span class="d-block mb-4 listing-address">장소 : 관악구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S24'}">        
															<span class="d-block mb-4 listing-address">장소 : 성동구</span>
														</c:if>                                        
														<c:if test="${dto ne null && dto.ef_lc eq 'RE_S25'}">        
															<span class="d-block mb-4 listing-address">장소 : 용산구</span>
														</c:if>
													</p>
												</div>
											</div>
											<div class="thingsCaption ">
												<ul class="list-inline captionItem">
													<li><i class="fa fa-heart-o" aria-hidden="true"></i>${dto.ef_read_cnt} </li>
													<li>
														<a href="../event/search?uc_id=${dto.uc_id}">
															<c:if test="${dto.uc_id eq 'NH_ANIMAL'}">
																반려동물
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_GAME'}">
																게임 / 오락
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_TRABEL'}">
																아웃도어 / 여행
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_CULTURE'}">
																문화 / 공연 / 축제
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_FREE'}">
																자유주제
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_READER'}">
																인문학 / 책 / 글
															</c:if>
															<c:if test="${dto.uc_id eq 'NH_LANGUAGE'}">
																외국 / 언어
															</c:if>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
									</c:if>
								</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- COUNT UP SECTION -->
		<section class="clearfix countUpSection">
			<div class="container">
				<div class="page-header text-center">
					<h2>NAWA Current State</h2>
				</div>
				<div class="row">
					<div class="col-sm-3 col-xs-12">
						<div class="text-center countItem">
							<div class="counter">${userCount}</div>
							<div class="counterInfo bg-color-1">함께하는 회원</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12">
						<div class="text-center countItem">
							<div class="counter">${partiUser}</div>
							<div class="counterInfo bg-color-2">참가중인 회원</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12">
						<div class="text-center countItem">
							<div class="counter">${endEvent}</div>
							<div class="counterInfo bg-color-3">진행됐던 이벤트</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12">
						<div class="text-center countItem">
							<div class="counter">${continueEvent}</div>
							<div class="counterInfo bg-color-4">진행중인 이벤트</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="btnArea text-center">
							<a href="../event/search" class="btn btn-primary"><b>둘러보기</b></a>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- WORKS SECTION -->
		<section class="clearfix worksArea">
			<div class="container">
				<div class="page-header text-center">
					<h2>
						TEAM 소개<small>개발하는 침팬치가 실제로는 침팬치가 아니라 사람입니다.</small>
					</h2>
				</div>
				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<div class="thumbnail text-center worksContent">
							<img src="../resources/img/works/works-1.png" alt="Image works">
							<div class="caption">
								<h3>JISU YANG</h3>
								<p>Project Manager</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="thumbnail text-center worksContent">
							<img src="../resources/img/works/works-2.png" alt="Image works">
							<div class="caption">
								<h3>EUNJU HWANG</h3>
								<p>Principal Engineer</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="thumbnail text-center worksContent">
							<img src="../resources/img/works/works-3.png" alt="Image works">
							<div class="caption">
								<h3>JONGTAEK OH</h3>
								<p>Event Module</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="thumbnail text-center worksContent">
							<img src="../resources/img/works/works-4.png" alt="Image works">
							<div class="caption">
								<h3>AEJEONG SHIN</h3>
								<p>Participate Module</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="thumbnail text-center worksContent">
							<img src="../resources/img/works/works-5.png" alt="Image works">
							<div class="caption">
								<h3>CHANGHOON LEE</h3>
								<p>Member Module</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="thumbnail text-center worksContent">
							<img src="../resources/img/works/works-6.png" alt="Image works">
							<div class="caption">
								<h3>SOOJUNG KIM</h3>
								<p>Communication Module</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</section>

		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

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

