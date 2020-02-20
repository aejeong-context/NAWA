<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html lang="kr">
<head>
<!-- SITE TITTLE -->
<title>PROJECT : NAWA</title>
<%@ include file="/WEB-INF/views/layout/meta.jsp"%>

<script src="../resources/js/paging.js"></script>
<link href="../resources/css/noticeboard.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
    $( ".btn-moreInfo").on( "click", function() {
      $(".info_data" ).switchClass( "info_data", "anotherNewClass", 100 );
      $( ".anotherNewClass" ).switchClass( "anotherNewClass", "info_data", 100 );
    });
  } );
 </script>

<script type="text/javascript">


function del(seq) {
	var check = confirm("삭제하시겠습니까?");
	if(check){
	location.href="./delete?seq="+seq;
	}
}
function modify(seq) {
	
	location.href="./modifyform?seq="+seq;	
	
}
function noticeWrite() {
	
	location.href = "./writeform";
	
}

</script>



<body id="body" class="body-wrapper boxed-menu">

	<div class="main-wrapper">
		<%@ include file="/WEB-INF/views/layout/header-white.jsp"%>

		<!-- BLOG SECTION -->

		<section class="clearfix" style="padding: 50px 50px 0px 50px;">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-xs-12">


						<c:if test="${LDto ne null && LDto.mr_auth eq 'A'}">
							<button type="button" class="btn btn-primary btn-custom"
								onclick="noticeWrite()">글쓰기</button>
						</c:if>



					</div>
				</div>
			</div>
		</section>
		<form action="../notice/list" method="post" id='frmPaging'>
			<c:forEach var="list" items="${lists}" varStatus="status">

				<section class="clearfix" style="padding: 50px;">
					<div class="container">
						<div class="row">
							<div class="col-sm-8 col-xs-12">
								<div class="blogInnerWrapper">
									<div class="thumbnail blogInner">

										<div class="caption">
											<h4>${list.uc_name}</h4>
											<h4>
												<!-- 날짜 화면 출력 변경 -->
												<fmt:formatDate value="${list.nb_rgd}" type="both"
													dateStyle="default" timeStyle="default"></fmt:formatDate>
												by <span style="color: #ffa019;">Admin</span>
											</h4>

											<h3>
												<c:out value="${list.nb_title}" />
											</h3>
											<c:forEach var="flist1" items="${flist[status.index]}">
												<img src="../upload/${flist1.fi_storedname}" style="width: 400px;">
												<br>
											</c:forEach>
											<div class="details">
												<div id="effect" class="info_data">
													<h4>
														<c:out value="${list.nb_con}" escapeXml="false" />
													</h4>
												</div>
												<c:if test="${fn:length(list.nb_con)>400}">
													<span class="btn-moreInfo">더보기</span>
												</c:if>
											</div>
										</div>
										<c:if test="${LDto ne null && LDto.mr_auth eq 'A'}">
											<button type="button" class="btn btn-primary btn-custom"
												onclick="modify('${list.nb_seq}')">변경</button>
											<button type="button" class="btn btn-primary btn-custom"
												style="background: #FE5656;" onclick="del('${list.nb_seq}')">삭제</button>
										</c:if>

									</div>
								</div>

							</div>
						</div>
					</div>
				</section>

			</c:forEach>

			<!-- 페이징 뷰 -->
			<input type='hidden' name='index' id='index' value='${paging.index}'>
			<input type='hidden' name='pageStartNum' id='pageStartNum'
				value='${paging.pageStartNum}'> <input type='hidden'
				name='listCnt' id='listCnt' value='${paging.listCnt}'>
			<div class="paginationCommon blogPagination"
				style="margin: auto; width: 400px; top: 10px">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true"
								onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'><i
									class="fa fa-angle-left" aria-hidden="true"></i></span>
						</a></li>

						<c:forEach var='i' begin="${paging.pageStartNum}"
							end="${paging.pageLastNum}" step="1">
							<li class="active"><a href='#' onclick='pageIndex(${i});'>${i}</a></li>
						</c:forEach>

						<li><a href="#" aria-label="Next"
							onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>
								<span aria-hidden="true"><i class="fa fa-angle-right"
									aria-hidden="true"></i></span>
						</a></li>

					</ul>
				</nav>

			</div>
		</form>
	</div>



	<!-- FOOTER -->
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

