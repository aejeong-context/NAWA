<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>EVENT - DETAIL</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<link href="../resources/css/event.css" rel="stylesheet">
<style type="text/css">
.box {
    position: relative; 
    width: 40px; 
    height: 40px; 
    overflow: hidden;
    border-radius: 50%;
    float: left;
}
.profile {
    width: 40px; height: 40px;
    object-fit: cover;
    object-position: top;

}

.insert{
	float:right;
	color: #fff;
	text-transform: uppercase;
    font-family: poppins,sans-serif;
    background-color: #ffa019;
    border-color: #ffa019;
   font-weight: 500;
   border: 1px solid transparent;
    padding: 15px 25px;
    font-size: 14px;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>
</head>


<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Listing sidebar map half - Listty</title>
</head>

<body id="body" class="body-wrapper boxed-menu">
	<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>

	<div class="main-wrapper">
		<!-- HEADER -->


		<!-- LISTINGS DETAILS TITLE SECTION -->
		<section class="clearfix paddingAdjustBottom" id="listing-details">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="listingTitleArea">
							<h2>${edto.ef_title}</h2>
							<div class="listingReview">
								<ul class="list-inline rating">
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</ul>

								<ul class="list-inline captionItem">
									<li><i class="fa fa-eye" aria-hidden="true"></i>
										${edto.ef_read_cnt}</li>
									<li><i class="fa fa-user" aria-hidden="true"></i>
										${edto.ef_num_cnt}</li>
									<li>이메일 : ${email}</li>
									<li>연락처 : ${phone}</li>

									<li><i class="" aria-hidden="true"></i>개최일 : <fmt:parseDate
											var="dateString" value="${edto.ef_event_start}"
											pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dateString}"
											pattern="yyyy.MM.dd" /></li>
									<!-- 이벤트 정보 : 마감일 (안뿌려져있어서 뿌림) -->
									<c:if
										test="${edto.ef_status eq 'O' || edto.ef_status eq 'A' || edto.ef_status eq 'E'}">
										<li><i class="" aria-hidden="true"></i>마감일 : <fmt:parseDate
												var="dateString" value="${edto.ef_deadline}"
												pattern="yyyy-MM-dd" /> <fmt:formatDate
												value="${dateString}" pattern="yyyy.MM.dd" /></li>
									</c:if>
									<li><c:if test="${edto.ef_status eq 'O'}">
									상태 : 모집중
								</c:if> <c:if test="${edto.ef_status eq 'A'}">
									상태 : 추가모집
								</c:if> <c:if test="${edto.ef_status eq 'C'}">
									상태 : 마감
								</c:if> <c:if test="${edto.ef_status eq 'E'}">
									상태 : 조기마감
								</c:if></li>
								</ul>


								<form id="FT">
									<input type="hidden" id="ef_id" value="${edto.ef_id}">
									<input type="hidden" id="ef_status" value="${edto.ef_status}">
									<input type="hidden" id="mi_nck" value="${mi}"> <input
										type="hidden" value="${eventCreateNick}">
								</form>
							</div>
							<div>
								<c:if test="${LDto ne null && LDto.mr_auth eq 'A'}">
									<button type="button" id="event_Close" class="btn btn-primary"
										onclick="event_Close();">이벤트 폐쇄</button>
								</c:if>

								<c:if
									test="${LDto ne null && LDto.mr_auth eq 'U' && mi eq eventCreateNick && mi ne null && eventCreateNick ne null}">
									<button type="button" id="event_Delete" class="btn btn-primary"
										onclick="event_Delete();">이벤트 삭제</button>
								</c:if>

								<c:if
									test="${LDto ne null && LDto.mr_auth eq 'U' && mi eq eventCreateNick && mi ne null && eventCreateNick ne null}">
									<button type="button" id="event_Modify" class="btn btn-primary"
										onclick="event_Modify();">이벤트 수정</button>
								</c:if>

								<c:if
									test="${LDto ne null && LDto.mr_auth eq 'U' && mi eq eventCreateNick && edto.ef_status eq 'C' && mi ne null && eventCreateNick ne null}">
									<button type="button" id="event_ReCreate"
										class="btn btn-primary" onclick="event_ReCreate();">이벤트
										재개설</button>
								</c:if>

								<c:if
									test="${LDto ne null && LDto.mr_auth eq 'U' && mi eq eventCreateNick && mi ne null && eventCreateNick ne null}">
									<button type="button" id="event_Enter_Search"
										class="btn btn-primary" onclick="event_Enter_Search();">이벤트
										참가자 조회</button>
								</c:if>
								<!-- 비회원일때 -->
								<c:if test="${LDto eq null}">
									<button type="button" id="event_Enter_Login"
										class="btn btn-primary" onclick="event_Enter_Login();">이벤트
										참가</button>
								</c:if>
								<!-- 로그인상태, 유저일때 , 개설자가 아닐때, 이벤트상태가 O일때, 해당 이벤트에 참가상태가 아닐때 -->
								<c:if
									test="${LDto ne null&& LDto.mr_auth eq 'U' && mi ne eventCreateNick && edto.ef_status eq 'O' && checkjoined eq 'n'}">
									<button type="button" id="event_Enter_Real"
										class="btn btn-primary" onclick="chk()">이벤트 참가</button>
								</c:if>
								<!-- 로그인상태, 해당 이벤트에 참가중일때 -->
								<c:if test="${LDto ne null && checkjoined eq LDto.mi_nck}">
									<button type="submit" class="btn btn-primary"
										onclick="eventout()">참가취소</button>
								</c:if>


								<!-- 로그인상태, 이벤트 상태e, 해당 이벤트에 대기참가 아닐때 -->
								<c:if
									test="${LDto ne null && edto.ef_status eq 'E' && wcheckjoined eq 'n' &&checkjoined ne LDto.mi_nck}">
									<button type="submit" id="event_wating" class="btn btn-primary"
										onclick="echk()">대기 참가하기</button>
								</c:if>



								<!-- 로그인상태, 해당이벤트에 대기참가중일때 -->
								<c:if test="${LDto ne null && wcheckjoined eq LDto.mi_nck}">
									<button type="submit" class="btn btn-primary"
										onclick="watingOut()">대기취소하기</button>
								</c:if>

								<button type="button" id="event_Main" class="btn btn-primary"
									onclick="event_Main();">리스트로</button>
								</div>	
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- LISTINGS DETAILS INFO SECTION -->
		<section class="clearfix paddingAdjustTop">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-xs-12">
						<div class="listDetailsInfo">
							<div class="detailsInfoBox">
								<h3 style="padding-bottom: 100px;">상세내용</h3>
								<c:forEach items="${fdto}" var="fdto">
									<img src="../upload/${fdto.fi_storedname}"
										class="img-responsive"><br>
								</c:forEach>
								<p>${edto.ef_con}</p>
							</div>
							<div class="detailsInfoBox">
								<h3>참가조건</h3>
								<ul class="list-inline featuresItems">
									<!-- 참가조건 가져와서 delims를 기준으로 짤라서 for문 돌림! -->
									<c:forTokens items="${edto.ef_attend_con}" delims=","
										var="item">
										<li><i class="fa fa-check-circle-o" aria-hidden="true"></i>
											${item}</li>
									</c:forTokens>
								</ul>
							</div>
							<div class="detailsInfoBox" style="height: 150px;">
			                  <h3>참가중인 회원</h3>
			                  <c:forEach items="${plist}" var="plist">
			                  <div class="box" style="margin-right: 3px;">
			                  <img src="../upload/${plist.fi_storedname}" class="profile">
			                  </div>
			                  </c:forEach>
			               </div>
							<div class="detailsInfoBox">
								<h3>문의</h3>
								<div id="insertquiryList"></div>
							</div>

							<div class="detailsInfoBox">
								<h3>문의 작성</h3>
								<form id="insertInquiry">
									<input type="hidden" value="${edto.ef_id}" name="ef_id">
									<input type="hidden" value="${mi}" name="mi_nck" id="mi_nck">
									<input type="hidden" value="${ep_auth}" id="ep_auth">
									<div class="formSection formSpace" style="width: 700px;">
										<div class="form-group">
											<textarea style='width: 700px' rows='3' cols='20'
												class="form-control" placeholder="Comment" id="inquiry"
												name="eb_con"></textarea>
										</div>
										<div class="form-group mb0">
											<input type="button" onclick="inQuiry()"
												class="insert" value="send" id="primary">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="clearfix map-sidebar map-right">
							<div id="map"
								style="position: relative; margin: 0; padding: 0; height: 538px; max-width: none;"></div>
							<br>
							<hr>
							<input type="text" style="border: none; width: 300px;"
								readonly="readonly" value="" id="listingAddress">
						</div>
						<c:if test="${edto.ef_status eq 'C'}">
							<div class="listSidebar">
								<h3>후기</h3>
								<ul class="list-unstyled sidebarList" id="insertreviewList">

								</ul>
							</div>

							<c:if test="${ep_auth eq 'A'|| ep_auth eq 'I'}">
								<div class="listSidebar">
									<h3>후기 작성</h3>
									<form id="insertReview">
										<input type="hidden" value="${edto.ef_id}" name="ef_id">
										<input type="hidden" value="${mi}" name="mi_nck">
										<ul>
											<li><textarea
													style='margin: 0px; width: 261px; height: 74px;'
													placeholder="Review" class="form-control" id="review"
													name="eb_con"></textarea> <input type="button"
												onclick="inReview()" class="insert" value="send"
												style="margin-top: 20px;"></li>
										</ul>
									</form>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
		</section>

		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

		<!-- JAVASCRIPTS -->
		<script src="../resources/plugins/jquery/jquery.min.js"></script>
		<script src="../resources/plugins/selectric/jquery.selectric.min.js"></script>
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

		<!-- kakao_Map -->
		<script type="text/javascript"
			src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=431e0af1ef52398982b0d15439c85648&libraries=services"></script>
		<script src="../resources/js/kakao_map.js"></script>
		<script type="text/javascript">
			var ef_lc = "${edto.ef_lc_detail }";
			setMap(ef_lc.split(',')[0], ef_lc.split(',')[1], 3);
			setMarker(ef_lc.split(',')[0], ef_lc.split(',')[1]);
			setMapControl();
			printAddress(ef_lc.split(',')[0], ef_lc.split(',')[1]);
		</script>
		<script src="../resources/js/app.js"></script>
		<script src="../resources/js/eventDetail.js"></script>
		<script src="../resources/js/event_board.js"></script> 

		

	</div>

</body>

</html>
