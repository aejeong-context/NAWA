package com.min.app.dto.event;

import java.io.Serializable;

import com.min.app.dto.board.PagingBrdDto;

public class SearchEvtDto extends PagingBrdDto implements Serializable{

	private static final long serialVersionUID = -4871919269472634949L;


	private String ef_title;	// 이벤트명
	private String ef_lc;		// 지역
	private String uc_id;		// 카테고리
	private String ef_order;	// 정렬
	
	@Override
	public int getStart() {
		return super.getStart();
	}
	@Override
	public int getLast() {
		return super.getLast();	
	}
	@Override
	public int getPageLastNum() {
		return super.getPageLastNum();
	}
	@Override
	public int getPageCnt() {
		return super.getPageCnt();
	}
	@Override
	public void setPageCnt(int pageCnt) {
		super.setPageCnt(pageCnt);
	}
	@Override
	public int getIndex() {
		return super.getIndex();
	}
	@Override
	public void setIndex(int index) {
		super.setIndex(index);
	}
	@Override
	public int getPageStartNum() {
		return super.getPageStartNum();
	}
	@Override
	public void setPageStartNum(int pageStartNum) {
		super.setPageStartNum(pageStartNum);
	}
	@Override
	public int getListCnt() {
		return super.getListCnt();
	}
	@Override
	public void setListCnt(int listCnt) {
		super.setListCnt(listCnt);
	}
	@Override
	public int getTotal() {
		return super.getTotal();
	}
	@Override
	public void setTotal(int total) {
		super.setTotal(total);
	}
	
	public String getUc_id() {
		return uc_id;
	}
	public void setUc_id(String uc_id) {
		this.uc_id = uc_id;
	}
	public String getEf_order() {
		return ef_order;
	}
	public void setEf_order(String ef_order) {
		this.ef_order = ef_order;
	}
	public String getEf_lc() {
		return ef_lc;
	}
	public void setEf_lc(String ef_lc) {
		this.ef_lc = ef_lc;
	}
	public String getEf_title() {
		return ef_title;
	}
	public void setEf_title(String ef_title) {
		this.ef_title = ef_title;
	}
	public SearchEvtDto(String ef_title, String ef_lc, String uc_id, String ef_order) {
		super();
		this.ef_title = ef_title;
		this.ef_lc = ef_lc;
		this.uc_id = uc_id;
		this.ef_order = ef_order;
	}
	@Override
	public String toString() {
		return "SearchEvtDto [ef_title=" + ef_title + ", ef_lc=" + ef_lc + ", uc_id=" + uc_id + ", ef_order=" + ef_order
				+ "]";
	}
	
	public SearchEvtDto() {
	}
	
	

}
