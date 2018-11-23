package com.baizhi.service.impl;

import com.baizhi.dao.AuctionDao;
import com.baizhi.entity.Auction;
import com.baizhi.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionServiceImpl implements AuctionService {
	@Autowired
	private AuctionDao auctionDao;

	@Override
	public Auction selectOne(int id) {
		
		return auctionDao.selectOne(id);
	}

	@Override
	public void insert(Auction auction) {
		auctionDao.insert(auction);
	}

	@Override
	public void delete(int id) {
		auctionDao.delete(id);
	}

	@Override
	public void update(Auction auction) {
		auctionDao.update(auction);
	}



	@Override
	public List<Auction> selectAll(String name, String desc, String startTime,
			String endTime, Double satrtPrice) {
		if(name==null||"".equals(name)){
			name=null;
		}else{
			name="%"+name+"%";

		}

		if(desc==null||"".equals(desc)){
			desc=null;
		}else{
			desc = "%"+desc+"%";
		}
		return auctionDao.selectAll(name, desc, startTime, endTime, satrtPrice);
	}

}
