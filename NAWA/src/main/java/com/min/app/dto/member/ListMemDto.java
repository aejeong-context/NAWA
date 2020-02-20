package com.min.app.dto.member;

import java.io.Serializable;

public class ListMemDto implements Serializable{

	private static final long serialVersionUID = 4884183488682424449L;
	
	private String mr_id;
	private String mr_name;
	private String mr_email;
	private String mi_nck;
	private String mr_rgd;
	private String mr_dfl;
	private String mr_visited;
	private String mi_condition;
	private String mr_auth;
	private String mi_phone;
	private String mi_lc;
	private String mi_interest;
	private String mi_profile;
	private int mi_attend_cnt;
	private int mi_open_cnt;
	
	public ListMemDto() {
	}

	public ListMemDto(String mr_id, String mr_name, String mr_email, String mi_nck, String mr_rgd, String mr_dfl,
			String mr_visited, String mi_condition, String mr_auth, String mi_phone, String mi_lc, String mi_interest,
			String mi_profile, int mi_attend_cnt, int mi_open_cnt) {
		super();
		this.mr_id = mr_id;
		this.mr_name = mr_name;
		this.mr_email = mr_email;
		this.mi_nck = mi_nck;
		this.mr_rgd = mr_rgd;
		this.mr_dfl = mr_dfl;
		this.mr_visited = mr_visited;
		this.mi_condition = mi_condition;
		this.mr_auth = mr_auth;
		this.mi_phone = mi_phone;
		this.mi_lc = mi_lc;
		this.mi_interest = mi_interest;
		this.mi_profile = mi_profile;
		this.mi_attend_cnt = mi_attend_cnt;
		this.mi_open_cnt = mi_open_cnt;
	}

	public String getMr_id() {
		return mr_id;
	}

	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}

	public String getMr_name() {
		return mr_name;
	}

	public void setMr_name(String mr_name) {
		this.mr_name = mr_name;
	}

	public String getMr_email() {
		return mr_email;
	}

	public void setMr_email(String mr_email) {
		this.mr_email = mr_email;
	}

	public String getMi_nck() {
		return mi_nck;
	}

	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}

	public String getMr_rgd() {
		return mr_rgd;
	}

	public void setMr_rgd(String mr_rgd) {
		this.mr_rgd = mr_rgd;
	}

	public String getMr_dfl() {
		return mr_dfl;
	}

	public void setMr_dfl(String mr_dfl) {
		this.mr_dfl = mr_dfl;
	}

	public String getMr_visited() {
		return mr_visited;
	}

	public void setMr_visited(String mr_visited) {
		this.mr_visited = mr_visited;
	}

	public String getMi_condition() {
		return mi_condition;
	}

	public void setMi_condition(String mi_condition) {
		this.mi_condition = mi_condition;
	}

	public String getMr_auth() {
		return mr_auth;
	}

	public void setMr_auth(String mr_auth) {
		this.mr_auth = mr_auth;
	}

	public String getMi_phone() {
		return mi_phone;
	}

	public void setMi_phone(String mi_phone) {
		this.mi_phone = mi_phone;
	}

	public String getMi_lc() {
		return mi_lc;
	}

	public void setMi_lc(String mi_lc) {
		this.mi_lc = mi_lc;
	}

	public String getMi_interest() {
		return mi_interest;
	}

	public void setMi_interest(String mi_interest) {
		this.mi_interest = mi_interest;
	}

	public String getMi_profile() {
		return mi_profile;
	}

	public void setMi_profile(String mi_profile) {
		this.mi_profile = mi_profile;
	}

	public int getMi_attend_cnt() {
		return mi_attend_cnt;
	}

	public void setMi_attend_cnt(int mi_attend_cnt) {
		this.mi_attend_cnt = mi_attend_cnt;
	}

	public int getMi_open_cnt() {
		return mi_open_cnt;
	}

	public void setMi_open_cnt(int mi_open_cnt) {
		this.mi_open_cnt = mi_open_cnt;
	}

	@Override
	public String toString() {
		return "ListMemDto [mr_id=" + mr_id + ", mr_name=" + mr_name + ", mr_email=" + mr_email + ", mi_nck=" + mi_nck
				+ ", mr_rgd=" + mr_rgd + ", mr_dfl=" + mr_dfl + ", mr_visited=" + mr_visited + ", mi_condition="
				+ mi_condition + ", mr_auth=" + mr_auth + ", mi_phone=" + mi_phone + ", mi_lc=" + mi_lc
				+ ", mi_interest=" + mi_interest + ", mi_profile=" + mi_profile + ", mi_attend_cnt=" + mi_attend_cnt
				+ ", mi_open_cnt=" + mi_open_cnt + "]";
	}
	
	
}
