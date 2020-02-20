// submit
function frmPaging() {
	document.getElementById("frmPaging").submit();
}

// 이전 페이지 index 
function pagePre(index, pageCnt) {
	if (0 < index - pageCnt) { 
		index = index - pageCnt;
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
	var pageStartNum = 0;
	if(total/listCnt < pageCnt){
		pageStartNum = 1;
	}else{
		pageStartNum = (pageCnt*(Math.ceil(totalPageCnt / pageCnt) -1)+1); 
	}
	document.getElementById("pageStartNum").value = pageStartNum;
	document.getElementById("index").value = totalPageCnt - 1;
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