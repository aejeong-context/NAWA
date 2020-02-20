package com.min.app.dto.event;

import java.io.Serializable;

public class InviteEvtDto implements Serializable {

	private static final long serialVersionUID = 3589604973070866645L;

	private String ef_id;
	private String mi_nck;
	private String ei_agree;
	private String mr_id;
	private String ep_auth;
	
	public InviteEvtDto() {
	}

	public InviteEvtDto(String ef_id, String mi_nck, String ei_agree, String mr_id, String ep_auth) {
		super();
		this.ef_id = ef_id;
		this.mi_nck = mi_nck;
		this.ei_agree = ei_agree;
		this.mr_id = mr_id;
		this.ep_auth = ep_auth;
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

	public String getEp_auth() {
		return ep_auth;
	}

	public void setEp_auth(String ep_auth) {
		this.ep_auth = ep_auth;
	}

	@Override
	public String toString() {
		return "InviteEvtDto [ef_id=" + ef_id + ", mi_nck=" + mi_nck + ", ei_agree=" + ei_agree + ", mr_id=" + mr_id
				+ ", ep_auth=" + ep_auth + "]";
	}
	
	
}
