package com.mystudy.project.VO;

import java.sql.Date;

public class QnaVO {
	private int qnaNum;
	private String id;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaPwd;
	private String qnaInfo;
	
	
	public String getQnaInfo() {
		return qnaInfo;
	}
	public void setQnaInfo(String qnaInfo) {
		this.qnaInfo = qnaInfo;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaPwd() {
		return qnaPwd;
	}
	public void setQnaPwd(String qnaPwd) {
		this.qnaPwd = qnaPwd;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qnaNum=" + qnaNum + ", id=" + id + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent
				+ ", qnaDate=" + qnaDate + ", qnaPwd=" + qnaPwd + "]";
	}
}
