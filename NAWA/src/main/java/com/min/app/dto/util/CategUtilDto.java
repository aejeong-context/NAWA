package com.min.app.dto.util;

import java.io.Serializable;

public class CategUtilDto implements Serializable {

	private static final long serialVersionUID = -7644724155178401892L;

	private String uc_id;
	private String uc_name;
	
	public CategUtilDto() {
	}

	public CategUtilDto(String uc_id, String uc_name) {
		super();
		this.uc_id = uc_id;
		this.uc_name = uc_name;
	}

	public String getUc_id() {
		return uc_id;
	}

	public void setUc_id(String uc_id) {
		this.uc_id = uc_id;
	}

	public String getUc_name() {
		return uc_name;
	}

	public void setUc_name(String uc_name) {
		this.uc_name = uc_name;
	}

	@Override
	public String toString() {
		return "CategUtilDto [uc_id=" + uc_id + ", uc_name=" + uc_name + "]";
	}
	
}
