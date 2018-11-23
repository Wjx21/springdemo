package com.baizhi.service.impl;

import com.baizhi.dao.RecordDao;
import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;

	@Override
	public List<Record> selectAll(int aid) {
		return recordDao.selectAll(aid);
	}


	@Override
	public void add(Record record) {
		Record record2 = recordDao.selectByUid(record.getUid(), record.getAid());
		if(record2!=null){
			recordDao.update(record);
		}else{
			recordDao.insert(record);
		}
	}

	@Override
	public Record selectByUid(int uid, int aid) {
		
		return recordDao.selectByUid(uid, aid);
	}

	@Override
	public void update(Record record) {
		recordDao.update(record);
	}

	@Override
	public void delete(int id) {
		recordDao.delete(id);
	}


	@Override
	public List<RecordDTO> selectByAid(int aid) {
		
		return recordDao.selectByAid(aid);
	}

}
