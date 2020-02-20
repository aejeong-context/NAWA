package com.min.app.dto.file;

import java.io.Serializable;

public class InformFileDto implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 8719511693880080705L;
	private int fi_seq;
	private String fi_originname;
	private String fi_storedname;
	private long fi_size;
	private String fi_lc;
   
   private AttachFileDto attachfiledto;
   
   
   public InformFileDto() {
      // TODO Auto-generated constructor stub
   }


public InformFileDto(int fi_seq, String fi_originname, String fi_storedname, long fi_size, String fi_lc) {
	super();
	this.fi_seq = fi_seq;
	this.fi_originname = fi_originname;
	this.fi_storedname = fi_storedname;
	this.fi_size = fi_size;
	this.fi_lc = fi_lc;
}


public InformFileDto(String fi_originname, String fi_storedname, long fi_size, String fi_lc) {
	super();
	this.fi_originname = fi_originname;
	this.fi_storedname = fi_storedname;
	this.fi_size = fi_size;
	this.fi_lc = fi_lc;
}


public int getFi_seq() {
	return fi_seq;
}


public void setFi_seq(int fi_seq) {
	this.fi_seq = fi_seq;
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


public long getFi_size() {
	return fi_size;
}


public void setFi_size(long fi_size) {
	this.fi_size = fi_size;
}


public String getFi_lc() {
	return fi_lc;
}


public void setFi_lc(String fi_lc) {
	this.fi_lc = fi_lc;
}


public AttachFileDto getAttachfiledto() {
	return attachfiledto;
}


public void setAttachfiledto(AttachFileDto attachfiledto) {
	this.attachfiledto = attachfiledto;
}


@Override
public String toString() {
	return "InformFileDto [fi_seq=" + fi_seq + ", fi_originname=" + fi_originname + ", fi_storedname=" + fi_storedname
			+ ", fi_size=" + fi_size + ", fi_lc=" + fi_lc + ", attachfiledto=" + attachfiledto + "]";
}
   
   
}