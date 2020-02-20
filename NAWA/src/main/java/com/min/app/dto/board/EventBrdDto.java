package com.min.app.dto.board;

import java.io.Serializable;

public class EventBrdDto implements Serializable {

	private static final long serialVersionUID = 5388430412463743133L;

	private int eb_seq;
	private String mi_nck;
	private int ef_id;
	private String uc_id;
	private String eb_con;
	private String eb_dfl;
	private String eb_rgd;
	private int eb_refer;
	private int eb_step;
	private String fi_storedname;

	public EventBrdDto() {
	}

	public EventBrdDto(int eb_seq, String mi_nck, int ef_id, String uc_id, String eb_con, String eb_dfl, String eb_rgd,
			int eb_refer, int eb_step) {
		super();
		this.eb_seq = eb_seq;
		this.mi_nck = mi_nck;
		this.ef_id = ef_id;
		this.uc_id = uc_id;
		this.eb_con = eb_con;
		this.eb_dfl = eb_dfl;
		this.eb_rgd = eb_rgd;
		this.eb_refer = eb_refer;
		this.eb_step = eb_step;
	}

	public int getEb_seq() {
		return eb_seq;
	}

	public void setEb_seq(int eb_seq) {
		this.eb_seq = eb_seq;
	}

	public String getMi_nck() {
		return mi_nck;
	}

	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}

	public int getEf_id() {
		return ef_id;
	}

	public void setEf_id(int ef_id) {
		this.ef_id = ef_id;
	}

	public String getUc_id() {
		return uc_id;
	}

	public void setUc_id(String uc_id) {
		this.uc_id = uc_id;
	}

	public String getEb_con() {
		return eb_con;
	}

	public void setEb_con(String eb_con) {
		this.eb_con = eb_con;
	}

	public String getEb_dfl() {
		return eb_dfl;
	}

	public void setEb_dfl(String eb_dfl) {
		this.eb_dfl = eb_dfl;
	}

	public String getEb_rgd() {
		return eb_rgd;
	}

	public void setEb_rgd(String eb_rgd) {
		this.eb_rgd = eb_rgd;
	}

	public int getEb_refer() {
		return eb_refer;
	}

	public void setEb_refer(int eb_refer) {
		this.eb_refer = eb_refer;
	}

	public int getEb_step() {
		return eb_step;
	}

	public void setEb_step(int eb_step) {
		this.eb_step = eb_step;
	}

	public String getFi_storedname() {
		return fi_storedname;
	}

	public void setFi_storedname(String fi_storedname) {
		this.fi_storedname = fi_storedname;
	}

	@Override
	public String toString() {
		return "EventBrdDto [eb_seq=" + eb_seq + ", mi_nck=" + mi_nck + ", ef_id=" + ef_id + ", uc_id=" + uc_id
				+ ", eb_con=" + eb_con + ", eb_dfl=" + eb_dfl + ", eb_rgd=" + eb_rgd + ", eb_refer=" + eb_refer
				+ ", eb_step=" + eb_step + ", fi_storedname=" + fi_storedname + "]";
	}
	
	
}
