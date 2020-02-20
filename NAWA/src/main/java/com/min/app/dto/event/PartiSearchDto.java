package com.min.app.dto.event;

import java.io.Serializable;

// 이벤트 참가자 조회 DTO
public class PartiSearchDto implements Serializable{
	
	private static final long serialVersionUID = -6231166780286239372L;
	
	private String mr_name;
	private String mi_phone;
	private String mr_email;
	private String ep_auth;
	private String ei_agree;
	private String mr_id;
	
	public PartiSearchDto() {
		// TODO Auto-generated constructor stub
	}

	public PartiSearchDto(String mr_name, String mi_phone, String mr_email, String ep_auth, String ei_agree,
			String mr_id) {
		super();
		this.mr_name = mr_name;
		this.mi_phone = mi_phone;
		this.mr_email = mr_email;
		this.ep_auth = ep_auth;
		this.ei_agree = ei_agree;
		this.mr_id = mr_id;
	}

	public String getMr_name() {
		return mr_name;
	}

	public void setMr_name(String mr_name) {
		this.mr_name = mr_name;
	}

	public String getMi_phone() {
		return mi_phone;
	}

	public void setMi_phone(String mi_phone) {
		this.mi_phone = mi_phone;
	}

	public String getMr_email() {
		return mr_email;
	}

	public void setMr_email(String mr_email) {
		this.mr_email = mr_email;
	}

	public String getEp_auth() {
		return ep_auth;
	}

	public void setEp_auth(String ep_auth) {
		this.ep_auth = ep_auth;
	}

	public String getEi_agree() {
		return ei_agree;
	}

	public void setEi_agree(String ei_agree) {
		this.ei_agree = ei_agree;
	}

	public String getMr_id() {
		return mr_id;
	}

	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}

	@Override
	public String toString() {
		return "PartiSearchDto [mr_name=" + mr_name + ", mi_phone=" + mi_phone + ", mr_email=" + mr_email + ", ep_auth="
				+ ep_auth + ", ei_agree=" + ei_agree + ", mr_id=" + mr_id + "]";
	}
	
	
	
	
}
