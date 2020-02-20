package com.min.app.dto.file;

import java.io.Serializable;

public class AttachFileDto implements Serializable {

   private static final long serialVersionUID = 984994395810021407L;

   private int bi_seq;
   private String ef_id;
   private int fi_seq;
   private String mr_id;
   
   public AttachFileDto() {
   }

   public AttachFileDto(int bi_seq, String ef_id, int fi_seq, String mr_id) {
      super();
      this.bi_seq = bi_seq;
      this.ef_id = ef_id;
      this.fi_seq = fi_seq;
      this.mr_id = mr_id;
   }

   public int getBi_seq() {
      return bi_seq;
   }

   public void setBi_seq(int bi_seq) {
      this.bi_seq = bi_seq;
   }

   public String getEf_id() {
      return ef_id;
   }

   public void setEf_id(String ef_id) {
      this.ef_id = ef_id;
   }

   public int getFi_seq() {
      return fi_seq;
   }

   public void setFi_seq(int fi_seq) {
      this.fi_seq = fi_seq;
   }

   public String getMr_id() {
      return mr_id;
   }

   public void setMr_id(String mr_id) {
      this.mr_id = mr_id;
   }

   @Override
   public String toString() {
      return "AttachFileDto [bi_seq=" + bi_seq + ", ef_id=" + ef_id + ", fi_seq=" + fi_seq + ", mr_id=" + mr_id + "]";
   }

   
}