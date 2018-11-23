package com.baizhi.dao;

import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecordDao {
	List<Record> selectAll(int aid);
	void insert(Record record);
	Record selectByUid(@Param("uid") int uid, @Param("aid") int aid);
	void update(Record record);
	void delete(int id);
	List<RecordDTO> selectByAid(int aid);
}
