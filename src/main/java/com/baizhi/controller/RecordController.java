package com.baizhi.controller;

import com.baizhi.entity.Auction;
import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;
import com.baizhi.entity.User;
import com.baizhi.service.AuctionService;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	private RecordService recordService;
	@Autowired
	private AuctionService auctionService;
	
	
	@RequestMapping("/getRecords")
	public String getRecords(int aid,Map map){
		Auction auction = auctionService.selectOne(aid);
		List<RecordDTO> list = recordService.selectByAid(aid);
		map.put("auction", auction);
		map.put("list", list);
		
		for(RecordDTO o:list){
			System.out.println(o);
		}
		
		return "jingpai";
	}
	
	@RequestMapping("/jingpai")
	public String jingpai(Record record,HttpSession session){
		User user = (User) session.getAttribute("user");
		record.setUid(user.getId());
		recordService.add(record);
		
		return "redirect:/record/getRecords.action?aid="+record.getAid();
	}
}
