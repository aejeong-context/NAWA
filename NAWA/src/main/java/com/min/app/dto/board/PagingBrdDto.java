package com.min.app.dto.board;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PagingBrdDto {

	Logger logger = LoggerFactory.getLogger(PagingBrdDto.class);

	private int pageCnt;		// 출력할 페이지번호 갯수
	private int index;			// 출력할 페이지번호
	private int pageStartNum;	// 출력할 페이지 시작 번호
	private int listCnt;		// 출력할 리스트 갯수
	private int total;			// 리스트 총 갯수	
	
	{
		pageCnt = 5;
		index = 0;
		pageStartNum = 1;
		listCnt = 5;
	}
	
	public PagingBrdDto() {}
	public PagingBrdDto(String index, String pageStartNum, String listCnt) {
		if(index != null){
			this.index = Integer.parseInt(index);
		}
		if(pageStartNum != null){
			this.pageStartNum = Integer.parseInt(pageStartNum);
		}
		if(listCnt != null){
			this.listCnt = Integer.parseInt(listCnt);
		}
	}
	
	public int getStart() {
		return index*listCnt+1;
	}
	public int getLast() {
		return (index*listCnt)+listCnt;
	}
	public int getPageLastNum() {
		int remainListCnt = total-listCnt*(pageStartNum-1);
		int remainPageCnt = remainListCnt/listCnt;
		if(remainListCnt%listCnt != 0) {
			remainPageCnt++;
		}
		int pageLastNum = 0;
		if(remainListCnt <= listCnt) {
			pageLastNum = pageStartNum;
		}else if(remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt+pageStartNum-1;
		}else {
			pageLastNum = pageCnt+pageStartNum-1;
		}
		return pageLastNum;
	}
	
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPageStartNum() {
		return pageStartNum;
	}
	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	@Override
	public String toString() {
		return "PagingDto [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
				+ listCnt + ", total=" + total + "]";
	}
	
	
}
