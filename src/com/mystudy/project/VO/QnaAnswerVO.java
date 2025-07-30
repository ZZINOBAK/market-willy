package com.mystudy.project.VO;

import java.sql.Date;

public class QnaAnswerVO {
	private int ansNum;
	private String ansTitle;
	private String ansContent;
	private Date ansDate;
	
	public int getAnsNum() {
		return ansNum;
	}
	public void setAnsNum(int ansNum) {
		this.ansNum = ansNum;
	}
	public String getAnsTitle() {
		return ansTitle;
	}
	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}
	public String getAnsContent() {
		return ansContent;
	}
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	public Date getAnsDate() {
		return ansDate;
	}
	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}
	
	@Override
	public String toString() {
		return "QnaAnswerVO [ansNum=" + ansNum + ", ansTitle=" + ansTitle + ", ansContent=" + ansContent + ", ansDate="
				+ ansDate + "]";
	}
}
