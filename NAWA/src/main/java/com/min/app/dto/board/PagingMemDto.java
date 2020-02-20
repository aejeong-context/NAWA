package com.min.app.dto.board;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PagingMemDto {

	Logger logger = LoggerFactory.getLogger(PagingMemDto.class);

	private int pageCnt;		// 출력할 페이지번호 갯수
	private int index;			// 출력할 페이지번호
	private int pageStartNum;	// 출력할 페이지 시작 번호
	private int listCnt;		// 출력할 리스트 갯수
	private int total;			// 리스트 총 갯수	
	
	{
		logger.info("========================================================페이징DTO 초기화블럭 실행 시간 : "+(new Date())+"========================================================");
		pageCnt = 5;
		index = 0;
		pageStartNum = 1;
		listCnt = 10;
	}
	
	public PagingMemDto() {}
	public PagingMemDto(String index, String pageStartNum, String listCnt) {
		logger.info("========================================================페이징DTO 생성자 호출 시간 : "+(new Date())+"========================================================");
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
		logger.info("========================================================페이징DTO getStart() 호출 시간 : "+(new Date())+"========================================================");
		return index*listCnt+1;
	}
	public int getLast() {
		logger.info("========================================================페이징DTO getLast() 호출 시간 : "+(new Date())+"========================================================");
		return (index*listCnt)+listCnt;
	}
	public int getPageLastNum() {
		logger.info("========================================================페이징DTO getPageLastNum() 호출 시간 : "+(new Date())+"========================================================");
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
		logger.info("========================================================페이징DTO getPageCnt() 호출 시간 : "+(new Date())+"========================================================");
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getIndex() {
		logger.info("========================================================페이징DTO getIndex() 호출 시간 : "+(new Date())+"========================================================");
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPageStartNum() {
		logger.info("========================================================페이징DTO getPageStartNum() 호출 시간 : "+(new Date())+"========================================================");
		return pageStartNum;
	}
	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public int getListCnt() {
		logger.info("========================================================페이징DTO getListCnt() 호출 시간 : "+(new Date())+"========================================================");
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getTotal() {
		logger.info("========================================================페이징DTO getTotal() 호출 시간 : "+(new Date())+"========================================================");
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
