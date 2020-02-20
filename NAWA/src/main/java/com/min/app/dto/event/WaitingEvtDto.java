package com.min.app.dto.event;

import java.io.Serializable;

public class WaitingEvtDto implements Serializable{
	
	private static final long serialVersionUID = -1564068219664394135L;
	
	private String ef_id;
	private String mi_nck;
	private int ew_wait_cnt;
	
	public WaitingEvtDto() {
	}
	
	public WaitingEvtDto(String ef_id, String mi_nck, int ew_wait_cnt) {
		super();
		this.ef_id = ef_id;
		this.mi_nck = mi_nck;
		this.ew_wait_cnt = ew_wait_cnt;
	}

	public String getEf_id() {
		return ef_id;
	}

	public void setEf_id(String ef_id) {
		this.ef_id = ef_id;
	}

	public String getMi_nck() {
		return mi_nck;
	}

	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}

	public int getEw_wait_cnt() {
		return ew_wait_cnt;
	}

	public void setEw_wait_cnt(int ew_wait_cnt) {
		this.ew_wait_cnt = ew_wait_cnt;
	}

	@Override
	public String toString() {
		return "WaitingEvtDto [ef_id=" + ef_id + ", mi_nck=" + mi_nck + ", ew_wait_cnt=" + ew_wait_cnt + "]";
	}
	
}
