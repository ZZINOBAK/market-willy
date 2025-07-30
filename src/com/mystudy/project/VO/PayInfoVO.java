package com.mystudy.project.VO;

import java.util.Date;

public class PayInfoVO {
	private int payNum;
	private String receiver;
	private String oAddr;
	private String addr;
	private String oPhone;
	private String oPayment;
	private int price;
	private int saleprice;
	private Date oDate;
	private int payprice;
	private int info;
	private int oCount;
	private String productName;
	private String id;
	private String zip;
	private String addr2;
	
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}



	public String getoAddr() {
		return oAddr;
	}



	public void setoAddr(String oAddr) {
		this.oAddr = oAddr;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public String getoPhone() {
		return oPhone;
	}



	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}



	public String getoPayment() {
		return oPayment;
	}



	public void setoPayment(String oPayment) {
		this.oPayment = oPayment;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getSaleprice() {
		return saleprice;
	}



	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}



	public Date getoDate() {
		return oDate;
	}



	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}



	public int getPayprice() {
		return payprice;
	}



	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}



	public int getInfo() {
		return info;
	}



	public void setInfo(int info) {
		this.info = info;
	}



	public int getoCount() {
		return oCount;
	}



	public void setoCount(int oCount) {
		this.oCount = oCount;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



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



	@Override
	public String toString() {
		return "PayInfoVO [payNum=" + payNum + ", receiver=" + receiver + ", oAddr=" + oAddr + ", addr=" + addr
				+ ", oPhone=" + oPhone + ", oPayment=" + oPayment + ", price=" + price + ", saleprice=" + saleprice
				+ ", oDate=" + oDate + ", payprice=" + payprice + ", info=" + info + ", oCount=" + oCount
				+ ", productName=" + productName + ", id=" + id + ", zip=" + zip + ", addr2=" + addr2 + "]";
	}



	public void comPayPrice() {
		this.payprice = this.price * this.oCount;
	}
	public String getoNum() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
