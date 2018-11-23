package com.baizhi.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Auction {
	private int id;
	private String name;

	private double startPirce;
	private double upset;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	private String pic;
	private String desc;
	public Auction() {
		super();
	}
	@Override
	public String toString() {
		return "Auction [id=" + id + ", name=" + name + ", startPrice="
				+ startPirce + ", upset=" + upset + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", pic=" + pic + ", desc=" + desc
				+ "]";
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
	public double getStartPrice() {
		return startPirce;
	}
	public void setStartPrice(double startPrice) {
		this.startPirce = startPrice;
	}
	public double getUpset() {
		return upset;
	}
	public void setUpset(double upset) {
		this.upset = upset;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Auction(int id, String name, double startPrice, double upset,
			Date startTime, Date endTime, String pic, String desc) {
		super();
		this.id = id;
		this.name = name;
		this.startPirce = startPrice;
		this.upset = upset;
		this.startTime = startTime;
		this.endTime = endTime;
		this.pic = pic;
		this.desc = desc;
	}
	
	
}
