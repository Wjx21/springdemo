package com.baizhi.service;

import com.baizhi.entity.Auction;

import java.util.List;

public interface AuctionService {
	List<Auction> selectAll(String name, String desc, String startTime, String endTime, Double startPrice);
	Auction selectOne(int id);
	void insert(Auction auction);
	void delete(int id);
	void update(Auction auction);
}
