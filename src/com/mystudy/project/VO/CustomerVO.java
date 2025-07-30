package com.mystudy.project.VO;

import java.sql.Date;

public class CustomerVO {
	private String id;
	private String name;
	private String pwd;
	private String addr;
	private String phone;
	private String email;
	private Date regdate;
	private String zip;
	private String addr2;
	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "CustomerVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", addr=" + addr + ", phone=" + phone
				+ ", email=" + email + ", regdate=" + regdate + ", zip=" + zip + ", addr2=" + addr2 + "]";
	}
	
	
}
