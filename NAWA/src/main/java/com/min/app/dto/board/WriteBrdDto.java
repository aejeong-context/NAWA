package com.min.app.dto.board;

import java.io.Serializable;
import java.util.Date;

public class WriteBrdDto implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -250452232834176160L;
	private int nb_seq;
	private String mi_nck;
	private String nb_title;
	private String nb_con;
	private String uc_id;
	private String uc_name;
	private String nb_dfl;
	private Date nb_rgd;
	private String mr_auth;
	private String mr_id;
	private int fi_seq;
	private String fi_lc;
	private String fi_div;
	private int fi_size;
	private String fi_originname;
	private String fi_storedname;
	
	private int ef_id;
	
	public WriteBrdDto() {
	}

	public WriteBrdDto(int nb_seq, String mi_nck, String nb_title, String nb_con, String uc_id, String uc_name,
			String nb_dfl, Date nb_rgd, String mr_auth, String mr_id, int fi_seq, String fi_lc, String fi_div,
			int fi_size, String fi_originname, String fi_storedname, int ef_id) {
		super();
		this.nb_seq = nb_seq;
		this.mi_nck = mi_nck;
		this.nb_title = nb_title;
		this.nb_con = nb_con;
		this.uc_id = uc_id;
		this.uc_name = uc_name;
		this.nb_dfl = nb_dfl;
		this.nb_rgd = nb_rgd;
		this.mr_auth = mr_auth;
		this.mr_id = mr_id;
		this.fi_seq = fi_seq;
		this.fi_lc = fi_lc;
		this.fi_div = fi_div;
		this.fi_size = fi_size;
		this.fi_originname = fi_originname;
		this.fi_storedname = fi_storedname;
		this.ef_id = ef_id;
	}

	public int getNb_seq() {
		return nb_seq;
	}

	public void setNb_seq(int nb_seq) {
		this.nb_seq = nb_seq;
	}

	public String getMi_nck() {
		return mi_nck;
	}

	public void setMi_nck(String mi_nck) {
		this.mi_nck = mi_nck;
	}

	public String getNb_title() {
		return nb_title;
	}

	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}

	public String getNb_con() {
		return nb_con;
	}

	public void setNb_con(String nb_con) {
		this.nb_con = nb_con;
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

	public String getNb_dfl() {
		return nb_dfl;
	}

	public void setNb_dfl(String nb_dfl) {
		this.nb_dfl = nb_dfl;
	}

	public Date getNb_rgd() {
		return nb_rgd;
	}

	public void setNb_rgd(Date nb_rgd) {
		this.nb_rgd = nb_rgd;
	}

	public String getMr_auth() {
		return mr_auth;
	}

	public void setMr_auth(String mr_auth) {
		this.mr_auth = mr_auth;
	}

	public String getMr_id() {
		return mr_id;
	}

	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}

	public int getFi_seq() {
		return fi_seq;
	}

	public void setFi_seq(int fi_seq) {
		this.fi_seq = fi_seq;
	}

	public String getFi_lc() {
		return fi_lc;
	}

	public void setFi_lc(String fi_lc) {
		this.fi_lc = fi_lc;
	}

	public String getFi_div() {
		return fi_div;
	}

	public void setFi_div(String fi_div) {
		this.fi_div = fi_div;
	}

	public int getFi_size() {
		return fi_size;
	}

	public void setFi_size(int fi_size) {
		this.fi_size = fi_size;
	}

	public String getFi_originname() {
		return fi_originname;
	}

	public void setFi_originname(String fi_originname) {
		this.fi_originname = fi_originname;
	}

	public String getFi_storedname() {
		return fi_storedname;
	}

	public void setFi_storedname(String fi_storedname) {
		this.fi_storedname = fi_storedname;
	}

	public int getEf_id() {
		return ef_id;
	}

	public void setEf_id(int ef_id) {
		this.ef_id = ef_id;
	}

	@Override
	public String toString() {
		return "WriteBrdDto [nb_seq=" + nb_seq + ", mi_nck=" + mi_nck + ", nb_title=" + nb_title + ", nb_con=" + nb_con
				+ ", uc_id=" + uc_id + ", uc_name=" + uc_name + ", nb_dfl=" + nb_dfl + ", nb_rgd=" + nb_rgd
				+ ", mr_auth=" + mr_auth + ", mr_id=" + mr_id + ", fi_seq=" + fi_seq + ", fi_lc=" + fi_lc + ", fi_div="
				+ fi_div + ", fi_size=" + fi_size + ", fi_originname=" + fi_originname + ", fi_storedname="
				+ fi_storedname + ", ef_id=" + ef_id + "]";
	}

	
	
	
}
