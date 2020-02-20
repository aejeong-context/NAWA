package com.min.app.dto.util;

import java.io.Serializable;

public class NotifUtilDto implements Serializable {

	private static final long serialVersionUID = -2501534932775623630L;

	private String un_con;
	private String ef_id ;
	private String mr_id ;
	
	public NotifUtilDto() {
	}

	public NotifUtilDto(String un_con, String ef_id, String mr_id) {
		super();
		this.un_con = un_con;
		this.ef_id = ef_id;
		this.mr_id = mr_id;
	}

	public String getUn_con() {
		return un_con;
	}

	public void setUn_con(String un_con) {
		this.un_con = un_con;
	}

	public String getEf_id() {
		return ef_id;
	}

	public void setEf_id(String ef_id) {
		this.ef_id = ef_id;
	}

	public String getMr_id() {
		return mr_id;
	}

	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}

	@Override
	public String toString() {
		return "NotifUtilDto [un_con=" + un_con + ", ef_id=" + ef_id + ", mr_id=" + mr_id + "]";
	}
	
}
