package com.mystudy.project.VO;

import java.sql.Date;

public class ReviewVO {
   private int onum;
   private String id;
   private int productnum;
   private String rtitle;
   private String rcontent;
   private Date rdate;
   public int getOnum() {
      return onum;
   }
   public void setOnum(int onum) {
      this.onum = onum;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getProductnum() {
      return productnum;
   }
   public void setProductnum(int productnum) {
      this.productnum = productnum;
   }
   public String getRtitle() {
      return rtitle;
   }
   public void setRtitle(String rtitle) {
      this.rtitle = rtitle;
   }
   public String getRcontent() {
      return rcontent;
   }
   public void setRcontent(String rcontent) {
      this.rcontent = rcontent;
   }
   public Date getrdate() {
      return rdate;
   }
   public void setrdate(Date rdate) {
      this.rdate = rdate;
   }

   @Override
   public String toString() {
      return "ReviewVO [onum=" + onum + ", id=" + id + ", productnum=" + productnum + ", rtitle=" + rtitle
            + ", rcontent=" + rcontent + ", tdate=" + rdate +  "]";
   }
   
   
}
