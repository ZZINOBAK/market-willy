package com.mystudy.project.VO;

import java.sql.Date;

public class ProductsVO {
	private int productnum;
	private String categoryMain;
	private String productname;
	private int price;
	private int saleprice;
	private String image;
	private String content;
	private Date regdate;
	private String categorySub;
	private int pcount;
	
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getCategoryMain() {
		return categoryMain;
	}
	public void setCategoryMain(String categoryMain) {
		this.categoryMain = categoryMain;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCategorySub() {
		return categorySub;
	}
	public void setCategorySub(String categorySub) {
		this.categorySub = categorySub;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	
	@Override
	public String toString() {
		return "ProductsVO [productsnum=" + productnum + ", categoryMain=" + categoryMain + ", productname=" + productname + ", price=" + price
				+ ", saleprice=" + saleprice + ", image=" + image + ", content=" + content + ", regdate=" + regdate
				+ ", categorySub=" + categorySub + ", pcount=" + pcount + "]";
	}
	
	
}



