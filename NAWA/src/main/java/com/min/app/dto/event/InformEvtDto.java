package com.min.app.dto.event;

import java.io.Serializable;

public class InformEvtDto implements Serializable {

	private static final long serialVersionUID = 7182602200961176659L;
	private int ef_id;
	private String ef_title;
	private String ef_con;
	private String ef_attend_con;
	private int ef_read_cnt;
	private int ef_num_cnt;
	private String ef_deadline;
	private String ef_lc;
	private String uc_id;
	private String ef_open_status;
	private String ef_event_start;
	private String ef_rgd;
	private String ef_status;
	private String ef_close;
	private int ef_retry;
	private int ef_refer;
	private String ef_lc_detail;
	private int attend_num;

	public int getAttend_num() {
		return attend_num;
	}

	public void setAttend_num(int attend_num) {
		this.attend_num = attend_num;
	}


	public int getEf_id() {
		return ef_id;
	}

	public void setEf_id(int ef_id) {
		this.ef_id = ef_id;
	}

	public String getEf_title() {
		return ef_title;
	}

	public void setEf_title(String ef_title) {
		this.ef_title = ef_title;
	}

	public String getEf_con() {
		return ef_con;
	}

	public void setEf_con(String ef_con) {
		this.ef_con = ef_con;
	}

	public String getEf_attend_con() {
		return ef_attend_con;
	}

	public void setEf_attend_con(String ef_attend_con) {
		this.ef_attend_con = ef_attend_con;
	}

	public int getEf_read_cnt() {
		return ef_read_cnt;
	}

	public void setEf_read_cnt(int ef_read_cnt) {
		this.ef_read_cnt = ef_read_cnt;
	}

	public int getEf_num_cnt() {
		return ef_num_cnt;
	}

	public void setEf_num_cnt(int ef_num_cnt) {
		this.ef_num_cnt = ef_num_cnt;
	}

	public String getEf_deadline() {
		return ef_deadline;
	}

	public void setEf_deadline(String ef_deadline) {
		this.ef_deadline = ef_deadline;
	}

	public String getEf_lc() {
		return ef_lc;
	}

	public void setEf_lc(String ef_lc) {
		this.ef_lc = ef_lc;
	}

	public String getUc_id() {
		return uc_id;
	}

	public void setUc_id(String uc_id) {
		this.uc_id = uc_id;
	}

	public String getEf_open_status() {
		return ef_open_status;
	}

	public void setEf_open_status(String ef_open_status) {
		this.ef_open_status = ef_open_status;
	}

	public String getEf_event_start() {
		return ef_event_start;
	}

	public void setEf_event_start(String ef_event_start) {
		this.ef_event_start = ef_event_start;
	}

	public String getEf_rgd() {
		return ef_rgd;
	}

	public void setEf_rgd(String ef_rgd) {
		this.ef_rgd = ef_rgd;
	}

	public String getEf_status() {
		return ef_status;
	}

	public void setEf_status(String ef_status) {
		this.ef_status = ef_status;
	}

	public String getEf_close() {
		return ef_close;
	}

	public void setEf_close(String ef_close) {
		this.ef_close = ef_close;
	}

	public int getEf_retry() {
		return ef_retry;
	}

	public void setEf_retry(int ef_retry) {
		this.ef_retry = ef_retry;
	}

	public int getEf_refer() {
		return ef_refer;
	}

	public void setEf_refer(int ef_refer) {
		this.ef_refer = ef_refer;
	}

	public String getEf_lc_detail() {
		return ef_lc_detail;
	}

	public void setEf_lc_detail(String ef_lc_detail) {
		this.ef_lc_detail = ef_lc_detail;
	}

	public InformEvtDto(int ef_id, String ef_title, String ef_con, String ef_attend_con, int ef_read_cnt,
			int ef_num_cnt, String ef_deadline, String ef_lc, String uc_id, String ef_open_status,
			String ef_event_start, String ef_rgd, String ef_status, String ef_close, int ef_retry, int ef_refer,
			String ef_lc_detail, int attend_num) {
		super();
		this.ef_id = ef_id;
		this.ef_title = ef_title;
		this.ef_con = ef_con;
		this.ef_attend_con = ef_attend_con;
		this.ef_read_cnt = ef_read_cnt;
		this.ef_num_cnt = ef_num_cnt;
		this.ef_deadline = ef_deadline;
		this.ef_lc = ef_lc;
		this.uc_id = uc_id;
		this.ef_open_status = ef_open_status;
		this.ef_event_start = ef_event_start;
		this.ef_rgd = ef_rgd;
		this.ef_status = ef_status;
		this.ef_close = ef_close;
		this.ef_retry = ef_retry;
		this.ef_refer = ef_refer;
		this.ef_lc_detail = ef_lc_detail;
		this.attend_num = attend_num;
	}

	public InformEvtDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "InformEvtDto [ef_id=" + ef_id + ", ef_title=" + ef_title + ", ef_con=" + ef_con + ", ef_attend_con="
				+ ef_attend_con + ", ef_read_cnt=" + ef_read_cnt + ", ef_num_cnt=" + ef_num_cnt + ", ef_deadline="
				+ ef_deadline + ", ef_lc=" + ef_lc + ", uc_id=" + uc_id + ", ef_open_status=" + ef_open_status
				+ ", ef_event_start=" + ef_event_start + ", ef_rgd=" + ef_rgd + ", ef_status=" + ef_status
				+ ", ef_close=" + ef_close + ", ef_retry=" + ef_retry + ", ef_refer=" + ef_refer + ", ef_lc_detail="
				+ ef_lc_detail + ", attend_num=" + attend_num + "]";
	}

	
}
