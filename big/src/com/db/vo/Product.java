package com.db.vo;

import java.sql.Date;

public class Product {
	
	private int id;         ///////////////
	private String name;	
	private int price;		///////////////
	private Date regdate;	///////////////
	private String img;
	
	public Product(){}
	public Product(int id, String name, int price, Date regdate, String img) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.regdate = regdate;
		this.img = img;
	}
	public Product(String name, int price, String img, int id) { /////////////////////////
		this.name = name;
		this.price = price;	
		this.img = img;
		this.id = id;
	}
	public Product(String name, int price, String img) { /////////////////////////
		this.name = name;
		this.price = price;	
		this.img = img;
	}
	
	public Product(int id, String name, int price, String img) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.img = img;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", regdate=" + regdate + ", img=" + img
				+ "]";
	}
	
}
