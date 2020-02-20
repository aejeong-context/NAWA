package com.min.app.dto.member;

import java.io.Serializable;

public class InformMemDto implements Serializable {

	private static final long serialVersionUID = -5213808493188373948L;

	private String mi_nck;
	private String mr_id;
	private String mi_phone;
	private String mi_profile;
	private String mi_condition;
	private String mi_lc;
	private String mi_interest;
	private int mi_attend_cnt;
	private int mi_open_cnt;
	private int attend_num;
	
	public InformMemDto() {
		super();
	}
	public InformMemDto(String mi_nck, String mr_id, String mi_phone, String mi_profile, String mi_condition,
			String mi_lc, String mi_interest, int mi_attend_cnt, int mi_open_cnt, int attend_num) {
		super();
		this.mi_nck = mi_nck;
		this.mr_id = mr_id;
		this.mi_phone = mi_phone;
		this.mi_profile = mi_profile;
		this.mi_condition = mi_condition;
		this.mi_lc = mi_lc;
		this.mi_interest = mi_interest;
		this.mi_attend_cnt = mi_attend_cnt;
		this.mi_open_cnt = mi_open_cnt;
		this.attend_num = attend_num;
	}
	public String getMi_nck() {
		return mi_nck;
	}
	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}
	public String getMr_id() {
		return mr_id;
	}
	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}
	public String getMi_phone() {
		return mi_phone;
	}
	public void setMi_phone(String mi_phone) {
		this.mi_phone = mi_phone;
	}
	public String getMi_profile() {
		return mi_profile;
	}
	public void setMi_profile(String mi_profile) {
		this.mi_profile = mi_profile;
	}
	public String getMi_condition() {
		return mi_condition;
	}
	public void setMi_condition(String mi_condition) {
		this.mi_condition = mi_condition;
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
	public int getAttend_num() {
		return attend_num;
	}
	public void setAttend_num(int attend_num) {
		this.attend_num = attend_num;
	}
	@Override
	public String toString() {
		return "InformMemDto [mi_nck=" + mi_nck + ", mr_id=" + mr_id + ", mi_phone=" + mi_phone + ", mi_profile="
				+ mi_profile + ", mi_condition=" + mi_condition + ", mi_lc=" + mi_lc + ", mi_interest=" + mi_interest
				+ ", mi_attend_cnt=" + mi_attend_cnt + ", mi_open_cnt=" + mi_open_cnt + ", attend_num=" + attend_num
				+ "]";
	}
}
