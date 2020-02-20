package com.min.app.dto.board;

import java.io.Serializable;

public class NoticeBrdDto implements Serializable{
	
	private static final long serialVersionUID = -3900482207953621073L;
	
	private int nb_seq;
	private String mi_nck;
	private String nb_title;
	private String nb_con;
	private String uc_id;
	private String nb_dfl;
	
	public NoticeBrdDto() {
	}

	public NoticeBrdDto(int nb_seq, String mi_nck, String nb_title, String nb_con, String uc_id, String nb_dfl) {
		super();
		this.nb_seq = nb_seq;
		this.mi_nck = mi_nck;
		this.nb_title = nb_title;
		this.nb_con = nb_con;
		this.uc_id = uc_id;
		this.nb_dfl = nb_dfl;
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

	public String getNb_dfl() {
		return nb_dfl;
	}

	public void setNb_dfl(String nb_dfl) {
		this.nb_dfl = nb_dfl;
	}


	@Override
	public String toString() {
		return "NoticeBrdDto [nb_seq=" + nb_seq + ", mi_nck=" + mi_nck + ", nb_title=" + nb_title + ", nb_con=" + nb_con
				+ ", uc_id=" + uc_id + ", nb_dfl=" + nb_dfl+"]";
	}
	
}
