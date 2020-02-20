package com.min.app.dto.member;

import java.io.Serializable;

public class LoginMemDto implements Serializable{

	private static final long serialVersionUID = 7851376813418333185L;
	
	private String mr_id;
	private String mi_nck;
	private String mr_auth;
	private String mi_profile;
	private String mr_dfl;
	private String mi_condition;
	private String mi_lc;
	private String mr_platform;
	
	
	
	public LoginMemDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginMemDto(String mr_id, String mi_nck, String mr_auth, String mi_profile, String mr_dfl,
			String mi_condition, String mi_lc, String mr_platform) {
		super();
		this.mr_id = mr_id;
		this.mi_nck = mi_nck;
		this.mr_auth = mr_auth;
		this.mi_profile = mi_profile;
		this.mr_dfl = mr_dfl;
		this.mi_condition = mi_condition;
		this.mi_lc = mi_lc;
		this.mr_platform = mr_platform;
	}
	public String getMr_id() {
		return mr_id;
	}
	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}
	public String getMi_nck() {
		return mi_nck;
	}
	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}
	public String getMr_auth() {
		return mr_auth;
	}
	public void setMr_auth(String mr_auth) {
		this.mr_auth = mr_auth;
	}
	public String getMi_profile() {
		return mi_profile;
	}
	public void setMi_profile(String mi_profile) {
		this.mi_profile = mi_profile;
	}
	public String getMr_dfl() {
		return mr_dfl;
	}
	public void setMr_dfl(String mr_dfl) {
		this.mr_dfl = mr_dfl;
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
	public String getMr_platform() {
		return mr_platform;
	}
	public void setMr_platform(String mr_platform) {
		this.mr_platform = mr_platform;
	}
	@Override
	public String toString() {
		return "LoginMemDto [mr_id=" + mr_id + ", mi_nck=" + mi_nck + ", mr_auth=" + mr_auth + ", mi_profile="
				+ mi_profile + ", mr_dfl=" + mr_dfl + ", mi_condition=" + mi_condition + ", mi_lc=" + mi_lc
				+ ", mr_platform=" + mr_platform + "]";
	}
	
	
}
