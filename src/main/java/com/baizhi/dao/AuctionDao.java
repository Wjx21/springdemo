package com.baizhi.dao;

import com.baizhi.entity.Auction;
import org.apache.ibatis.annotations.Param;

import java.util.List;



public interface AuctionDao {
	List<Auction> selectAll(@Param("name") String name, @Param("desc") String desc, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("startPrice") Double startPrice);
	Auction selectOne(int id);
	
	void insert(Auction auction);
	void delete(int id);
	void update(Auction auction);
}
