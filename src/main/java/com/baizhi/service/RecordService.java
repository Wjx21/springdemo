package com.baizhi.service;

import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;

import java.util.List;

public interface RecordService {
	List<Record> selectAll(int aid);
	
	void add(Record record); 
	Record selectByUid(int uid, int aid);
	void update(Record record);
	void delete(int id);
	List<RecordDTO> selectByAid(int aid);
}
