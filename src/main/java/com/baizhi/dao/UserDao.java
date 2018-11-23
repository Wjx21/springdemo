package com.baizhi.dao;

import com.baizhi.entity.User;

public interface UserDao {
	User selectOne(User user);
	void insert(User user);
}
