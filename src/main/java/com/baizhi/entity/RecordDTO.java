package com.baizhi.entity;

import java.util.Date;

public class RecordDTO {
	private Date time;
	private double price;
	private String name;
	public RecordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecordDTO(Date time, double price, String name) {
		super();
		this.time = time;
		this.price = price;
		this.name = name;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "RecordDTO [time=" + time + ", price=" + price + ", name="
				+ name + "]";
	}
	
}
