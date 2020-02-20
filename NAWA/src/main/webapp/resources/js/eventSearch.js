// submit
function frmPaging() {
	document.getElementById("frmPaging").submit();
}
// 이전 페이지 index
function pagePre(index, pageCnt) {
	if (0 < index - pageCnt) {
		index = index-pageCnt;
		document.getElementById("pageStartNum").value = index;
		document.getElementById("index").value = index - 1;
		frmPaging();
	}
}
// 다음 페이지 index
function pageNext(index, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	var max = Math.ceil(totalPageCnt / pageCnt);
	if (max * pageCnt > index + pageCnt) {
		index += pageCnt;
		document.getElementById("pageStartNum").value = index;
		document.getElementById("index").value = index - 1;
		frmPaging();
	}
}
// 마지막 페이지 index
function pageLast(index, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	var max = Math.ceil(totalPageCnt / pageCnt);
	while (max * pageCnt > index + pageCnt) {
		index += pageCnt;
	}
	document.getElementById("pageStartNum").value = index;
	document.getElementById("index").value = index - 1;
	frmPaging();
}
// index 리스트 처리
function pageIndex(pageStartNum) {
	document.getElementById("index").value = pageStartNum - 1;
	frmPaging();
}
// 리스트출력개수 처리
function listCnt() {
	document.getElementById("index").value = 0;
	document.getElementById("pageStartNum").value = 1;
	document.getElementById("listCnt").value = document.getElementById("listCount").value;
	frmPaging();
}

// 정렬 처리
function eventOrder() {
	document.getElementById("ef_order").value = document.getElementById("ef_order1").value;
	var ef_order = document.getElementById("ef_order").value;
	alert(ef_order);
	frmPaging();
}

function eventSearch() {
	var ef_select1 = document.getElementById("ef_select1").value;
	var uc_id1 = document.getElementById("uc_id1").value;
	var keyword1 = document.getElementById("keywordInput1").value;
	
	document.getElementById("ef_select").setAttribute('value', ef_select1);
	document.getElementById("uc_id").setAttribute('value', uc_id1);
	document.getElementById("keywordInput").setAttribute('value', keyword1);
	
	document.getElementById("frmPaging").submit();
}


function eventChange() {
	var ef_select1 = document.getElementById("ef_select1").value;
	var uc_id1 = document.getElementById("uc_id1").value;
	var keyword1 = document.getElementById("keywordInput1").value;
	
	var ef_select = document.getElementById("ef_select").value = ef_select1;
	var uc_id = document.getElementById("uc_id").value = uc_id1;
	var keyword = document.getElementById("keywordInput").value = keyword1;
}

