package com.min.app.dto.event;

import java.io.Serializable;

public class ParticEvtDto implements Serializable {

	private static final long serialVersionUID = -7380008655095213066L;
	private int ef_id;
	private String mi_nck;
	private String ep_auth;

	public ParticEvtDto() {
	}

	public ParticEvtDto(int ef_id, String mi_nck, String ep_auth) {
		super();
		this.ef_id = ef_id;
		this.mi_nck = mi_nck;
		this.ep_auth = ep_auth;
	}

	public int getEf_id() {
		return ef_id;
	}

	public void setEf_id(int ef_id) {
		this.ef_id = ef_id;
	}

	public String getMi_nck() {
		return mi_nck;
	}

	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}

	public String getEp_auth() {
		return ep_auth;
	}

	public void setEp_auth(String ep_auth) {
		this.ep_auth = ep_auth;
	}

	@Override
	public String toString() {
		return "ParticEvtDto [ef_id=" + ef_id + ", mi_nck=" + mi_nck + ", ep_auth=" + ep_auth + "]";
	}
	
}
