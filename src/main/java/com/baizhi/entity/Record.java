package com.baizhi.entity;

import java.util.Date;

public class Record {
	private int id;
	private int uid;
	private int aid;
	private Date time;
	private double price;
	private User user;
	public Record() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Record(int id, int uid, int aid, Date time, double price, User user) {
		super();
		this.id = id;
		this.uid = uid;
		this.aid = aid;
		this.time = time;
		this.price = price;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Record [id=" + id + ", uid=" + uid + ", aid=" + aid + ", time="
				+ time + ", price=" + price + ", user=" + user + "]";
	}
	
	
	
}
