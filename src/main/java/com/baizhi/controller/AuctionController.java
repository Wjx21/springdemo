package com.baizhi.controller;

import com.baizhi.entity.Auction;
import com.baizhi.service.AuctionService;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	@Autowired
	private RecordService recordService;
	
	
	@RequestMapping("/selectAll")
	public String selectAll(String name, String desc, String startTimestr, String endTimestr, Double startPrice, Map map) throws UnsupportedEncodingException {
		List<Auction> auctionList = auctionService.selectAll(name, desc, startTimestr, endTimestr, startPrice);
		System.out.println(auctionList.size()+name+"*********"+desc);
		map.put("auctionList", auctionList);
		return "auctionList";
	}
	
	@RequestMapping("/add")
	public String add(Auction auction,MultipartFile myPhoto) throws IllegalStateException, IOException{
		String fileName = myPhoto.getOriginalFilename();
		auction.setPic(fileName);
		System.out.println(auction+"*************************");
		myPhoto.transferTo(new File("C:\\Users\\Administrator\\IdeaProjects\\LastDay02\\springdemo\\src\\main\\webapp\\images\\"+fileName));
		auctionService.insert(auction);
		
		return "redirect:/auction/selectAll.action";
	}
	
	@RequestMapping("/selectOne")
	public String selectOne(int id,Map map){
		map.put("auction", auctionService.selectOne(id));
		
		return "updateAuction";
	}
	
	@RequestMapping("/update")
	public String update(Auction auction,MultipartFile myPhoto) throws IllegalStateException, IOException{
		String fileName = myPhoto.getOriginalFilename();
		System.out.println(fileName);
		
		if(fileName!=null&&!"".equals(fileName)){
			auction.setPic(fileName);
			myPhoto.transferTo(new File("C:\\Users\\Administrator\\IdeaProjects\\LastDay02\\springdemo\\src\\main\\webapp\\images\\"+fileName));
		}
		
		System.out.println(auction+"++++++++++++++");
		auctionService.update(auction);
		
		return "redirect:/auction/selectAll.action";
	}
	
	@RequestMapping("/delete")
	public String delete(int id){
		recordService.delete(id);
		auctionService.delete(id);
		
		return "redirect:/auction/selectAll.action";
	}

}
