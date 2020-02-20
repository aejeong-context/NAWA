package com.min.app.dto.member;

import java.io.Serializable;

public class RegistMemDto implements Serializable {

	private static final long serialVersionUID = 4955555489418731031L;

	private String mr_id;
	private String mr_name;
	private String mr_platform;
	private String mr_email;
	private String mr_rgd;
	private String mr_dfl;
	private String mr_auth;
	private String mr_pw;
	private String mr_visited;
	
	public RegistMemDto() {
	}

	public RegistMemDto(String mr_id, String mr_name, String mr_platform, String mr_email, String mr_rgd, String mr_dfl,
			String mr_auth, String mr_pw, String mr_visited) {
		super();
		this.mr_id = mr_id;
		this.mr_name = mr_name;
		this.mr_platform = mr_platform;
		this.mr_email = mr_email;
		this.mr_rgd = mr_rgd;
		this.mr_dfl = mr_dfl;
		this.mr_auth = mr_auth;
		this.mr_pw = mr_pw;
		this.mr_visited = mr_visited;
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

	public String getMr_platform() {
		return mr_platform;
	}

	public void setMr_platform(String mr_platform) {
		this.mr_platform = mr_platform;
	}

	public String getMr_email() {
		return mr_email;
	}

	public void setMr_email(String mr_email) {
		this.mr_email = mr_email;
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

	public String getMr_auth() {
		return mr_auth;
	}

	public void setMr_auth(String mr_auth) {
		this.mr_auth = mr_auth;
	}

	public String getMr_pw() {
		return mr_pw;
	}

	public void setMr_pw(String mr_pw) {
		this.mr_pw = mr_pw;
	}

	public String getMr_visited() {
		return mr_visited;
	}

	public void setMr_visited(String mr_visited) {
		this.mr_visited = mr_visited;
	}

	@Override
	public String toString() {
		return "RegistMemDto [mr_id=" + mr_id + ", mr_name=" + mr_name + ", mr_platform=" + mr_platform + ", mr_email="
				+ mr_email + ", mr_rgd=" + mr_rgd + ", mr_dfl=" + mr_dfl + ", mr_auth=" + mr_auth + ", mr_pw=" + mr_pw
				+ ", mr_visited=" + mr_visited + "]";
	}
	
}
