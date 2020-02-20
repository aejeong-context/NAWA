package com.min.app.dto.member;

import java.io.Serializable;

public class UpdateMemDto implements Serializable{

	private static final long serialVersionUID = -6315707198966659901L;
	
	private String mr_id;
	private String mr_email;
	private String mi_nck;
	private String mi_phone;
	private String mi_profile;
	private String mi_lc;
	private String mi_interest;
	
	public UpdateMemDto() {
	}

	public UpdateMemDto(String mr_id, String mr_email, String mi_nck, String mi_phone, String mi_profile, String mi_lc,
			String mi_interest) {
		super();
		this.mr_id = mr_id;
		this.mr_email = mr_email;
		this.mi_nck = mi_nck;
		this.mi_phone = mi_phone;
		this.mi_profile = mi_profile;
		this.mi_lc = mi_lc;
		this.mi_interest = mi_interest;
	}

	@Override
	public String toString() {
		return "UpdateMemDto [mr_id=" + mr_id + ", mr_email=" + mr_email + ", mi_nck=" + mi_nck + ", mi_phone="
				+ mi_phone + ", mi_profile=" + mi_profile + ", mi_lc=" + mi_lc + ", mi_interest=" + mi_interest + "]";
	}

	public String getMr_id() {
		return mr_id;
	}

	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
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



	
	
	
}
